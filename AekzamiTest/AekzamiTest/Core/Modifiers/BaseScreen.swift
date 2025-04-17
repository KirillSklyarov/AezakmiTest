//
//  BaseScreen.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

struct BaseScreen: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            AppConstants.AppColor.background
                .edgesIgnoringSafeArea(.all)

            content
        }
    }
}

extension View {
    func applyBaseScreenView() -> some View {
        modifier(BaseScreen())
    }
}
