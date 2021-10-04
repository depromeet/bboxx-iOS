//
//  BBOXX_iOSApp.swift
//  BBOXX-iOS
//
//  Created by eunwoo on 2021/10/02.
//

import SwiftUI

@main
struct BBOXX_iOSApp: App {
    
    // for using third-party 
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
