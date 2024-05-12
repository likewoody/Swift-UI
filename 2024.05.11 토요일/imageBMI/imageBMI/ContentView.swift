//
//  ContentView.swift
//  imageBMI
//
//  Created by Woody on 5/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var bmiImage: String = "bmi"
    @State var result: String = "bmi를 측정하세요"
    
    @State var weightList: [Int] = []
    @State var selectedWeight = 0
    @State var heightList: [Int] = []
    @State var selectedHeight = 0
    
    var body: some View {
        VStack(content: {
            Text("BMI 측정기")
                .bold()
                .padding(.bottom, 50)
            
            HStack(content: {
                VStack(content: {
                    Text("몸무게 (kg)")
                        .bold()
                    Picker("", selection: $selectedWeight, content: {
                        ForEach(30...150, id: \.self, content: { weight in
                            Text("\(weight)")
                        }) // ForEach
                    }) // Picker
                    .pickerStyle(.wheel)
                    .labelsHidden()
                    .onAppear(perform: {
                        // 초기값 설정
                        selectedWeight = 60
                    }) // onAppear
                    
                }) // VStack
                
                VStack(content: {
                    Text("키 (kg)")
                        .bold()
                    Picker("", selection: $selectedHeight, content: {
                        ForEach(130...210, id: \.self, content: { height in
                            Text("\(height)")
                        }) // ForEach
                    }) // Picker
                    .pickerStyle(.wheel)
                    .labelsHidden()
                    .onAppear(perform: {
                        // 초기값 설정
                        selectedHeight = 160
                    }) // onAppear
                    
                }) // VStack
                
            }) // HStack
            
            
            Button("측정", action: {
                calcBMI()
            }) // Button
            .frame(width: 80)
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 15))
            .padding()
            
            Text(result)
                .padding()
            
            Image(bmiImage)
                .resizable()
                .frame(width: 300, height:  200)
                .scaledToFit()
            
        }) // VStack
        
        
    } // body
    
    // ---- funcionts ----
    func calcBMI(){
        let (height, weight) = (Double(selectedHeight), Double(selectedWeight))
              
          let height2 = ((height/100) * (height/100))
          
          let bmi:String = String(format: "%.2f", (weight/height2))
          
          switch Double(bmi)!{
          case 0..<18.4:
              bmiImage = "bmi2Skinny"
              result = "귀하의 bmi 지수는 \(bmi)이고 저체중입니다."
          case 18.5..<22.9:
              bmiImage = "bmiSkinny"
              result = "귀하의 bmi 지수는 \(bmi)이고 정상체중."
          case 23..<24.9:
              bmiImage = "bmiNormal"
              result =  "귀하의 bmi 지수는 \(bmi)이고 과체중입니다."
          case 25..<29.9:
              bmiImage = "bmiFat"
              result = "귀하의 bmi 지수는 \(bmi)이고 비만."
          default:
              bmiImage = "bmi2Fat"
              result =  "귀하의 bmi 지수는 \(bmi)이고 고도비만."
          }
    }
    
} // ContentView

#Preview {
    ContentView()
}
