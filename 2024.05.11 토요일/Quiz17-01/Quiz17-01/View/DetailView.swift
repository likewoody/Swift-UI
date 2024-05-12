//
//  DetailView.swift
//  Quiz17-01
//
//  Created by Woody on 5/11/24.
//

import SwiftUI

struct DetailView: View {
    
    var animal: Animal
    
    var body: some View {
        VStack(content: {
            Image(animal.image)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
            Text("이 동물의 이름은 \(animal.name)이고 분류는 \(animal.type)이며 날 수 \(animal.fly)습니다.")
        })
    }
}

//#Preview {
//    DetailView(animal: Animal(name: "test", image: "pig", type: "test", fly: "test"))
//}
