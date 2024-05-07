//
//  TableApp.swift
//  Table
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

@main
struct TableApp: App {
    @StateObject private var todoStatic = TodoStatic()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(todoStatic)
        }
    }
}
