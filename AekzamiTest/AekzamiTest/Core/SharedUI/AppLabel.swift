//
//  AppLabel.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

enum AppLabelType {
    case choosePhoto
    case resetRotation
    case userName
    case statistics
    case answer
    case category
    case categoryRow
    case levelRow
    case resetPassword
}

struct AppLabel: View {

    var type: AppLabelType
    var text: String?
    var color: Color?

    init(type: AppLabelType, text: String? = nil, color: Color? = nil) {
        self.type = type
        self.text = text
        self.color = color
    }

    var body: some View {
        switch type {
        case .userName:
            Text(text ?? "Введите ваше имя")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(color ?? .white)
                .multilineTextAlignment(.center)
        case .statistics:
            Text(text ?? "")
                .font(.system(size: 16))
                .foregroundStyle(color ?? .accentColor)
        case .answer:
            Text(text ?? "")
                .font(.system(size: 20))
                .foregroundStyle(color ?? .black)
        case .category:
            Text(text ?? "Выберите категорию")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(color ?? .white)
                .multilineTextAlignment(.center)
        case .categoryRow:
            Text(text ?? "")
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(color ?? .black)
        case .levelRow:
            Text(text ?? "")
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(color ?? .black)
        case .resetPassword:
            Text(text ?? "Мы отправим письмо с ссылкой на восстановление пароля на вашу электронную почту")
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(color ?? .white)
                .multilineTextAlignment(.leading)
        case .choosePhoto:
            Text("Выбрать фото")
                .fontWeight(.bold)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(GradientView())
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
        case .resetRotation:
            Text("Сбросить угол вращения")
                .fontWeight(.bold)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(AppConstants.AppColor.buttonYellow)
                .foregroundStyle(.black)
                .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
        }
    }
}

