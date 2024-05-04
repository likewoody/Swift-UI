//
//  ContentView.swift
//  Ex04
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var num = ""
    @State var txt = "환영합니다"
    
    
    var body: some View {
        VStack(content: {
            Text("홀짝수 판별")
                .foregroundStyle(.red)
                .font(.system(size: 30))
                .bold()
            
            HStack(content: {
                Text("입력숫자 :")
                    .frame(width: 80, alignment: .leading)
                TextField("숫자 입력", text: $num)
                    .frame(width: 120, alignment: .trailing)
                    .textFieldStyle(.roundedBorder)
            })
            
            Button("판별하기", action: {
                txt = Int(num)! % 2 == 0 ? "짝수입니다." : "홀수입니다."
            })
            
            Text(txt)

        })
    }
}

#Preview {
    ContentView()
}
