//
//  Navigation01App.swift
//  Navigation01
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

@main
struct Navigation01App: App {
    // private 모드
    @StateObject private var lampData = LampData() // 추가 한 것
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(lampData) // 추가 한 것
        }
    }
}
