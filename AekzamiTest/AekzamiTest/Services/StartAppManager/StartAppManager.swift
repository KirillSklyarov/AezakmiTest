//
//  StartAppManager.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
import Firebase
import GoogleSignIn

final class StartAppManager {

    private let authManager: AuthManager
    private let router: AppRouter

    init() {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: AppConstants.auth.goggleSignInID.rawValue)
        self.authManager = AuthManager()
        self.router = AppRouter()
    }

    @ViewBuilder
    func startApp() -> some View {
        Group {
            NavigationStack(path: Bindable(router).routes) {
                if authManager.isUserLogIn {
                    PictureMainView()
                        .applyRouterConfiguration2(router: router)
                } else {
                    RegistrationView()
                        .applyRouterConfiguration2(router: router)
                }
            }
        }
        .tint(.white)
        .environment(router)
        .environment(authManager)
    }
}
