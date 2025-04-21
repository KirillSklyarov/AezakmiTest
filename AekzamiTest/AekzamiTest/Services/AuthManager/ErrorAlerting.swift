////
////  ErrorAlerting.swift
////  AekzamiTest
////
////  Created by Kirill Sklyarov on 21.04.2025.
////
//
//import SwiftUI
//
//protocol ErrorAlerting {
//    var alert: AlertItem? { get }
//    var state: ViewModelState { get }
//}
//
//struct ErrorAlertView: View {
//
//    let viewModel: ErrorAlerting
//    let router: AppRouting
//    let previousScreen: AppModule? // Задаем предыдущий экран только там где нужно - где есть fullScreenCover
//    let repeatAction: () -> Void
//    var backNavigation: Bool = false
//
//    init(viewModel: ErrorAlerting, router: AppRouting, previousScreen: AppModule? = nil, repeatAction: @escaping () -> Void = { }, backNavigation: Bool = false) {
//        self.viewModel = viewModel
//        self.router = router
//        self.previousScreen = previousScreen
//        self.repeatAction = repeatAction
//        self.backNavigation = backNavigation
//    }
//
//    var body: some View {
//        Color.clear
//            .alertScreenView(
//                isPresented: .constant(viewModel.state == .error),
//                alert: viewModel.alert,
//                router: router,
//                previousScreen: previousScreen,
//                repeatAction: repeatAction,
//                backNavigation: backNavigation
//            )
//    }
//}
//
////#Preview {
////    let viewModel = GameViewModel()
////    let router: AppRouting = AppRouter()
////    let previousScreen: AppModule? = nil
////    ErrorAlertView(viewModel: viewModel, router: router, previousScreen: previousScreen)
////}
