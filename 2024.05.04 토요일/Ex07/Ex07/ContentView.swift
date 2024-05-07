//
//  ContentView.swift
//  Ex07
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var kor = ""
    @State var eng = ""
    @State var math = ""
    @FocusState var isTextFieldFocused: Bool
    @State var resultTxt = ""
    
    var body: some View {
        VStack(content: {
            Text("평균점수 등급 계산")
            
            HStack(content: {
                Text("국어 : ")
                TextField("점수 입력", text: $kor)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing
                    )
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            }) // Kor
            HStack(content: {
                Text("영어 : ")
                TextField("점수 입력", text: $eng)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing
                    )
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            }) // Eng
            HStack(content: {
                Text("수학 : ")
                TextField("점수 입력", text: $math)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing
                    )
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            }) // Math
            
            Button("계산하기", action: {
                calc()
            })
            
            Text(resultTxt)
            
        })
        
    } // End body
    
    func calc(){
        if kor.isEmpty || math.isEmpty || eng.isEmpty{
            resultTxt = "정확한 숫자를 입력하세요"
        }else{
            var sum = Double(kor)! + Double(eng)! + Double(math)!
            print(sum)
            var aver = String(format: "%.2f", sum/3)
            switch (sum/3) {
            case 90...100:
                resultTxt = "평균의 합은 \(aver)이고 등급은 수 입니다."
            case 80...89:
                resultTxt = "평균의 합은 \(aver)이고 등급은 우 입니다."
            case 70...79:
                resultTxt = "평균의 합은 \(aver)이고 등급은 미 입니다."
            case 60...69:
                resultTxt = "평균의 합은 \(aver)이고 등급은 양 입니다."
            case 50...59:
                resultTxt = "평균의 합은 \(aver)이고 등급은 가 입니다."
            default:
                resultTxt = "정확한 숫자를 입력하세요"
            }   
        }
    }
     
} // End ContentView

#Preview {
    ContentView()
}
