//
//  AuthManager.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

@Observable
final class AuthManager {
    private(set) var isUserLogIn: Bool = false

    init() {
        self.isUserLogIn = Auth.auth().currentUser != nil
        print(isUserLogIn ? "✅ User is logged in" : "❌ User is not logged in")
    }

    // MARK: - Methods

    // Регистрация
    func registration(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error { completion(.failure(error)); return }
            completion(.success(true))
        }
    }

    // Авторизация
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error { completion(.failure(error)); return }
            completion(.success(true))
        }
    }

    // Вход через гугл
    func signInWithGoogle(completion: @escaping () -> Void) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            print("Не найден корневой контроллер")
            return
        }

        print("Начинаем вход через Google...")

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] signInResult, error in
            if let error = error {
                print("Ошибка входа через Google: \(error.localizedDescription)")
                return
            }

            guard let user = signInResult?.user else {
                print("Не получены данные пользователя")
                return
            }

            print("✅ Успешный вход через Google")

            self?.firebaseAuthWithCredentials(with: user, completion: completion)
        }
    }

    // Сброс пароля
    func resetPassword(email: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error { completion(.failure(error)); return }
            completion(.success(true))
        }
    }

    // Выход из учетки
    func signOut() {
        do {
            try Auth.auth().signOut()
            print("✅ Signed out successfully")
            isUserLogIn = false
        } catch {
            print("Error signing out: \(error)")
        }
    }

    // Добавляем имя пользователя
    func updateUserName(name: String, completion: @escaping (Result<Void, Error>) -> Void) {
        //        guard let user = Auth.auth().currentUser else { return }
        //
        //        let changeRequest = user.createProfileChangeRequest()
        //        changeRequest.displayName = name
        //        changeRequest.commitChanges { error in
        //            if let error {
        //                completion(.failure(error))
        //            } else {
        //                completion(.success(()))
        //            }
        //        }
    }

    // Получаем имя пользователя
    func getUsernameFromFirebase() -> String? {
        //        guard let user = Auth.auth().currentUser else { print("We don't have user"); return nil }
        //        return user.displayName
        return ""
    }

    func authErrorHandler(_ error: Error) -> AlertItem? {
        print(error.localizedDescription)
        let nsError = error as NSError
        print(nsError.code)
        print(nsError.localizedFailureReason)
        print(nsError.userInfo)
        print(nsError.localizedRecoverySuggestion)

        if let errorCode = AuthErrorCode(rawValue: nsError.code) {
            return getErrorAlert(errorCode)
        }
        return nil
    }
}

// MARK: - Private methods
private extension AuthManager {
     func getErrorAlert(_ code: AuthErrorCode) -> AlertItem {
        let alertText = switch code {
        case .emailAlreadyInUse: "Этот email уже используется"
        case .invalidEmail: "Некорректный email, проверьте указанный адрес"
        case .weakPassword: "Пароль должен быть длиннее 6 символов"
        case .wrongPassword: "Не заполнен или введен неверный пароль"
        case .invalidCredential: "Некорректные данные для авторизации - проверьте пароль или email"
        case .missingEmail: "Не заполнен email"
        default: "Другая ошибка аутентификации"
        }
        return AlertItem(message: alertText)
    }

    // Обновляем состояние аутентификации в вашем менеджере
    func firebaseAuthWithCredentials(with user: GIDGoogleUser, completion: @escaping () -> Void) {
        guard let idToken = user.idToken?.tokenString else { print("Не получен токен ID"); return }
        let accessToken = user.accessToken.tokenString

        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)

        Auth.auth().signIn(with: credentials) { [weak self] result, error in
            if let error {
                print("Ошибка аутентификации: \(error.localizedDescription)")
                return
            }

            print("✅ Успешная аутентификация в Firebase через Google")
            self?.isUserLogIn = true
            completion()
        }
    }
}
