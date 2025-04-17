//
//  SignInView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

struct ResetPasswordView: View {

    @Environment(AppRouter.self) private var router
    @Environment(AuthManager.self) private var authManager
    @State private var viewModel = ResetPasswordViewModel()

    var body: some View {
        ResetPasswordContentView(viewModel: viewModel)
            .onAppear {
                viewModel.setDependencies(authManager, router)
            }
//            .applyAuthErrorAlert(
//                type: .signIn,
//                alert: viewModel.alert,
//                isAlertPresented: $viewModel.isAlertPresented
//            )
    }
}




#Preview {
    let router = AppRouter()
    let authManager = AuthManager()
    NavigationStack(path: Bindable(router).routes) {
        ResetPasswordView()
            .environment(authManager)
            .environment(router)
    }
}
