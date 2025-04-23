//
//  EnterViewModel.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

protocol EnterViewModeling {
    func signIn()
    func signInWithGoogle()
    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String>
    func setDependencies(_ authManager: AuthManager, _ router: AppRouting)

    func backToRegistration()
    func goToResetPassword()
}

@Observable
final class SignInViewModel: EnterViewModeling {

    private var router: AppRouting?
    private var authManager: AuthManager?
    private var data = RegistrationData()

    private(set) var state: ViewModelState = .initial
    private(set) var alert: AlertItem?
    var isAlertPresented = false
    var isSuccessIndicatorPresented = false

    // MARK: - Public methods
    func setDependencies(_ authManager: AuthManager, _ router: AppRouting) {
        self.authManager = authManager
        self.router = router
    }

    func setState(_ state: ViewModelState) {
        self.state = state
    }

    func signIn() {
        setState(.loading)
        authManager?.signIn(email: data.email, password: data.password) { [weak self] in
            guard let self else { return }
            switch $0 {
            case .success(_):
                print("✅ Authorization successful")
                isSuccessIndicatorPresented = true
            case .failure(let error):
                setState(.error)
                showAlert(with: error)
            }
        }
    }

    func signInWithGoogle() {
        authManager?.signInWithGoogle() { [weak self] in
            guard let self else { return }
            isSuccessIndicatorPresented = true
        }
    }

    func goToMainMenu() {
        router?.show(.mainMenu)
    }

    func backToRegistration() {
        router?.show(.registration)
    }

    func goToResetPassword() {
        router?.show(.resetPassword)
    }

    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String> {
        Binding(get: { self.data[keyPath: keyPath] },
                set: { self.data[keyPath: keyPath] = $0 } )
    }
}

// MARK: - Private methods
private extension SignInViewModel {
    func showAlert(with error: any Error) {
        alert = authManager?.authErrorHandler(error)
        isAlertPresented = true
    }
}
