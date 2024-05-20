//
//  AddressDB.swift
//  FirebaseImageAddress
//
//  Created by Woody on 5/19/24.
//

import SwiftUI
import Firebase


struct SearchQuery {
    let db = Firestore.firestore()
    // Binding 으로 데이터를 보내준다.
    @Binding var addressLists: [DBModel]
    
    
    func searchQuery() {
        var datas: [DBModel] = []
        
        db.collection("addresslists")
            .order(by: "name")
            .getDocuments { querySnapshot, error in
                if let e = error {
                    print("error occureded : \(e)")
                }else {
                    querySnapshot?.documents.forEach({ data in
                        guard let reData = data.data()["name"] else{return}
                        
                        print("check \(reData)")
                        
                        let query = DBModel(id: data.documentID,
                                            name: data.data()["name"] as! String,
                                            phone: data.data()["phone"] as! String,
                                            address: data.data()["address"] as! String,
                                            relation: data.data()["relation"] as! String,
                                            imageAddress: data.data()["imageAddress"] as! String)
                        datas.append(query)
                    })
                    DispatchQueue.main.async {
                        addressLists = datas
                    } // DisPatchQueue
                } // else
            } // getDocuments
    } // SearchQuery
    
}


