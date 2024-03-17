//
//  SysdiagnoseUtilApp.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/5/24.
//

import SwiftUI

//enum Screen {
//    case login
//    case users
//}
//
//final class AppCoordinator: ObservableObject {
//    @Published var screen: Screen = .login
////    private let userDefaultRepository = UserDefaultsRepository()
////    private let providerFactory: BaseProviderProtocol = BaseProviderFactory()
//
//    init() {
//        screen = .login
//    }
//
//    func userView() -> some View {
//        SearchView(dir: .init(filePath: "/tmp/"))
//    }
//
//    func loginView() -> some View {
//        WelcomeView(screen: screen)
//    }
//}
//
//@main
//struct IosstarterkitApp: App {
//    @StateObject var coordinator = AppCoordinator()
//
//    var body: some Scene {
//        WindowGroup {
//            switch coordinator.screen {
//            case .login:
//                coordinator.loginView()
//            case .users:
//                coordinator.userView()
//            }
//        }
//    }
//}


@main
struct SysdiagnoseUtilApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
