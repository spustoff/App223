//
//  App223App.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_E4dKFxwizep6DKdpp16GphpLo4XEME")
        Amplitude.instance().initializeApiKey("bd24c2751685cce6aa00f2d5a89ed927")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App223App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
