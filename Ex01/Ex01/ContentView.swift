//
//  ContentView.swift
//  Ex01
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var userName = ""
    
    var body: some View {
        VStack(content: {
            Spacer()
            
            Text("Welcome! \(userName)")
                .frame(alignment: .center)
            
            Spacer()
            
            HStack(content: {
                Button("Name", action: {
                    let name = "Woody"
                    userName = name
                })
                Button("Clear", action: {
                    userName.removeAll()
                })
            })
            
        })
    }
}

#Preview {
    ContentView()
}
