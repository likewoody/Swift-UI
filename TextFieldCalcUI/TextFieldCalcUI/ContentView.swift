//
//  ContentView.swift
//  TextFieldCalcUI
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var n1 = ""
    @State var n2 = ""
    @State var toggleAddtion = false
    @State var toggleSubtraction = false
    @State var toggleMultiplication = false
    @State var toggleDivision = false
    
    @State var resultAdd = ""
    @State var resultSub = ""
    @State var resultMul = ""
    @State var resultDiv = ""
    
    @State var storedAdd: Double = 0
    @State var storedSub: Double = 0
    @State var storedMul: Double = 0
    @State var storedDiv: Double = 0
    
    @FocusState var isTextFieldFocused: Bool
    var body: some View {
        VStack {
            Text("간단한 계산기")
                .bold()
            
            Spacer()
            
            HStack(content: {
                Text("첫번째 숫자")
                    .padding()
                TextField("0", text: $n1)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            HStack(content: {
                Text("두번쨰 숫자")
                    .padding()
                TextField("0", text: $n2)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            
            HStack(content: {
                Button("계산하기", action: {
                    // 입력을 안하였을 경우 기본값 0으로 대체
                    let num1 = Double(n1) ?? 0
                    let num2 = Double(n2) ?? 0
//                    guard let num2 = Double(n2) else {return}
                    
                    print(num1)
                    print(num2)
                    
                    let addAction = Addition()
                    
                    storedAdd = addAction.add(num1, num2)
                    storedSub = num1 - num2
                    storedMul = num1 * num2
                    
                    if num2 == 0 {
                        toggleDivision = false
                        resultDiv = "계산 불가"
                    } else {
                        toggleDivision = true
                        storedDiv = num1 / num2
                    }
                    
                    
                    toggleAddtion = true
                    toggleSubtraction = true
                    toggleMultiplication = true
//                    toggleDivision = true
                    
                    isTextFieldFocused = false
                    checkSwitch()
                })
                .padding()
                .frame(width: 120, height: 40)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
                
                Button("지우기", action: {
                    //
                    n1.removeAll()
                    n2.removeAll()
                    
                    toggleAddtion = false
                    toggleSubtraction = false
                    toggleMultiplication = false
                    toggleDivision = false
                    
                    resultAdd.removeAll()
                    resultSub.removeAll()
                    resultMul.removeAll()
                    resultDiv.removeAll()
                    
                    storedAdd = 0
                    storedSub = 0
                    storedMul = 0
                    storedDiv = 0
                    
                })
                .padding()
                .frame(width: 120, height: 40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
            })
            
            Spacer()
            
            
            HStack(content: {
                Spacer()
                Text("덧셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleAddtion)
                    .labelsHidden()
                    .padding(.trailing, 25)
                    .onChange(of: toggleAddtion, {
                        // 이미 계산됨
                        checkSwitch()
                    })
                
                Text("뺄셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleSubtraction)
                    .labelsHidden()
                    .onChange(of: toggleSubtraction, {
                        //
                        checkSwitch()
                    })
                Spacer()
            })
            
            HStack(content: {
                Text("곱셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleMultiplication)
                    .labelsHidden()
                    .padding(.trailing, 10)
                    .onChange(of: toggleMultiplication, {
                        //
                        checkSwitch()
                    })
                
                Text("나눗셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleDivision)
                    .labelsHidden()
                    .onChange(of: toggleDivision, {
                        //
                        checkSwitch()
                    })
            })
            
            Spacer()
            
            HStack(content: {
                Text("덧셈 : ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("0", text: $resultAdd)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })
            
            HStack(content: {
                Text("뺄셈 : ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("0", text: $resultSub)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })
            
            HStack(content: {
                Text("곱셈 : ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("0", text: $resultMul)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })
            
            HStack(content: {
                Text("나눗셈 : ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("0", text: $resultDiv)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })
            
            Spacer()
        }
        
    }// End body
    
    func checkSwitch(){
        resultAdd = toggleAddtion ? String(storedAdd) : ""
        resultSub = toggleSubtraction ? String(storedSub) : ""
        resultMul = toggleMultiplication ? String(storedMul) : ""
        resultDiv = toggleDivision || resultDiv != "계산 불가" ? String(storedDiv) : "계산 불가"
    }
    
} // End ContentView

#Preview {
    ContentView()
}
