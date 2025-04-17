//
//  AppTextField.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

enum AppTextFieldType {
    case login
    case password
    case username
}

struct AppTextField: View {
    private var type: AppTextFieldType
    @Binding private var login: String
    @Binding private var password: String
    @Binding private var username: String

    init(type: AppTextFieldType,
         login: Binding<String> = .constant(""),
         password: Binding<String> = .constant(""),
         username: Binding<String> = .constant("")) {
        self.type = type
        self._login = login
        self._password = password
        self._username = username
    }

    var body: some View {
        switch type {
        case .login: LoginTextFiledView(login: $login)
        case .password: PasswordTextFieldView(password: $password)
        case .username: UsernameTextFiledView(username: $username)
        }
    }
}


struct LoginTextFiledView: View {

    @Binding var login: String

    var body: some View {
        TextField("Email", text: $login)
            .padding(.horizontal, 30)
            .font(.system(size: 20))
            .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
            .foregroundStyle(.black)
            .tint(.red)
            .textFieldStyle(.plain)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .background(
                RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
                    .fill(.white))
    }
}

struct PasswordTextFieldView: View {

    @Binding var password: String

    var body: some View {
        SecureField("Пароль", text: $password)
            .padding(.horizontal, 30)
            .font(.system(size: 20))
            .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
            .tint(.red)
            .background(
                RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
                    .fill(.white)
            )
    }
}

struct UsernameTextFiledView: View {

    @Binding var username: String

    var body: some View {
        TextField("Ваше имя", text: $username)
            .padding(.horizontal, 30)
            .font(.system(size: 20))
            .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
            .foregroundStyle(.black)
            .tint(.red)
            .textFieldStyle(.plain)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .background(
                RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
                    .fill(.white))
    }
}
