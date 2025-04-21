//
//  RegistrationContentView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 25.03.2025.
//

import SwiftUI

struct RegistrationContentView: View {

    var viewModel: RegistrationViewModel
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(spacing: 40) {
            TitleView()
            AppTextField(type: .login, login: viewModel.binding(for: \.email))
                .focused($isFocused)

            AppTextField(type: .password, password: viewModel.binding(for: \.password))

            AppButton(type: .register) {
                viewModel.registerUser()
            }

            AppButton(type: .haveAccount) {
                viewModel.goToEnterScreen()
            }
        }
        .padding(.horizontal, 34)
        .padding(.top, 20)
        .applyBaseScreenView()
        .sheet(isPresented: viewModel.successIndicatorBinding()) {
            SuccessIndicatorView() {
                viewModel.goToMainMenu()
            }
            .presentationDetents([.medium])
        }
    }
}

#Preview {
    NavigationStack {
        RegistrationContentView(viewModel: RegistrationViewModel())
    }
}
