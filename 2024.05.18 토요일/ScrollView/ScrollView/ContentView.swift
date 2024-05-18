//
//  ContentView.swift
//  ScrollView
//
//  Created by Woody on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Scroll View")
                .bold()
                .font(.largeTitle)
            // ScrollView를 넣으면 위에 있는 component는 top으로 밀린다.
            // like title처럼
            ScrollView(content: {
                VStack(spacing: 30, content: {
                    ForEach(1...20, id:\.self,  content: { index in
                        Text("Row \(index)")
                            .font(.callout)
                            .foregroundStyle(.blue)
                            .padding()
                    })
                })
                .frame(maxWidth: .infinity)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
