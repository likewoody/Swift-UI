//
//  ContentView.swift
//  Quiz02
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var firstNum = ""
    @State var secondNum = ""
    @State var addition = ""
    @State var subtraction = ""
    @State var multipication = ""
    @State var division = ""
    @State var message = "숫자 연산입니다."
    
    var body: some View {
        VStack(content: {
            Text("두개의 숫자 연산")
                .bold()
                .font(.system(size: 30))
                .padding()
            
            Spacer()
            
            HStack(content: {
                Text("첫번째 숫자")
                TextField("1st Name", text: $firstNum)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    // 글자 라인 정리
                    .multilineTextAlignment(.trailing)
                    // keyboardType
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            }) // End First Num
            
            HStack(content: {
                Text("두번째 숫자")
                TextField("2nd Name", text: $secondNum)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    // 글자 라인 정리
                    .multilineTextAlignment(.trailing)
                    // keyboardType
                    .keyboardType(.numberPad)
                    // Bool 타입
                    .focused($isTextFieldFocused)
            }) // End Second Num
            
            Button("계산하기", action: {
                // 계산하는 logic
                let checkResult = inputCheck()
                if checkResult {
                    displayResult()
                    
                    message = "계산이 완료 되었습니다."
                }else{
                    message = "숫자를 입력하세요."
                }
                // isTextFieldFoucsed가 false면 키보드가 내려가게끔 설정하기 위해 false
                isTextFieldFocused = false
            }) // End Button Calc
            .padding(.top, 10)
            
            Button("초기화", action: {
                clearResult()
                isTextFieldFocused = false
            }) // End Button Clear
            .padding()
            
            Spacer()
            
            HStack(content: {
                Text("덧셈 결과")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("", text: $addition)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    // true Read Only
                    .disabled(true)
            }) // End Add
            HStack(content: {
                Text("뺄셈 결과")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("", text: $subtraction)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    // true Read Only
                    .disabled(true)
            }) // End Sub
            HStack(content: {
                Text("곱셈 결과")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("", text: $multipication)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    // true Read Only
                    .disabled(true)
            }) // End Mul
            HStack(content: {
                Text("나눗셈 결과")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("", text: $division)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    // true Read Only
                    .disabled(true)
            }) // End Div
            .padding(.bottom, 30)
            
            Text(message)
                .padding()
            
            Spacer()
        }) // End VStack
        .padding()
    } // End body
    
    // ---- Functions ----
    func inputCheck() -> Bool{
        if firstNum.isEmpty || secondNum.isEmpty {
            return false
        }
        return true
    }
    
    func displayResult(){
        // binding은 !를 넣어준다.
        // 위에 inputCheck에서 데이터를 이미 확인해 주었기 때문에 guard let은 따로 하지 않아도 되지만 원래는 해야함.
        addition = String(Int(firstNum)! + Int(secondNum)!)
        subtraction = String(Int(firstNum)! - Int(secondNum)!)
        multipication = String(Int(firstNum)! * Int(secondNum)!)
        // Double type Striing format
        division = String(format: "%.2f", Double(firstNum)! / Double(secondNum)!)
    }
    
    func clearResult(){
        firstNum.removeAll()
        secondNum.removeAll()
        addition.removeAll()
        subtraction.removeAll()
        multipication.removeAll()
        division.removeAll()
        
    }
    
} // End struct ContentView

#Preview {
    ContentView()
}
