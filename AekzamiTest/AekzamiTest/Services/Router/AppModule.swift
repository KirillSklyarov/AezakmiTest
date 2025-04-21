//
//  AppModule.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

enum AppModule {
    case registration
    case signIn
    case resetPassword
    case mainMenu
    case emailVerification

    var isFullScreen: Bool {
        switch self {
        case .registration, .emailVerification, .signIn, .mainMenu: return true
        case .resetPassword: return false
        }
    }

    var view: any View {
        switch self {
        case .registration: RegistrationView()
        case .signIn: SignInView()
        case .resetPassword: ResetPasswordView()
        case .mainMenu: PictureMainView()
        case .emailVerification: EmailVerificationView()
        }
    }
}
