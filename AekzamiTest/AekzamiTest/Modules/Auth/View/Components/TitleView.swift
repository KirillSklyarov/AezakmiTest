//
//  LogoAndTitleView.swift
//  SwiftUI_1
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

struct TitleView: View {

    private let name: String

    init(name: String = "Будь самой очаровательной и неповторимой") {
        self.name = name
    }

    var body: some View {
        Text("\(name)")
            .font(.system(size: 30, weight: .bold))
            .frame(width: 360, alignment: .center)
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
    }
}
