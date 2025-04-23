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

    @State private var viewModel = PictureMainViewModel()

    var body: some View {
        ContentPhotoPickerView(viewModel: viewModel)
            .onAppear {
                viewModel.setDependencies(authManager, appRouter)
            }
            .applyBaseScreenView()
    }
}



//            AppButton(type: .category, title: "Выход из профиля") {
//                viewModel.logout()
//            }

#Preview {
    let authManager = AuthManager()
    let appRouter = AppRouter()

    PictureMainView()
        .environment(authManager)
        .environment(appRouter)
}
