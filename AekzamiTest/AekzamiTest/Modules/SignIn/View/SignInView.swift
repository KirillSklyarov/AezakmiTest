//
//  EnterView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

struct SignInView: View {

    @Environment(AppRouter.self) private var router
    @Environment(AuthManager.self) private var authManager
    @State private var viewModel = SignInViewModel()

    var body: some View {
        ZStack {
            SignInContentView(viewModel: viewModel)
                .onAppear {
                    viewModel.setDependencies(authManager, router)
                }
                .sheet(isPresented: $viewModel.isSuccessIndicatorPresented) {
                    SuccessIndicatorView {
                        viewModel.goToMainMenu()
                    }
                    .presentationDetents([.medium])
                }
            showLoading()
            showErrorAlert()
        }
    }

    @ViewBuilder
    func showLoading() -> some View {
        if viewModel.state == .loading {
            LoadingIndicator()
        }
    }

    @ViewBuilder
    func showErrorAlert() -> some View {
        if viewModel.state == .error {
            AuthErrorAlertView(
                type: .signIn,
                alert: viewModel.alert,
                isAlertPresented: $viewModel.isAlertPresented,
                okAction: nil
            )
        }
    }
}




#Preview {
//    let router = AppRouter()
//    let authManager = AuthManager()

    SignInView()
//        .environment(authManager)
//        .environment(router)
}
