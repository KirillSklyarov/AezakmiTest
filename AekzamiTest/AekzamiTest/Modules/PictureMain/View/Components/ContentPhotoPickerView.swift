//
//  ImagePickerView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 23.04.2025.
//

import SwiftUI
import PhotosUI

struct ContentPhotoPickerView: View {
    @State var selectedItem: PhotosPickerItem?
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

            PhotosPicker(
                selection: $selectedItem,
                matching: .images) {
                    AppLabel(type: .choosePhoto)
                }
                .onChange(of: selectedItem) { _, newItem in
                    viewModel.loadImage(newItem)
                }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    PhotoPickerView()
//}
