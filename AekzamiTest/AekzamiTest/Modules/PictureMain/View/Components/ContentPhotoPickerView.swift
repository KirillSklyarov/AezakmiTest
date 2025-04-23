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
    @State private var showingActionSheen = false
    @State private var showPhotoPicker = false
    @State private var rotationAngle: Angle = .zero
    @State private var isButtonVisible = false

    var viewModel: PictureMainViewModel

    var body: some View {
        VStack {
            Spacer()

            SelectedImageView(selectedImage: viewModel.selectedImage)
                .frame(maxHeight: 500)
                .rotationEffect(rotationAngle)
                .gesture (
                    RotationGesture()
                        .onChanged { value in
                            isButtonVisible = true
                            rotationAngle = value
                        }
                        .onEnded { value in
                            rotationAngle = value
                        }
                )

            Spacer()
            VStack(spacing: 20) {
                showResetRotationButton()

                Button {
                    showingActionSheen = true
                } label: {
                    AppLabel(type: .choosePhoto)
                }
                .confirmationDialog(
                    "Выберите источника",
                    isPresented: $showingActionSheen) {
                        Button("Камера") {
                            viewModel.sourceType = .camera
                            showPhotoPicker = true
                        }
                        Button("Выбрать из галереи") {
                            viewModel.sourceType = .photoLibrary
                            showPhotoPicker = true
                        }
                    }
                    .tint(.primary)
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal)
        .sheet(isPresented: $showPhotoPicker) {
            GalleryPicker(sourceType: viewModel.sourceType) { photo in
                viewModel.setImage(photo)
            }
        }
    }

    @ViewBuilder
    func showResetRotationButton() -> some View {
        AppLabel(type: .resetRotation)
            .onTapGesture { resetRotation() }
            .opacity(isButtonVisible ? 1 : 0)
            .animation(.easeInOut(duration: 0.3), value: isButtonVisible)
    }

    private func resetRotation() {
        withAnimation {
            rotationAngle = .zero
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isButtonVisible = false
        }
    }
}


//#Preview {
//    PhotoPickerView()
//}
