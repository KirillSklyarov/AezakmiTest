//
//  AlertItem.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 17.04.2025.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: String
    let message: String
    let buttonTitle: String = "OK"
    let isRepeatable: Bool

    init(id: UUID = UUID(), title: String, message: String, isRepeatable: Bool = false) {
        self.id = id
        self.title = title
        self.message = message
        self.isRepeatable = isRepeatable
    }
}
