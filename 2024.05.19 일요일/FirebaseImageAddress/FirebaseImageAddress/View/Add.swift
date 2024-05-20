//
//  Add.swift
//  FirebaseImageAddress
//
//  Created by Woody on 5/19/24.
//

import SwiftUI
import FirebaseStorage
import PhotosUI

struct Add: View {
    
    @State var name: String = ""
    @State var phone: String = ""
    @State var address: String = ""
    @State var relation: String = ""
    @State var imageAddres: String = ""
    
    @State var selectedImg: PhotosPickerItem?
    @State var image: UIImage?
    
    @FocusState var isTextFieldFocused: Bool
    @State var isAlert: Bool = false
    @State var isLoading: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(content: {
            
            Spacer()
            
            HStack(content: {
                Text("이름 :")
                    .frame(width: 70)
                    .padding()
                TextField("이름 입력", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                    .focused($isTextFieldFocused)
            }) // HStack
            
            HStack(content: {
                Text("전화번호 :")
                    .frame(width: 70)
                    .padding()
                TextField("전화번호 입력", text: $phone)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                    .focused($isTextFieldFocused)
            }) // HStack
            
            HStack(content: {
                Text("주소 :")
                    .frame(width: 70)
                    .padding()
                TextField("주소 입력", text: $address)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                    .focused($isTextFieldFocused)
            }) // HStack
            
            HStack(content: {
                Text("관계 :")
                    .frame(width: 70)
                    .padding()
                TextField("관계 입력", text: $relation)
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
            } // if let
            
            Spacer()
            
            Button("추가", action: {
                addData()
            })
            .alert("알림", isPresented: $isAlert, actions: {
                Button("추가 되었습니다", action: {dismiss()})
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
        }
        
    } // body
    
    
    func addData(){
        Task{
            isLoading = true
            let query = CUDQuery()
            await query.uploadImage(image: image!, completion: { imageAddress in
                query.insertQuery(name: name, phone: phone, address: address, relation: relation, imageAddress: imageAddress!, completion: { result in
                    if result {
                        isAlert = true
                        // indicator 끝나면 멈춰라
                        isLoading = false
                    }
                })
            })
        }

    }
        
} // ContentView
// indicator
struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

#Preview {
    Add()
}
