//
//  ContentView.swift
//  Ex06
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var num1 = ""
    @State var num2 = ""
    @State var txt = "환영 합니다."
    var body: some View {
        VStack {
        
            Text("범위의 합계 구하기")
                .font(.system(size: 25))
            
            HStack(content: {
                Text("시작 숫자 :")
                    .frame(width: 80)
                TextField("0", text: $num1)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            })
            .padding()
            HStack(content: {
                Text("끝 숫자 :")
                    .frame(width: 80)
                TextField("0", text: $num2)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            })
            
            Button("범위 합계", action: {
                calc()
            })
                .padding()
            Text(txt)
            
        }
        .padding()
        
    } // End body
    
    // ---- Functions ----
    func calc(){
        
        if num1.isEmpty || num2.isEmpty {
            txt = "정확한 숫자를 입력하세요."
        } else{
            var (n1, n2) = (Int(num1), Int(num2))
            var sum: Int = 0
            
            if n1! > n2! {
                var temp: Int = 0
                temp = n1!
                n1 = n2
                n2 = temp
            }
            for i in n1!...n2!{
                sum += i
            }
            txt = "숫자의 합계는 \(sum)입니다."
            
            
        }
        
        
    }
    
} // End ContentView

#Preview {
    ContentView()
}
