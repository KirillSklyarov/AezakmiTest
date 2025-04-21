//
//  SuccessCheckmark.swift
//  AekzamiTest
//
//  Created by Kirill Sklyarov on 21.04.2025.
//

import SwiftUI

struct SuccessIndicatorView: View {
    @State private var showCircle = false
    @State private var drawCheckmark = false
    @State private var showText = false
    @Environment(\.dismiss) var dismiss
    var completion: (() -> Void)

    var body: some View {
        VStack(spacing: 30) {
            Circle()
                .fill(Color.green)
                .scaleEffect(showCircle ? 1 : 0)
                .frame(width: 80, height: 80)
                .overlay {
                    GeometryReader { geometry in
                        Path { path in
                            let width = geometry.size.width
                            let height = geometry.size.height

                            path.move(to: CGPoint(x: width * 0.35, y: height * 0.5))
                            path.addLine(to: CGPoint(x: width * 0.45, y: height * 0.65))
                            path.addLine(to: CGPoint(x: width * 0.65, y: height * 0.35))
                        }
                        .trim(from: 0, to: drawCheckmark ? 1 : 0)
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    }
                }

            Text("Вы успешно вошли в аккаунт")
                .font(.headline)
                .opacity(showText ? 1 : 0)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                showCircle = true
                showText = true
            }

            withAnimation(.easeInOut(duration: 0.6).delay(0.4)) {
                drawCheckmark = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion()
                dismiss()
            }
        }
    }
}
