//
//  ContentView.swift
//  EmojiTest
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var arrNumber = ["10", "20", "25", "31", "42", "53"]
    @State var dispNumber = ""
    // mutate 기능을 State가 해준다.
    @State var indexState = 0
    @State var dispArr = ""
    
    var body: some View {
        VStack {
            Text(dispArr)
                .padding()
            
            Text(dispNumber)
                .bold()
                .font(.system(size: 50))
            
            Button("Next", action: {
                nextData()
            })
            .padding()
            
        }// End VStack
        .padding()
        
        
        // 각 component별로 기능을 구현할 수 있음
        // 처음 appear 될때 기능 구현
        // viewDidLoad()
        .onAppear(perform: {
            dispNumber = arrNumber[indexState]
            for i in arrNumber {
                if i == arrNumber[arrNumber.count - 1]{
                    dispArr += "\(i)"
                } else {
                    dispArr += "\(i), "
                }
                
            }
        })
        
    } // End body
    
    // ---- Functions ----
    func nextData(){
        indexState += 1
        if indexState >= arrNumber.count {
            indexState = 0
        } else{
            dispNumber = arrNumber[indexState]
        }
    }
} // End ContentView

#Preview {
    ContentView()
}
