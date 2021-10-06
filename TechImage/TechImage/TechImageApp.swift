//
//  TechImageApp.swift
//  TechImage
//
//  Created by YUKI on 2021/10/05.
//

import SwiftUI

@main
struct TechImageApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            
            // Albumを最初の画面に設定
            Album()
                // UserDataクラスをViewで使用するための設定
                .environmentObject(userData)
        }
    }
}

class AppDelegate:UIResponder, UIApplicationDelegate {
    // didFinishLaunchingWithOptions: アプリ全体で使用する設定値(UserDefaults)の初期化
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
            // アプリ起動時に最初に呼ばれる
            return true
    }
}
