//
//  ContentView.swift
//  Ex09
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var n1 = ""
    @State var n2 = ""
    
    @State var tA = false
    @State var tS = false
    @State var tM = false
    @State var tD = false
    
    @State var add = ""
    @State var sub = ""
    @State var div = ""
    @State var mul = ""
    
    @State var storedA: Double = 0
    @State var storedS: Double = 0
    @State var storedM: Double = 0
    @State var storedD: Double = 0
    
    @FocusState var isTextFieldFoucsed: Bool
    
    var body: some View {
        VStack(content: {
            Text("간단한 계산기")
                .font(.system(size: 20))
                .bold()
        }) // 간단한 계산기
        
        HStack(content: {
            Text("첫번째 숫자")
                .padding(.trailing,20)
            TextField("0", text: $n1)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .focused($isTextFieldFoucsed)
        })
        HStack(content: {
            Text("두번째 숫자")
                .padding(.trailing,20)
            TextField("0", text: $n2)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .focused($isTextFieldFoucsed)
        }) // 입력 숫자 1, 숫자 2
        
        
        HStack(content: {
            Button("계산하기", action: {
                
                var num1 = Double(n1) ?? 0
                var num2 = Double(n2) ?? 0
                
                storedA = num1 + num2
                storedS = num1 - num2
                storedM = num1 * num2
                storedD = num1 / num2
                
                isTextFieldFoucsed = false
                
                tA = true
                tS = true
                tM = true
                tD = true
                calc()
                
            })
            .padding()
            .frame(width: 120, height: 40)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.buttonBorder)
            
            
            
            Button("지우기", action: {
                n1 = ""
                n2 = ""
                
                tA = false
                tS = false
                tM = false
                tD = false
                
                add = ""
                sub = ""
                div = ""
                mul = ""
                
                storedA = 0
                storedS = 0
                storedM = 0
                storedD = 0
            })
            .padding()
            .frame(width: 120, height: 40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.buttonBorder)
        }) // 계산하기 & 지우기 버튼
        
        HStack(content: {
            Text("덧셈")
                .frame(minWidth: 30)
            Toggle("", isOn: $tA)
                .labelsHidden()
                .onChange(of: tA, {
                    //
                    calc()
                })
                .padding(.trailing,30)
            Text("뺄셈")
                .frame(minWidth: 45)
            Toggle("", isOn: $tS)
                .labelsHidden()
                .onChange(of: tS, {
                    //
                    calc()
                })
        }) // 덧셈 & 뺄셈
        
        HStack(content: {
            Text("곱셈")
                .frame(minWidth: 30)
            Toggle("", isOn: $tM)
                .labelsHidden()
                .onChange(of: tM, {
                    //
                    calc()
                })
                .padding(.trailing,30)
            Text("나눗셈")
                .frame(minWidth: 30)
            Toggle("", isOn: $tD)
                .labelsHidden()
                .onChange(of: tD, {
                    //
                    calc()
                })
        }) // 곱셈 & 나눗셈
        
        HStack(content: {
            Text("덧셈 결과 : ")
            TextField("0", text: $add)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .disabled(true)
        })
        HStack(content: {
            Text("뺄셈 결과 : ")
            TextField("0", text: $sub)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .disabled(true)
        })
        HStack(content: {
            Text("곱셈 결과 : ")
            TextField("0", text: $mul)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .disabled(true)
        })
        HStack(content: {
            Text("나눗셈 결과 : ")
            TextField("0", text: $div)
                .frame(width: 120)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .disabled(true)
        }) // 사칙연산 결과
    } // body
    
    // ---- Functions ----
    func calc() {
        
        add = tA ? String(storedA) : ""
        sub = tS ? String(storedS) : ""
        mul = tM ? String(storedM) : ""
        div = storedD.isFinite && tD ? String(storedD) : tD ? "계산 불가" : ""
    }
} // contentView

#Preview {
    ContentView()
}
