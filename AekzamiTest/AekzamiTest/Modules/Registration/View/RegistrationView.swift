//
//  ContentView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

struct RegistrationView: View {

    @Environment(AppRouter.self) private var router
    @Environment(AuthManager.self) private var authManager
    @State private var viewModel = RegistrationViewModel()

    var body: some View {
        ZStack {
            RegistrationContentView(viewModel: viewModel)
                .onAppear {
                    viewModel.setDependencies(authManager, router)
                }
            showLoading()
            isShowErrorAlert()
        }
    }

    @ViewBuilder
    func showLoading() -> some View {
        if viewModel.state == .loading {
            LoadingIndicator()
        }
    }

    @ViewBuilder
    func isShowErrorAlert() -> some View {
        if viewModel.state == .error {
            AuthErrorAlertView(
                type: .registration,
                alert: viewModel.alert,
                isAlertPresented: $viewModel.isAlertPresented,
                okAction: nil
            )
        }
    }
}


#Preview {
    let router = AppRouter()
    let authManager = AuthManager()

    NavigationStack(path: Bindable(router).routes) {
        RegistrationView()
            .applyRouterConfiguration2(router: router)
            .environment(authManager)
            .environment(router)
    }
    .tint(.white)
}
