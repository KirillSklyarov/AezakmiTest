//
//  AppNavigation.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 13.03.2025.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {

    let title: String

    init(title: String) {
        self.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppConstants.AppColor.background.uiColor
        appearance.shadowColor = .clear
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(title)
    }
}

extension View {
    func applyNavBarConfig(title: String) -> some View {
        modifier(NavigationBarModifier(title: title))
    }
}
