//
//  EnterViewModeling.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

protocol ResetPasswordModeling {
    func resetPassword()
    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String>
    func setDependencies(_ authManager: AuthManager, _ router: AppRouting)

    func backToPreviousScreen()
}

@Observable
final class ResetPasswordViewModel: ResetPasswordModeling {

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

    func resetPassword() {
        guard emailValidation() else { return }

        authManager?.resetPassword(email: data.email) { [weak self] in
            guard let self else { return }
            switch $0 {
            case .success(_):
                alert = AlertItem(message: "✅ Письмо с инструкциями по восстановлению пароля отправлено")
//                router?.show(.mainMenu)
            case .failure(let error):
                showAlert(with: error)
            }
        }
    }


    func backToPreviousScreen() {
        router?.popLast()
    }

    func binding(for keyPath: WritableKeyPath<RegistrationData, String>) -> Binding<String> {
        Binding(get: { self.data[keyPath: keyPath] },
                set: { self.data[keyPath: keyPath] = $0 } )
    }
}

private extension ResetPasswordViewModel {
    func showAlert(with error: any Error) {
        alert = authManager?.authErrorHandler(error)
        isAlertPresented = true
    }

    func emailValidation() -> Bool {
        if data.email.isEmpty {
            alert = AlertItem(message: "Email не заполнен")
            isAlertPresented = true
            return false
        } else {
            return true
        }
    }
}
