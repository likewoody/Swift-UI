//
//  Personal.swift
//  FavoriteFood
//
//  Created by Woody on 5/19/24.
//

import SwiftUI


struct Domestic: View {
    
    @State var foods: [Food] = []
    
    
    var body: some View{
        
        NavigationView(content: {
            List(content: {
                ForEach(foods, id: \.id, content: { food in
                    NavigationLink(destination: DomeUpdate(), label: {
                        Image(uiImage: food.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFit()
                        
                        Text(food.title)
                    }) // Link
                    
                }) // ForEach
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        let item = foods[index]
                        let query = DBModel()
                        _ = query.deleteDB(id: Int(item.id))
                    }
                }) // onDelete
                
            }) // List
            .navigationTitle("맛집 리스트")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: DomeInsert(), label: {
                        Image(systemName: "plus")
                    })
                })
            }) // toolbar
        }) // NavigationView
        .onAppear(perform: {
            print("on Appear")
            foods.removeAll()
            let query = DBModel()
            Task{
                foods = await query.queryDB()
                print("test \(foods)")
            }
        }) // onAppear
    } // body
} // ContentView

#Preview {
    Domestic()
}
