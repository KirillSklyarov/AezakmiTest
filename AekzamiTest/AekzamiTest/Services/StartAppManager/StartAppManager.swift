//
//  StartAppManager.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
import Firebase

final class StartAppManager {

    private let authManager: AuthManager
    private let router: AppRouter

//    private let dataStore: Store
//    private let networkService: NetworkService

    init() {
        FirebaseApp.configure()
        self.authManager = AuthManager()
        self.router = AppRouter()

//        self.dataStore = Store()

//        let networkClient = NetworkClient(decoder: JSONDecoder(),
//                                          encoder: JSONEncoder(),
//                                          session: URLSession(configuration: .default))
//
//        self.networkService = NetworkService(networkClient: networkClient)
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
//        .environment(dataStore)
//        .environment(networkService)
    }
}
