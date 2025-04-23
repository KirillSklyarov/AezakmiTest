//
//  GalleryPicker.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 23.04.2025.
//

import UIKit
import SwiftUI
import PhotosUI

struct GalleryPicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    var onPhotoSelected: (UIImage) -> Void
    @Environment(\.dismiss) var dismiss

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: GalleryPicker

        init(_ parent: GalleryPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { parent.dismiss(); return }

            parent.onPhotoSelected(image)
            parent.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
