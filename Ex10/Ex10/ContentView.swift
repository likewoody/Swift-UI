//
//  ContentView.swift
//  Ex10
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojiList = ["😁", "🤬", "😛", "🥸"]
    @State var txt = ""
    @State var currentIndex = 0
    @State var emoList = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(emoList)
                .font(.system(size: 30))
            
            Spacer()
            
            Text(txt)
                .font(.system(size: 60))
            
            Spacer()
            
            HStack(content: {
                Button("Prev", action: {
                    currentIndex -= 1
                    if currentIndex < 0 {
                        currentIndex = emojiList.count - 1
                    }
                    txt = emojiList[currentIndex]
                })
                .padding(.trailing, 30)
            
                Button("Next", action: {
                    currentIndex += 1
                    if currentIndex >= emojiList.count {
                        currentIndex = 0
                    }
                    txt = emojiList[currentIndex]
                })
            })
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            txt = emojiList[currentIndex]
            for i in emojiList {
                emoList += i
            }
        })
        
    }
}

#Preview {
    ContentView()
}
