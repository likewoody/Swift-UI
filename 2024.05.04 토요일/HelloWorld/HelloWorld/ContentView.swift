//
//  ContentView.swift
//  HelloWorld
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var productName = ""
    @State var productSize = ""
    @State var productWeight = ""
    @State var productBag = ""
    @State var productCol = ""
    
    @State var pName = "제품명"
    
    var body: some View {
        // spacing은 컴퓨터 사양과 HStack의 space를 조정
        VStack(spacing: 10,content: {
            // Binding var이 아니면 그냥 변수처럼 사용하면 되고
            // Binding var이라면 $ 사용
            Text(pName)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(50)
            
            HStack(spacing: 10, content: {
                Text("제품명 :")
                    // minWidth 최소 길이
                    .frame(minWidth: 80, alignment: .leading)

                // Binding(묶는 것) 무엇이랑 묶을거야? (State와 같음)
                // Binding variable가 나온다면 State로 만들어주면 된다.
                // 그리고 var 앞에 $를 붙여준다.
                TextField("제품명을 입력하세요", text: $productName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })
            HStack(spacing: 10, content: {
                Text("화면 크기 :")
                    // minWidth 최소 길이
                    .frame(minWidth: 80, alignment: .leading)

                // Binding(묶는 것) 무엇이랑 묶을거야? (State와 같음)
                // Binding variable가 나온다면 State로 만들어주면 된다.
                // 그리고 var 앞에 $를 붙여준다.
                TextField("화면 크기를 입력하세요", text: $productSize)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })

            HStack(spacing: 10, content: {
                Text("무게 :")
                    // minWidth 최소 길이
                    .frame(minWidth: 80, alignment: .leading)

                // Binding(묶는 것) 무엇이랑 묶을거야? (State와 같음)
                // Binding variable가 나온다면 State로 만들어주면 된다.
                // 그리고 var 앞에 $를 붙여준다.
                TextField("무게를 입력하세요", text: $productWeight)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })

            HStack(spacing: 10, content: {
                Text("가방 :")
                    // minWidth 최소 길이
                    .frame(minWidth: 80, alignment: .leading)

                // Binding(묶는 것) 무엇이랑 묶을거야? (State와 같음)
                // Binding variable가 나온다면 State로 만들어주면 된다.
                // 그리고 var 앞에 $를 붙여준다.
                TextField("가방 유무를 입력하세요", text: $productBag)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })

            HStack(spacing: 10, content: {
                Text("색상 :")
                    // minWidth 최소 길이
                    .frame(minWidth: 80, alignment: .leading)

                // Binding(묶는 것) 무엇이랑 묶을거야? (State와 같음)
                // Binding variable가 나온다면 State로 만들어주면 된다.
                // 그리고 var 앞에 $를 붙여준다.
                TextField("색상을 입력하세요", text: $productCol)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })
            .padding(.bottom, 30)
            
            
            // Button은 action 있는거 사용하면 편하다.
            Button("OK", action: {
                let productName_T: String = "맥북 프로"
                let productSize_T: Int = 16
                let productWeight_T: Double = 2.56
                let productBag_T: Bool = false
                let productCol_T: String = "백"
                
                productName = productName_T
                productSize = String(productSize_T)
                productWeight = String(productWeight_T)
                productBag = String(productBag_T)
                productCol = productCol_T
            })
            .padding()
            // 크기나 사이즈 변경든 하려고 하면 frame이다.
            .frame(width: 90, height: 40)
            .background(.black)
            .foregroundColor(.white)
            // Shape
            .clipShape(.buttonBorder)
            
            Button("Clear", action: {
                productName.removeAll()
                productSize.removeAll()
                productWeight.removeAll()
                productBag.removeAll()
                productCol.removeAll()
            })
            .padding()
            .frame(width: 90, height: 40)
            .foregroundStyle(.red)
            .border(.red, width: 2)
            
            // 맨밑에 Clear 끝나기 전에
            // 간격 조정해주는 친구
            Spacer()
        }) // End VStack
        .padding()
    } // End body
} // End Struct



#Preview {
    ContentView()
}
