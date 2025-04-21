//
//  AekzamiTestApp.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
import GoogleSignIn

@main
struct AekzamiTestApp: App {

    private let startAppManager = StartAppManager()

    var body: some Scene {
        WindowGroup {
            startAppManager.startApp()
                .onOpenURL { url in
                    print("Here")
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
