//
//  EnterContentView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 29.03.2025.
//

import SwiftUI

struct SignInContentView: View {

    var viewModel: EnterViewModeling
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            AppTextField(type: .login, login: viewModel.binding(for: \.email))
                .focused($isFocused)
            AppTextField(type: .password, password: viewModel.binding(for: \.password))
            AppButton(type: .enter) {
                viewModel.signIn()
            }
            AppButton(type: .googleEnter) {
                viewModel.signInWithGoogle()
            }

            AppButton(type: .forgotPassword) {
                viewModel.goToResetPassword()
            }
            AppButton(type: .backToRegistration) {
                isFocused = false
                viewModel.backToRegistration()
            }
            Spacer()
        }
        .padding(.horizontal, 34)
        .padding(.top, 20)
        .applyBaseScreenView()
        .applyNavBarConfig(title: "")
    }
}

#Preview {
    NavigationStack {
        let viewModel = SignInViewModel()
        SignInContentView(viewModel: viewModel)
    }
}
