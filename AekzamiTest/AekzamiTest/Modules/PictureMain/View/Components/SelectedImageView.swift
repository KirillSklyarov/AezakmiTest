//
//  SelectedImageView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 23.04.2025.
//

import SwiftUI

struct SelectedImageView: View {
    var selectedImage: Image?

    var body: some View {
        if let selectedImage {
            selectedImage
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
                .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
        }

    }
}
