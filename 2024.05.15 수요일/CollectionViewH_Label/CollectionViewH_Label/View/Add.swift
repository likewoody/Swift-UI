//
//  Add.swift
//  CollectionView_Label
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct Add: View {
    
    @Binding var dataArrays: [String]
    @State var addName: String = ""
    @Environment(\.dismiss) var dismiss
    @FocusState var isTextFieldFoucsed: Bool
    
    @State var alertState = false
    
    var body: some View {
        VStack(content: {
            TextField("", text: $addName)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)
                .focused($isTextFieldFoucsed)
            Button("추가", action: {
                dataArrays.append(addName)
                alertState = true
                dismiss()
                isTextFieldFoucsed = false
            })
            .frame(width: 100, height: 50)
            .background(.green)
            .foregroundStyle(.white)
            .padding()
            .alert(isPresented: $alertState) {
                Alert(title: Text("알림"), message: Text("이름이 추가 되었습니다."), dismissButton: .default(Text("확인")))
            }
        }) // VStack
        .navigationTitle("Add Page")
    } // body
} // Add

//#Preview {
//    Add()
//}
