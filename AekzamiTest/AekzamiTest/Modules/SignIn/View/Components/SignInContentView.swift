//
//  EnterContentView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 29.03.2025.
//

import SwiftUI

struct SignInContentView: View {

    @Environment(\.dismiss) var dismiss
    var viewModel: EnterViewModeling
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            AppTextField(type: .login, login: viewModel.binding(for: \.login))
                .focused($isFocused)
            AppTextField(type: .password, password: viewModel.binding(for: \.password))
            AppButton(type: .enter) {
                viewModel.signIn()
            }
            AppButton(type: .forgotPassword)
            AppButton(type: .backToRegistration) {
                isFocused = false
                dismiss()
            }
            Spacer()
        }
        .padding(.horizontal, 34)
        .padding(.top, 20)
        .applyBaseScreenView()
//        .task {
//            try? await Task.sleep(nanoseconds: 500_000_000)
//            isFocused = true
//        }
    }
}

#Preview {
    NavigationStack {
        let viewModel = SignInViewModel()
        SignInContentView(viewModel: viewModel)
    }
}
