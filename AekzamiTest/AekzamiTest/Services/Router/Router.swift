//
//  Router.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

protocol AppRouting: AnyObject {
    var routes: [AppModule] { get set }
    var fullScreenCoverDestination: AnyView? { get }
    
    func show(_ type: AppModule)
    func backToRoot()
}

@Observable
final class AppRouter: AppRouting {
    var fullScreenCoverDestination: AnyView?
    var presentingFullScreenCover = false
    var routes: [AppModule] = []

    func show(_ type: AppModule) {
        switch type.isFullScreen {
        case true: presentFullScreenCover(type)
        case false: push(type)
        }
    }

    func backToRoot() {
        reset()
    }
}

// MARK: - Private methods
private extension AppRouter {
    func presentFullScreenCover(_ module: AppModule) {
        let view = module.view
        fullScreenCoverDestination = AnyView(view)
        presentingFullScreenCover = true
    }

    func reset() {
        routes = []
        presentingFullScreenCover = false
        fullScreenCoverDestination = nil
    }

    func push(_ module: AppModule) {
        routes.append(module)
    }
}
