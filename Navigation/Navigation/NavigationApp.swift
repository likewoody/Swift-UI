//
//  NavigationApp.swift
//  Navigation
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

@main
struct NavigationApp: App {
    @StateObject private var lampData = LampData()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
