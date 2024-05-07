//
//  ContentView.swift
//  ex05
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var num1 = ""
    @State var num2 = ""
    @State var txt = "환영합니다."

    var body: some View {
        VStack {
            Text("짝수인 경우에만 덧셈")
        }
        HStack(content: {
            Text("1번 숫자 : ")
            TextField("숫자입력", text: $num1)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
        })
        .padding()
        HStack(content: {
            Text("2번 숫자 : ")
            TextField("숫자입력", text: $num2)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
        })
        .padding()
        
        Button("판별하기", action: {
            
            var check = checkInput()
            
            if check {
                var sum = Int(num1)! + Int(num2)!
                
                txt = sum % 2 == 0 ? "입력하신 숫자의 합은 \(sum)입니다." : "짝수를 입력하세요."
            }
            
            
            
        })
            .padding(30)
        
        Text(txt)
    }
    
    func checkInput() -> Bool{
        if num1.isEmpty  || num2.isEmpty {
            txt = "숫자를 정확히 입력하세요"
            return false
        }
        return true
    }
}

#Preview {
    ContentView()
}
