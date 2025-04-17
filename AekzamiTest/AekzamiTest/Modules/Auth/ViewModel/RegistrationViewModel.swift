//
//  RegistationViewModel.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
//import FirebaseAuth

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

//    private var router: AppRouting?
//    private var authManager: AuthManager?
    private var data = RegistrationData()

//    var state: ViewModelState = .success
//    private(set) var alert: AlertItem?
//    var isAlertPresented: Bool = false
//
//    // MARK: - Public methods
//    func setDependencies(_ authManager: AuthManager, _ router: AppRouting) {
//        self.authManager = authManager
//        self.router = router
//    }
//
//    func setState(_ state: ViewModelState) {
//        self.state = state
//    }
//
    func goToEnterScreen() {
//        router?.show(.enter)
    }
//
    func registerUser() {
//        authManager?.registration(email: data.login, password: data.password) { [weak self] result in
//            guard let self else { return }
//            switch result {
//            case .failure(let error):
//                authErrorHandler(error)
//                isAlertPresented = true
//            case .success(_):
//                print("✅ Пользователь успешно зарегистрирован")
//                goToEnterUsername()
//            }
//        }
    }
//
    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String> {
        Binding(get: { self.data[keyPath: keyPath] },
                set: { self.data[keyPath: keyPath] = $0 } )
    }
//}
//
//private extension RegistrationViewModel {
//    func goToEnterUsername() {
//        router?.show(.username)
//    }
//
//    func authErrorHandler(_ error: Error) {
//        print(error.localizedDescription)
//        let nsError = error as NSError
//
//        if let errorCode = AuthErrorCode(rawValue: nsError.code) {
//            alert = getErrorAlert(errorCode)
//        }
//    }
//
//    func getErrorAlert(_ code: AuthErrorCode) -> AlertItem {
//        let alertText = switch code {
//        case .emailAlreadyInUse: "Этот email уже используется"
//        case .invalidEmail: "Некорректный email, проверьте указанный адрес"
//        case .weakPassword: "Пароль должен быть длиннее 6 символов"
//        default: "Другая ошибка аутентификации"
//        }
//        print(alertText)
//        return AlertItem(title: alertText, message: "")
//    }
}
