//
//  AekzamiTestApp.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

@main
struct AekzamiTestApp: App {

    private let startAppManager = StartAppManager()

    var body: some Scene {
        WindowGroup {
            startAppManager.startApp()
        }
    }
}
