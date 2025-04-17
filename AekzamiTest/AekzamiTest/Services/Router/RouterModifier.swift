//
//  RouterMod.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

//struct RouterModifier: ViewModifier {
//
//    let router: AppRouter
//
//    func body(content: Content) -> some View {
//        content
//            .fullScreenCover(isPresented: Bindable(router).presentingFullScreenCover) {
//                NavigationStack(path: Bindable(router).routes) {
//                    router.fullScreenCoverDestination
//                        .navigationDestination(for: AppModule.self) {
//                            module in
//                            AnyView(module.view)
//                        }
//                }
//                .tint(.white)
//            }
//    }
//}

struct RouterModifier2: ViewModifier {

    let router: AppRouter

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: AppModule.self) {
                module in
                AnyView(module.view)
            }
            .fullScreenCover(isPresented: Bindable(router).presentingFullScreenCover) {
                router.fullScreenCoverDestination
            }
    }
}

extension View {
//    func applyRouterConfiguration(router: AppRouter) -> some View {
//        modifier(RouterModifier(router: router))
//    }

    func applyRouterConfiguration2(router: AppRouter) -> some View {
        modifier(RouterModifier2(router: router))
    }
}
