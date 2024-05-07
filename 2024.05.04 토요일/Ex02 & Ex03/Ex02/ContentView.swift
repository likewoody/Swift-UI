//
//  ContentView.swift
//  Ex02
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var smile = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(smile)")
            Spacer()
            HStack(content: {
                Button("😁", action: {
                    smile += "😁"
                })
                .font(.system(size: 40))
                .frame(width: 100, height: 50)
                .border(.blue, width: 2)

                Button("🤣", action: {
                    smile += "🤣"
                })
                .font(.system(size: 40))
                .frame(width: 100, height: 50)
                .border(.blue, width: 2)

                Button("🤬", action: {
                    smile += "🤬"
                })
                .font(.system(size: 40))
                .frame(width: 100, height: 50)
                .border(.blue, width: 2)

            })
                        Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
