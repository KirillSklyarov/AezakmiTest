//
//  LoadingIndicator.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 21.04.2025.
//


import SwiftUI

struct LoadingIndicator: View {

    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(2.0)
            .tint(.red)
    }
}