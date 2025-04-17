//
//  AekzamiTestApp.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

@main
struct AekzamiTestApp: App {

    @Environment(AppRouter.self) var router
    @Environment(AuthManager.self) var authManager

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: Bindable(router).routes) {
                RegistrationView()
                    .applyRouterConfiguration2(router: router)
                    .environment(router)
                    .environment(authManager)
            }
        }
    }
}
