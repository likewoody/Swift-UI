//
//  ContentView.swift
//  PageControl
//
//  Created by Woody on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    
    // Page Control 할 때 이용할 index
    @State var currentPage = 0
    let images = ["flower_01","flower_02","flower_03","flower_04","flower_05","flower_06"]
    
    var body: some View {
        VStack {
            // TabView를 통해서 Page Control 하는 것처럼 만들기
            TabView(selection: $currentPage,
                    content:  {
                ForEach(0..<images.count, id: \.self, content: { index in
                    VStack(content: {
                        Text(images[index])
                            .bold()
                            .font(.system(size: 25))
                            .padding()
                        
                        Image(images[index])
                            .resizable()
                            .frame(width: 350, height: 500)
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 15))
                    }) // VStack
                    .tag(index)
                    
                }) // ForEach
                
            }) // TabView
            // tabViewStyle을 넣어줘서 darg 좌우를 통해 control 할 수 있게 만든다.
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .onAppear(perform: {
                // PageControl 현재 컬러와, 나머지 컬러들을 설정
                UIPageControl.appearance().currentPageIndicatorTintColor = .red
                UIPageControl.appearance().pageIndicatorTintColor = .blue
            })
            
        } // VStack
        .padding()
    } // body
} // ContentView

#Preview {
    ContentView()
}
