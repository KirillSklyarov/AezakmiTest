//
//  ToastView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 21.04.2025.
//

import SwiftUI

// Вспомогательное представление для всплывающих уведомлений
struct ToastView: View {
    var message: String
    
    var body: some View {
        Text(message)
            .padding()
            .background(Color.green.opacity(0.9))
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
            .shadow(radius: 5)
//            .padding(.top, 20)
            .transition(.move(edge: .top).combined(with: .opacity))
    }
}
