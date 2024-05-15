//
//  ContentView.swift
//  TabbarPage
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
            First()
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("Sun")
                }
                .tag(0) // 유니크한 값만 들어가면 되어서 1로 시작해도 되고 0으로 시작해도 된다.
            Second()
                .tabItem {
                    Image(systemName: "cloud.fill")
                    Text("구름")
                }
                .tag(1)
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
