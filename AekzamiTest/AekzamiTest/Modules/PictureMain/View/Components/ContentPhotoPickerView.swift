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
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    @State private var isRotationButtonVisible = false
    @State private var isScaleButtonVisible = false


    var viewModel: PictureMainViewModel

    var body: some View {
        VStack {
            Spacer()

            SelectedImageView(selectedImage: viewModel.selectedImage)
                .frame(maxHeight: 500)
                .rotationEffect(rotationAngle)
                .scaleEffect(scale)
                .gesture (
                    RotationGesture()
                        .onChanged { value in
                            isRotationButtonVisible = true
                            rotationAngle = value
                        }
                        .onEnded { value in
                            rotationAngle = value
                        }
                        .simultaneously(with: MagnificationGesture()
                            .onChanged { value in
                                isScaleButtonVisible = true
                                scale = lastScale * value
                            }
                            .onEnded { value in
                                lastScale = scale
                            }
                        )
                )

            Spacer()
            VStack(spacing: 20) {

                HStack {
                    showResetRotationButton()
                    showResetScaleButton()
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
            .opacity(isRotationButtonVisible ? 1 : 0)
            .animation(.easeInOut(duration: 0.3), value: isRotationButtonVisible)
    }

    private func resetRotation() {
        withAnimation {
            rotationAngle = .zero
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isRotationButtonVisible = false
        }
    }

    @ViewBuilder
    func showResetScaleButton() -> some View {
        AppLabel(type: .resetScale)
            .onTapGesture { resetScale() }
            .opacity(isScaleButtonVisible ? 1 : 0)
            .animation(.easeInOut(duration: 0.3), value: isScaleButtonVisible)
    }

    private func resetScale() {
        withAnimation {
            scale = 1.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isScaleButtonVisible = false
        }
    }
}


//#Preview {
//    PhotoPickerView()
//}
