//
//  ContentView.swift
//  Ex08
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var dan = ""
    @State var enteredLine = ""
    
    var body: some View {
        VStack(content: {
            Text("구구단 출력")
        })
        HStack(content: {
            TextField("구구단", text: $dan)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
            Button("단 출력", action: {
                enteredLine = ""
                for i in 1...9 {
                    guard let d = Int(dan) else {return}
                    enteredLine += "\(d) * \(i) = \(d * i) \n"
                }
            })
        })
        TextEditor(text: $enteredLine)
            .frame(width: 350, height: 400)
            .foregroundStyle(.black)
            .colorMultiply(.blue)
            .foregroundStyle(.red)
            .clipShape(.buttonBorder)
            .disabled(true)
            .padding()
        
    }
}

#Preview {
    ContentView()
}
