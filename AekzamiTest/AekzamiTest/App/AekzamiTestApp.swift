//
//  AekzamiTestApp.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

@main
struct AekzamiTestApp: App {

    private let router = AppRouter()
    private let authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: Bindable(router).routes) {
                RegistrationView()
                    .applyNavBarConfig(title: "")
                    .applyRouterConfiguration2(router: router)
            }
            .environment(router)
            .environment(authManager)
            .tint(.white)
        }
    }
}
