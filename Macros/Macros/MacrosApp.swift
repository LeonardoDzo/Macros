//
//  MacrosApp.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct MacrosApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup<AnyView> {
            let view = LoginView<LoginViewModelImp>().environmentObject(LoginViewModelImp())
            return AnyView(view)
        }
    }
}
