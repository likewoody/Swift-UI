//
//  ContentView.swift
//  FirebaseImageAddress
//
//  Created by Woody on 5/19/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var addressList: [DBModel] = []
    
    var body: some View {
        NavigationView(content: {
            List {
                ForEach(addressList, id: \.id, content: { address in
                    NavigationLink(destination: Detail(address: address), label: {
                        
                        HStack(content: {
                            WebImage(url: URL(string: address.imageAddress))
                                .resizable()
                                .frame(width: 80, height: 60)
                                .padding()
                            
                            VStack(alignment: .leading,content: {
                                Text(address.name)
                                Text(address.phone)
                            })
                        }) // HStack
                        
                    }) // Link
                    
                }) // ForEach
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        let item = addressList[index]
                        let query = CUDQuery()
                        Task{
                            await query.deleteImage(imageAddress: item.imageAddress)
                            query.deleteQuery(id: item.id)
                            print("sccuessfully deleted !")
                        }
                        
                    } // for
                }) // onDelete
                
            } // List
            .onAppear(perform: {
                addressList.removeAll()
                let query = SearchQuery(addressLists: $addressList)
                query.searchQuery()
            }) // onAppear
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: Add(), label: {
                        Image(systemName: "plus")
                    })
                }) // ToolbarItem
            }) // toolbar
            
        }) // NavigationView
        
    } // body
} // ContentView

#Preview {
    ContentView()
}
