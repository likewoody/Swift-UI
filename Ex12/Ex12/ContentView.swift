//
//  ContentView.swift
//  Ex12
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var imgList = ["flower_01","flower_02","flower_03","flower_04","flower_05","flower_06"]
    @State var currentState = 0
    @State var ztackState = 1
    @State var bgColor: Color = .white
    
    
    let timer = Timer.publish(every: 3, on: .main, in: .default).autoconnect()
    let nextTimer = Timer.publish(every: 6, on: .main, in: .default).autoconnect()
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("3초마다 이미지 무한 반복")
                    .bold()
                    .font(.system(size: 24))
                    .padding()
                
                Text("\(imgList[currentState]).png")
                
                ZStack {
                    Image(imgList[currentState])
                        .resizable()
                        .clipShape(.rect(cornerRadius: 15))
                        .onReceive(timer, perform: { _ in
                    
                            imageChange()
                    })
                    
                    
                    Image(imgList[ztackState])
                        .resizable()
                        .clipShape(.rect(cornerRadius: 15))
                        .frame(width: 140, height: 160)
                        .offset(x: 110, y: -230)
                        .onReceive(nextTimer, perform: { _ in
                            nextimageChange()
                        })
                }
                
                
                Spacer()
            } // VStack
            .padding()
        }
    } // body
    
    // ---- Function ----
    func imageChange() {
        currentState += 1
        if currentState >= imgList.count {
            currentState = 0
        }
    
        if currentState == ztackState {
            bgColor = .blue
        } else {
            bgColor = .white
        }
    }
    func nextimageChange() {
        ztackState += 1
        
        if ztackState >= imgList.count {
            ztackState = 0
        }
        
    }

} // ContentView

#Preview {
    ContentView()
}
