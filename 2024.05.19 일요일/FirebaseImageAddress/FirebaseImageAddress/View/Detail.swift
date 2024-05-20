//
//  Detail.swift
//  FirebaseImageAddress
//
//  Created by Woody on 5/19/24.
//

import SwiftUI
import PhotosUI
import SDWebImageSwiftUI

struct Detail: View {

    @State var address: DBModel
    
    @State var selectedImg: PhotosPickerItem?
    @State var image: UIImage?
    
    @FocusState var isTextFieldFocused: Bool
    @State var isAlert = false
    @State var isLoading = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(content: {
            
            Spacer()
            
            HStack(content: {
                Text("이름 :")
                    .frame(width: 70)
                    .padding()
                TextField("이름 입력", text: $address.name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                    .focused($isTextFieldFocused)
            }) // HStack
            
            HStack(content: {
                Text("전화번호 :")
                    .frame(width: 70)
                    .padding()
                TextField("전화번호 입력", text: $address.phone)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                    .focused($isTextFieldFocused)
            }) // HStack
            
            HStack(content: {
                Text("주소 :")
                    .frame(width: 70)
                    .padding()
                TextField("주소 입력", text: $address.address)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                    .focused($isTextFieldFocused)
            }) // HStack
            
            HStack(content: {
                Text("관계 :")
                    .frame(width: 70)
                    .padding()
                TextField("관계 입력", text: $address.relation)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                    .focused($isTextFieldFocused)
            }) // HStack
            Spacer()
        }) // VStack
        
            
        VStack(content: {
            // 사진 선택
            PhotosPicker("사진 선택", selection: $selectedImg, matching: .images)
                .padding()
                .onChange(of: selectedImg, {
                    Task{
                        if let data = try? await selectedImg?.loadTransferable(type: Data.self){
                            image = UIImage(data: data)
                        }
                    } // Task
                }) // onChange
            
            Spacer()

            // image
            if let image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 150, height: 200)
                    .scaledToFit()
            }else{
                WebImage(url: URL(string: address.imageAddress))
                    .resizable()
                    .frame(width: 150, height: 200)
                    .padding()
            }
            
            Spacer()
            
            Button("수정", action: {
                updateData()
            })
            .alert("알림", isPresented: $isAlert, actions: {
                Button("수정 되었습니다", action: {dismiss()})
            })
            
            Spacer()
        })
        
        // 이 simulator의 사이즈에 맞게끔 설정하기 위해 GeometryReader를 사용
        GeometryReader { geometry in
            ZStack(content: {
                // indicator func
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            })
            .offset(CGSize(width: geometry.size.width / 2 - 30, height: geometry.size.height / 2 - 430)
            )
        } // GeometryReader
        
    } // body
    
    
    func updateData(){
        isLoading = true
        let query = CUDQuery()
        Task{
            await query.deleteImage(imageAddress: address.imageAddress)
            await query.uploadImage(image: image!, completion: { imageAddress in
                query.updateQuery(id: address.id, name: address.name, phone: address.phone, address: address.address, relation: address.relation, imageAddress: address.imageAddress, completion: { result in
                    if result {
                        print("\(result) test updateData")
                        isAlert = true
                        isLoading = false
                        dismiss()
                        
                    } // result
                    
                }) // updateQuery

            }) // uploadImage

        } // Task
    } // updateData
        
} // ContentView

//#Preview {
//    Detail()
//}
