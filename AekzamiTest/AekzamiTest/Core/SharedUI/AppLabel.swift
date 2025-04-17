//
//  AppLabel.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

enum AppLabelType {
    case userName
    case statistics
    case answer
    case category
    case categoryRow
    case levelRow
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

        }
    }
}

