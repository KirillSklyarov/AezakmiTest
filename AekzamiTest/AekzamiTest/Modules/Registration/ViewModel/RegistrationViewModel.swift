//
//  RegistationViewModel.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
import FirebaseAuth

protocol RegistrationViewModeling: BaseViewModeling {
//    func setDependencies(_ authManager: AuthManager, _ router: AppRouting)
//    func goToEnterScreen()
//    func registerUser()
//    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String>
//    func setState(_ state: ViewModelState)
//
//    var isAlertPresented: Bool { get set }

}

@Observable
final class RegistrationViewModel: RegistrationViewModeling {

    private var router: AppRouting?
    private var authManager: AuthManager?
    private var data = RegistrationData()

//    var state: ViewModelState = .success
    private(set) var alert: AlertItem?
    var isAlertPresented: Bool = false
    var isSuccessIndicatorPresented: Bool = false

//    // MARK: - Public methods
    func setDependencies(_ authManager: AuthManager, _ router: AppRouting) {
        self.authManager = authManager
        self.router = router
    }
//
//    func setState(_ state: ViewModelState) {
//        self.state = state
//    }
//
    func goToEnterScreen() {
        router?.show(.signIn)
    }

    func registerUser() {
        guard userDataValidation() else { return }

        authManager?.registration(email: data.email, password: data.password) { [weak self] in
            guard let self else { return }
            switch $0 {
            case .failure(let error):
                showAlert(with: error)
            case .success(_):
                isSuccessIndicatorPresented = true
                print("✅ Пользователь успешно зарегистрирован")
//                goToEnterUsername()
            }
        }
    }

    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String> {
        Binding(get: { self.data[keyPath: keyPath] },
                set: { self.data[keyPath: keyPath] = $0 } )
    }

    func successIndicatorBinding() -> Binding<Bool> {
        Binding(get: { self.isSuccessIndicatorPresented },
                set: { self.isSuccessIndicatorPresented = $0 } )
    }

    func goToMainMenu() {
        router?.show(.mainMenu)
    }
}

private extension RegistrationViewModel {
    func showAlert(with error: any Error) {
        isAlertPresented = true
        authErrorHandler(error)
    }

    func authErrorHandler(_ error: Error) {
        self.alert = authManager?.authErrorHandler(error)
    }

    func userDataValidation() -> Bool {
        if data.email.isEmpty || data.password.isEmpty {
            alert = AlertItem(message: "Email или пароль не заполнен")
            isAlertPresented = true
            return false
        } else {
            return true
        }
    }
}
