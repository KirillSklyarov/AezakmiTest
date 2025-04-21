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
        SignInContentView(viewModel: viewModel)
            .onAppear {
                viewModel.setDependencies(authManager, router)
            }
            .applyAuthErrorAlert(
                type: .signIn,
                alert: viewModel.alert,
                isAlertPresented: $viewModel.isAlertPresented
            )
    }
}




#Preview {
//    let router = AppRouter()
//    let authManager = AuthManager()

    SignInView()
//        .environment(authManager)
//        .environment(router)
}
