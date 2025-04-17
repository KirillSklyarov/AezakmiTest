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
//    case enter
//    case mainMenu
//    case category
//    case level
//    case game
//    case statistics
//    case rating
//    case result

    var isFullScreen: Bool {
        switch self {
        case .registration, .signIn: return false
        default: return true
        }
    }

    var view: any View {
        switch self {
        case .registration: RegistrationView()
        case .signIn: SignInView()
//        case .mainMenu: MainMenuView()
//        case .category: ChooseCategoryView()
//        case .level: ChooseLevelView()
//        case .game: GameView()
//        case .statistics: StatisticsView()
//        case .rating: RatingView()
//        case .result: ResultView()
//        case .username: EnterUsernameView()
        }
    }
}
