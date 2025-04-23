//
//  AuthErrorAlert.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

enum AuthErrorAlertType: String {
    case registration = "Ошибка регистрации"
    case signIn = "Ошибка авторизации"
    case signOut = "Вы уверены, что хотите выйти из профиля?"
    case username = "Ошибка ввода имени"
    case resetPassword = "Ошибка сброса пароля"
}

struct AuthErrorAlertView: View {
    let type: AuthErrorAlertType
    let alert: AlertItem?
    @Binding var isAlertPresented: Bool
    let okAction: (() -> Void)?

    var body: some View {
        Color.clear
            .alert(type.rawValue,
                   isPresented: $isAlertPresented,
                   presenting: alert)
        { alertItem in
            switch type {
            case .registration, .username, .signIn, .resetPassword:
                Button(alert?.buttonTitle ?? "OK") { okAction?() }
            default:
                Button("Отмена", role: .cancel) { }
                Button("OK", role: .destructive) { okAction?() }
            }
        } message: { alertItem in Text(alertItem.message) }
    }
}

struct AuthErrorAlertModifier: ViewModifier {

    let type: AuthErrorAlertType
    let alert: AlertItem?
    @Binding var isAlertPresented: Bool
    let okAction: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .alert(type.rawValue,
                   isPresented: $isAlertPresented,
                   presenting: alert)
        { alertItem in
            switch type {
            case .registration, .username, .signIn, .resetPassword:
                Button(alert?.buttonTitle ?? "OK") { okAction?() }
            default:
                Button("Отмена", role: .cancel) { }
                Button("OK", role: .destructive) { okAction?() }
            }
        } message: { alertItem in Text(alertItem.message) }
    }
}

extension View {
    func applyAuthErrorAlert(type: AuthErrorAlertType, alert: AlertItem?, isAlertPresented: Binding<Bool>, okAction: (() -> Void)? = nil) -> some View {
        modifier(
            AuthErrorAlertModifier(
                type: type,
                alert: alert,
                isAlertPresented: isAlertPresented,
                okAction: okAction)
        )
    }
}
