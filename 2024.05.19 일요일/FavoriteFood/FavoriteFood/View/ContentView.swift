//
//  ContentView.swift
//  FavoriteFood
//
//  Created by Woody on 5/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection, content: {
            Group{
                Domestic()
                    .tabItem {
                        Image(systemName: "person")
                        Text("국내")
                    }
                    .tag(0)
                Foreign()
                    .tabItem {
                        Image(systemName: "airplane")
                        Text("해외")
                    }
                    .tag(1)
            } // Group
            .toolbarBackground(.indigo, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }) // TabView
        .ignoresSafeArea(.all)
    } // body
          
} // ContentView

#Preview {
    ContentView()
}
