//
//  ImagePickerView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 23.04.2025.
//

import SwiftUI
import PhotosUI
import UIKit

struct ContentPhotoPickerView: View {
    @State var selectedItem: PhotosPickerItem?
    @State var showingActionSheen = false
    @State private var showPhotoPicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary

    var viewModel: PictureMainViewModel

    var body: some View {
        VStack(spacing: 50) {
            if let selectedImage = viewModel.selectedImage {
                selectedImage
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
            }

            Button {
                showingActionSheen = true
            } label: {
                AppLabel(type: .choosePhoto)
            }
            .confirmationDialog(
                "Выберите источника",
                isPresented: $showingActionSheen) {
                    Button("Камера") {
                        sourceType = .camera
                    }
                    Button("Выбрать из галереи") {
                        sourceType = .photoLibrary
                        showPhotoPicker = true
                    }
                }
        }
        .padding(.horizontal)
        .sheet(isPresented: $showPhotoPicker) {
            GalleryPicker(sourceType: sourceType) { photo in
                viewModel.setImage(photo)
            }
        }
    }
}

//#Preview {
//    PhotoPickerView()
//}
