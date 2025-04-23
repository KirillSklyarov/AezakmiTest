//
//  PictureMainViewModel.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
import PhotosUI

protocol PictureMainViewModeling {
    func setDependencies(_ authManager: AuthManager, _ router: AppRouting)
    func logout()
}

@Observable
final class PictureMainViewModel: PictureMainViewModeling {

    private var router: AppRouting?
    private var authManager: AuthManager?

    var selectedImage: Image?
//    private var data = RegistrationData()

//    var state: ViewModelState = .success
//    private(set) var alert: AlertItem?
//    var isAlertPresented: Bool = false
//
//    // MARK: - Public methods
    func setDependencies(_ authManager: AuthManager, _ router: AppRouting) {
        self.authManager = authManager
        self.router = router
    }

    func logout() {
        authManager?.signOut()
        router?.backToRoot()
    }

    func loadImage(_ newItem: PhotosPickerItem?) {
        Task {
            if let newItem,
               let data = try? await newItem.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                selectedImage = Image(uiImage: image)
            }
        }
    }
}
