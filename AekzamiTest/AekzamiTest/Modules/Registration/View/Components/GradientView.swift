//
//  GradientView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 12.03.2025.
//

import SwiftUI


struct GradientView: View {

    var body: some View {
        LinearGradient(colors: [AppConstants.AppColor.gradientStart, AppConstants.AppColor.gradientEnd],
                       startPoint: .leading,
                       endPoint: .trailing)
        .ignoresSafeArea()
    }
}
