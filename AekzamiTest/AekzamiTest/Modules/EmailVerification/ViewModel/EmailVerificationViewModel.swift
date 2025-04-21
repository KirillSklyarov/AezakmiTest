//
//  EmailVerificationViewModel.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 21.04.2025.
//

import Foundation

@Observable
final class EmailVerificationViewModel {
    var email: String = ""
    var authManager: AuthManager?
    var router: AppRouter?

    var isResendingEmail = false
    var showResendSuccess = false


    func setDependencies(authManager: AuthManager, router: AppRouter?) {
        self.authManager = authManager
        self.router = router
        email = authManager.getUserEmailFromFirebase()
    }

    func resendEmail() {
        isResendingEmail = true
        // TODO: добавить метод отправки письма на почту повторно
//        onResendEmail()
        showToast()
        hideToast()
    }

    func goToSignIn() {
        print(#function)
        router?.show(.signIn)
    }
}

private extension EmailVerificationViewModel {
    func showToast() {
        // Имитируем задержку для UI фидбека
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.showResendSuccess = true
        }
    }

    func hideToast() {
        // Скрываем уведомление через 3 секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isResendingEmail = false
            self?.showResendSuccess = false
        }
    }
}
