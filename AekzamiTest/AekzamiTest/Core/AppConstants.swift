//
//  AppConstants.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI

struct AppConstants {

    enum AppColor {
        static let background = Color(hex: "3F3457")
        static let buttonYellow = Color(hex: "FFD000")
        static let fontGray = Color(hex: "717171")
        static let fontLightGray = Color(hex: "C2C2C2")
        static let gradientStart = Color(hex: "AB00E4")
        static let gradientEnd = Color(hex: "620082")
        static let buttonRed = Color(hex: "FF0000")
        static let statisticsRowColor: Color = Color(hex: "504569")
    }
    
    enum Height {
        static let buttonMinHeight: CGFloat = 60
        static let ratingMinHeight: CGFloat = 40
    }

    enum UserDefaultsKeys {
        static let score = "score"
        static let result = "result"
    }

    static let cornerRadius: CGFloat = 20
}
