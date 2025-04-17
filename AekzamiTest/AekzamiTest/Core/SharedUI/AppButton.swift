//
//  AppButton.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

enum AppButtonType {
    case enter
    case register
    case forgotPassword
    case signOut
    case resetPassword
    case saveUsername
    case backToRegistration
    case startGame
    case settings
    case rating
    case statistics
    case next
    case ok
    case exit
    case category
    case haveAccount
}

struct AppButton: View {

    let type: AppButtonType
    let title: String?
    let isDisabled: Bool
    let action: (() -> Void)?

    init(type: AppButtonType, title: String? = nil, isDisabled: Bool = false, action: (() -> Void)? = nil) {
        self.type = type
        self.title = title
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {
        Button {
            action != nil ? action!() : defaultAction()
        } label: {
            switch type {
            case .enter: EnterButtonView(buttonText: "Войти")
            case .register: RegisterButtonView(buttonText: "Зарегистрироваться", isDisabled: isDisabled)
            case .forgotPassword: DidForgetPasswordButtonView(text: title)
            case .startGame: EnterButtonView(buttonText: "Начать игру!")
            case .settings: RegisterButtonView(buttonText: "Настройки", isDisabled: isDisabled)
            case .rating: RegisterButtonView(buttonText: "Топ игроков", isDisabled: isDisabled)
            case .statistics: RegisterButtonView(buttonText: "Моя статистика", isDisabled: isDisabled)
            case .exit: ExitButtonView(buttonText: "Выйти")
            case .next:
                RegisterButtonView(buttonText: "Далее", isDisabled: isDisabled)
                    .fontWeight(.bold)
            case .ok: EnterButtonView(buttonText: "ОK")
            case .category: RegisterButtonView(buttonText: title ?? "", isDisabled: isDisabled)
                    .fontWeight(.bold)
            case .haveAccount: DidForgetPasswordButtonView(text: "Уже есть аккаунт?")
            case .backToRegistration: DidForgetPasswordButtonView(text: "Вернуться к регистрации")
            case .signOut: ExitButtonView(buttonText: "Выйти из аккаунта")
            case .saveUsername: RegisterButtonView(buttonText: "Продолжить", isDisabled: isDisabled)
            case .resetPassword: RegisterButtonView(buttonText: "Сбросить пароль", isDisabled: isDisabled)
            }
        }
    }

    private func defaultAction() {
        switch type {
        case .enter: print("Enter button tapped")
        case .register: print("Действие по умолчанию для регистрации")
        case .forgotPassword: print("Действие по умолчанию для забытого пароля")
        case .startGame: print("Действие по умолчанию для начала игры")
        case .settings: print("Действие по умолчанию для настроек")
        case .rating: print("Действие по умолчанию для рейтинга")
        case .statistics: print("Действие по умолчанию для статистики")
        case .exit: print("Действие по умолчанию для выхода")
        case .next: print(".next")
        case .ok: print(".ok")
        case .category: print("category button tapped")
        case .haveAccount: print("Have an account?")
        case .backToRegistration: print("Back to registration?")
        case .signOut: print("Действие по умолчанию для выхода из аккаунта")
        case .saveUsername: print("Действие по умолчанию для сохранения имени")
        case .resetPassword: print("Действие по умолчанию для сброса пароля")
        }
    }
}

struct EnterButtonView: View {
    var buttonText: String

    var body: some View {
        Text(buttonText)
            .font(.system(size: 20, weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
            .background(GradientView())
            .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
    }
}

struct RegisterButtonView: View {
    let buttonText: String
    let isDisabled: Bool

    var body: some View {
        Text(buttonText)
            .font(.system(size: 20))
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
            .background(isDisabled ? AppConstants.AppColor.fontGray : AppConstants.AppColor.buttonYellow)
            .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
    }
}

struct DidForgetPasswordButtonView: View {

    let text: String?

    var body: some View {
        Text(text ?? "Забыли пароль?")
            .font(.system(size: 20))
            .foregroundStyle(.white)
    }
}

struct ExitButtonView: View {

    var buttonText: String

    var body: some View {
        Text(buttonText)
            .font(.system(size: 20))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
            .background(AppConstants.AppColor.buttonRed)
            .clipShape(.rect(cornerRadius: AppConstants.cornerRadius))
    }
}
