////
////  StatisticsRow.swift
////  SwiftUI_1
////
////  Created by Kirill Sklyarov on 27.03.2025.
////
//import SwiftUI
//
//struct StatisticsRow: View {
//    let item: Statistics
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
//                .fill(AppConstants.AppColor.statisticsRowColor)
//                .frame(maxWidth: .infinity, minHeight: AppConstants.Height.buttonMinHeight)
//
//            HStack {
//                let indexText = item.index.description + "."
//                AppLabel(type: .statistics, text: indexText, color: colorStatus(item.index))
//                AppLabel(type: .statistics, text: item.result.date, color: colorStatus(item.index))
//                Spacer()
//                let score = item.result.score.formatted(.number.grouping(.automatic))
//                let text = "\(score) ₽"
//                AppLabel(type: .statistics, text: text, color: colorStatus(item.index))
//            }
//            .padding(.horizontal, 18)
//        }
//    }
//
//    private func colorStatus(_ place: Int) -> Color {
//        switch place {
//        case 1: .green
//        case 2...5: .yellow
//        default: .red
//        }
//    }
//}
