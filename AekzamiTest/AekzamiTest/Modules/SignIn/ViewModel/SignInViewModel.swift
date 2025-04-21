//
//  EnterViewModel.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

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

    private(set) var alert: AlertItem?
    var isAlertPresented: Bool = false

    // MARK: - Public methods
    func setDependencies(_ authManager: AuthManager, _ router: AppRouting) {
        self.authManager = authManager
        self.router = router
    }

    func signIn() {
        authManager?.signIn(email: data.email, password: data.password) { [weak self] in
            guard let self else { return }
            switch $0 {
            case .success(_):
                print("✅ Authorization successful")
                router?.show(.mainMenu)
            case .failure(let error):
                alert = authManager?.authErrorHandler(error)
                isAlertPresented = true
            }
        }
    }

    func signInWithGoogle() {
        authManager?.signInWithGoogle() { [weak self] in
            self?.router?.show(.mainMenu)
        }
    }

    func backToRegistration() {
        router?.popLast()
    }

    func goToResetPassword() {
        router?.show(.resetPassword)
    }

    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String> {
        Binding(get: { self.data[keyPath: keyPath] },
                set: { self.data[keyPath: keyPath] = $0 } )
    }
}
