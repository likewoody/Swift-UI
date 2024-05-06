//
//  ContentView.swift
//  Tabbar
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    // 탭 번호 관리를 위한 index
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection, content:  {
            // tag가 없으면 작동시 모든 동작이 태그 0번으로 돌아온다.
            Group {
                StartView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Start View")
                    }
                    .tag(0)
                
                ImageView()
                    .tabItem {
                        Image(systemName: "car")
                        Text("Image")
                    }
                    .tag(1)
                
                DatePickerView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Date")
                    }
                    .tag(2)
                
            } // Group
            
            // toolbar 컬러 입히기 visible 사용 안하면 색상을 넣어도 보이지 않음
            .toolbarBackground(.red, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
        }) // TabView
        
        
    } // body
    
} // ContentView

#Preview {
    ContentView()
}
