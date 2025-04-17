//
//  PictureMainView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

struct PictureMainView: View {

    @Environment(AuthManager.self) var authManager
    @Environment(AppRouter.self) var appRouter

    @State private var viewModel: PictureMainViewModeling = PictureMainViewModel()

    var body: some View {
        AppButton(type: .category, title: "Выход из профиля") {
            viewModel.logout()
        }
        .onAppear {
            viewModel.setDependencies(authManager, appRouter)
        }
    }
}

#Preview {
    PictureMainView()
}
