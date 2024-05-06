//
//  ContentView.swift
//  Ex11
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var imgList = ["flower_01", "flower_02", "flower_03", "flower_04", "flower_05", "flower_06"]
    @State var currentState = 0
    @State var frontImage = 1
    
    var body: some View {
        VStack(content: {
            
            Spacer()
            
            Text("\(imgList[currentState]).png")
                .bold()
                .font(.system(size: 30))
            
            ZStack {
                Image(imgList[currentState])
                    .resizable()
                .frame(width: 300, height: 500)
                .clipShape(.rect(cornerRadius: 15))
                
                Image(imgList[frontImage])
                    .resizable()
                .frame(width: 100, height: 150)
                .clipShape(.rect(cornerRadius: 15))
                // x, y 좌표 이동
                .offset(x: 100, y: -175)
                // 테두리 만들 땐 언제나 overlay 사용
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        // stroke 값을 넣어주니까 투명도가 생겨 stroke만 보여진다.
                        .stroke(.red, lineWidth: 3.0)
                        .offset(x: 100, y: -173)
                })
            } // ZStack
            .clipped() // 교집합이 아닌 부분을 잘라 버린다.
            
            Spacer()
            
            HStack(content: {
                Button("이전", action: {
                    prev()
                })
                .padding()
                Button("이전", action: {
                    next()
                })
                .padding()
            }) // HStack
            
            Spacer()
            
        }) // VStack
    } // body
    
    // ---- Fucntions ----
    func prev() {
        currentState -= 1
        if currentState < 0 {
            currentState = imgList.count - 1
        }
        
        frontImage -= 1
        if frontImage < 0 {
            frontImage = imgList.count - 1
        }
    }
    func next() {
        currentState += 1
        if currentState >= imgList.count {
            currentState = 0
        }
        frontImage += 1
        if frontImage >= imgList.count {
            frontImage = 0
        }
    }
} // contentView

#Preview {
    ContentView()
}
