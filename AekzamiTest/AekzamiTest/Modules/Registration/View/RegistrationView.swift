//
//  ContentView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

struct RegistrationView: View {

//    @Environment(AppRouter.self) private var router
//    @Environment(AuthManager.self) private var authManager
    @State private var viewModel = RegistrationViewModel()

    var body: some View {
        RegistrationContentView(viewModel: viewModel)
//            .onAppear {
//                viewModel.setDependencies(authManager, router)
//            }
//            .applyAuthErrorAlert(
//                alert: viewModel.alert,
//                isAlertPresented: $viewModel.isAlertPresented
//            )
    }
}



#Preview {
//    let router = AppRouter()
//    let authManager = AuthManager()

    NavigationStack {
        RegistrationView()
//            .applyRouterConfiguration(router: router)
//            .environment(authManager)
//            .environment(router)
    }
}
