//
//  ResendEmailVerificationView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 21.04.2025.
//

import SwiftUI

struct ResendEmailVerificationView: View {

    @Binding var isResendingEmail: Bool

    var body: some View {
        HStack {
            if isResendingEmail {
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding(.trailing, 10)
                    .tint(.white)
            }
            Text(isResendingEmail ? "Отправка..." : "Отправить письмо повторно")
                .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
        .background(Color.green)
        .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
    }
}
