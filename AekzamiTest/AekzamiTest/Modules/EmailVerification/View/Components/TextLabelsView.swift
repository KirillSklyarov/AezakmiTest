//
//  TextLabelsView.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 21.04.2025.
//

import SwiftUI

struct TextLabelsView: View {

    var email: String

    var body: some View {
        VStack(spacing: 24) {
            // Иконка или иллюстрация
            Image(systemName: "envelope.badge")
                .font(.system(size: 80))
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            // Заголовок
            Text("Подтвердите ваш email")
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            // Информационный текст
            Text("Мы отправили письмо с ссылкой для подтверждения на адрес:")
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
            // Email пользователя
            Text(email)
                .font(.system(size: 30))
                .foregroundStyle(.white)
            
            // Инструкции
            Text("Проверьте вашу почту и нажмите на ссылку в письме, чтобы завершить регистрацию.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.bottom, 10)
        }
    }
}
