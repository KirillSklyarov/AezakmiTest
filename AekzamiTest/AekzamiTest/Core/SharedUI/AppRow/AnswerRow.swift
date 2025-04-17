////
////  AnswerRow.swift
////  SwiftUI_1
////
////  Created by Kirill Sklyarov on 27.03.2025.
////
//
//import SwiftUI
//
//struct AnswerRow: View {
//
//    let item: Answer
//    var isSelected = false
//
//    var body: some View {
//        ZStack(alignment: .center) {
//            RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
//                .fill(isSelected ? (item.isCorrect ? Color.green : Color.red) : Color.white)
//                .frame(maxWidth: .infinity, minHeight: AppConstants.Height.ratingMinHeight)
//
//            AppLabel(type: .answer, text: item.text)
//                .padding(.horizontal, 50)
//                .multilineTextAlignment(.center)
//                .lineLimit(2)
//                .minimumScaleFactor(0.5)
//        }
//        .overlay(alignment: .leading) {
//            Image(systemName: "character.circle")
//                .font(.system(size: 30, weight: .thin))
//                .padding(.horizontal, 18)
//        }
//    }
//}
//
//#Preview {
//    let item = Answer(text: "Северный ледовитый океан", isCorrect: false)
//    AnswerRow(item: item)
//}
//
