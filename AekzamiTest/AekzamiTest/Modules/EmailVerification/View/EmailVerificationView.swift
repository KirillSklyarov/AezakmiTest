//
//  EmailVerificationView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 21.04.2025.
//

import SwiftUI

struct EmailVerificationView: View {

    @Environment(AppRouter.self) var router
    @Environment(AuthManager.self) var authManager
    @State private var viewModel = EmailVerificationViewModel()

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            TextLabelsView(email: viewModel.email)

            // Кнопка повторной отправки
            Button {
                viewModel.resendEmail()
            } label: {
                ResendEmailVerificationView(isResendingEmail: $viewModel.isResendingEmail)
            }
            .disabled(viewModel.isResendingEmail)

            AppButton(type: .backToLogin) {
                viewModel.goToSignIn()
            }
            Spacer()
        }
        .overlay(alignment: .top) {
            showToastView()
        }
        .onAppear {
            viewModel.setDependencies(authManager: authManager, router: router)
        }
        .padding()
        .applyBaseScreenView()
    }

    @ViewBuilder
    private func showToastView() -> some View {
        Group {
            if viewModel.showResendSuccess {
                ToastView(message: "Письмо отправлено повторно")
            }
        }
        .animation(.easeInOut, value: viewModel.showResendSuccess)
    }
}



#Preview {
    let authManager = AuthManager()
    let router = AppRouter()
    var viewModel = EmailVerificationViewModel()
//    viewModel.email = "test@test.com"

    EmailVerificationView()
        .environment(authManager)
        .environment(router)

}

