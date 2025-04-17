//
//  EnterContentView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 29.03.2025.
//

import SwiftUI

struct ResetPasswordContentView: View {

    var viewModel: ResetPasswordViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Spacer()
            Text("🔑")
                .font(.system(size: 100))

            AppLabel(type: .userName, text: "Сброс пароля")
            AppLabel(type: .resetPassword)

            Spacer()

            AppButton(type: .resetPassword) {
                viewModel.signIn()
            }
            Spacer()
        }
        .padding(.horizontal, 34)
        .padding(.top, 20)
        .applyBaseScreenView()
    }
}

#Preview {
    NavigationStack {
        let viewModel = ResetPasswordViewModel()
        ResetPasswordContentView(viewModel: viewModel)
    }
}
