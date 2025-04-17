////
////  AppRow.swift
////  SwiftUI_1
////
////  Created by Kirill Sklyarov on 12.03.2025.
////
//
//import SwiftUI
//
//enum AppRowType {
//    case statistics
//    case rating
//    case answer
//    case category
//}
//
//struct AppRow: View {
//    let type: AppRowType
//    let item: any AppRowData
//    var isSelected: Bool
//
//    init(type: AppRowType, item: any AppRowData, isSelected: Bool = false) {
//        self.type = type
//        self.item = item
//        self.isSelected = isSelected
//    }
//
//    var body: some View {
//        switch type {
//        case .statistics:
//            if let castedItem = self.item as? Statistics {
//                StatisticsRow(item: castedItem)
//            }
//        case .rating:
//            if let castedItem = self.item as? RatingModel {
//                RatingRow(item: castedItem)
//            }
//
//        case .answer:
//            if let castedItem = self.item as? Answer {
//                AnswerRow(item: castedItem, isSelected: isSelected)
//            }
//        case .category:
//            if let castedItem = self.item as? Category {
//                CategoryRow(item: castedItem, isSelected: isSelected)
//            }
//        }
//    }
//}
