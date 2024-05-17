//
//  Add.swift
//  SQLite
//
//  Created by Woody on 5/17/24.
//

import SwiftUI

struct Add: View {
    
    @State var name: String = ""
    @State var dept: String = ""
    @State var phone: String = ""
    @FocusState var isTextFieldFocused: Bool
    @State var isAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack(content: {
                Text("이름 :  ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("성명 입력", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 이름
            HStack(content: {
                Text("전화 :  ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("번호 입력", text: $phone)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 전화번호
            HStack(content: {
                Text("학과 :  ")
                TextField("학과 입력", text: $dept)
                    .frame(minWidth: 50, alignment: .leading)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 학과
            
        }) // VStack
        .navigationTitle("Add View")
        
        // 입력 버튼을 가운데 배치하기 위해
        VStack(content: {
            Button("Add", action: {
                let queryModel = StudentDB()
                isAlert = queryModel.insertDB(name: name, dept: dept, phone: phone)
                // 이걸 굳이 해줘야 할까?
//                isTextFieldFocused = false
            })
            .padding(10)
            .frame(width: 100)
            .background(.green)
            .foregroundColor(.white)
            .alert("알림", isPresented: $isAlert, actions: {
                Button("추가 되었습니다.", action: {
                    dismiss()
                })
            })
            
        })
        
    } // body
    
} // ContentView

#Preview {
    Add()
}
