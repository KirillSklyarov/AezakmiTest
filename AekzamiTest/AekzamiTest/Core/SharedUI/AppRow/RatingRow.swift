////
////  RatingRow.swift
////  SwiftUI_1
////
////  Created by Kirill Sklyarov on 27.03.2025.
////
//
//import SwiftUI
//
//struct RatingRow: View {
//
//    let item: RatingModel
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
//                .fill(AppConstants.AppColor.statisticsRowColor)
//                .frame(maxWidth: .infinity, minHeight: AppConstants.Height.ratingMinHeight)
//
//            HStack {
//                AppLabel(type: .statistics, text: "\(item.id).", color: colorStatus(item.id))
//                Spacer()
//                AppLabel(type: .statistics, text: item.name, color: colorStatus(item.id))
//                Spacer()
//                let text = "\(item.points)₽"
//                AppLabel(type: .statistics, text: text, color: colorStatus(item.id))
//            }
//            .padding(.horizontal, 18)
//        }
//    }
//
//    private func colorStatus(_ place: Int) -> Color {
//        switch place {
//        case 1: return .green
//        case 2...5: return .yellow
//        default: return .red
//        }
//    }
//}
