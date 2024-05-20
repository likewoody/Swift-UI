//
//  InsertQuery.swift
//  FirebaseImageAddress
//
//  Created by Woody on 5/19/24.
//

import SwiftUI
import FirebaseStorage
import Firebase

struct CUDQuery{
    
    let db = Firestore.firestore()
    
    // type String인 이유 urlPath를 받아야 하기 때문
    func uploadImage(image: UIImage, completion: @escaping (String?) -> (Void)) async{
        print("get in ")
        // image를 jpeg를 전환하기
        guard let img = image.jpegData(compressionQuality: 0.2) else {
            completion(nil)
            return
        }
        // images/Random이름.jpg 로 이미지 생성
        let storageRef = Storage.storage().reference().child("images/\(UUID().uuidString).jpg")

        // Metadata
        let metedata = StorageMetadata()
        metedata.contentType = "image/jpg"

        // 실제 이미지 insert
        storageRef.putData(img, metadata: metedata) { meteData, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    completion(nil)
                    return
                } else {
                    // upload한 imagePath 체크 보내기
                    completion(url?.absoluteString)
                }
            }
        }
        print("get out update")
    }
    
    func insertQuery(name: String, phone: String, address: String, relation: String, imageAddress: String, completion: @escaping (Bool) -> (Void)) {
        
         db.collection("addresslists")
             .addDocument(data: [
                 "name" : name,
                 "phone" : phone,
                 "address" : address,
                 "relation" : relation,
                 "imageAddress" : imageAddress,
             ]){ error in
                 if error != nil {
                     completion(false)
                 }else{
                     completion(true)
                 }
             }
    }
    
    
    func updateQuery(id: String, name: String, phone: String, address: String, relation: String, imageAddress: String, completion: @escaping (Bool) -> (Void)){
        
        db.collection("addresslists")
            .document(id)
            .updateData([
                "name" : name,
                "phone" : phone,
                "address" : address,
                "relation" : relation,
                "imageAddress" : imageAddress
            ]){ error in
                completion(false)
            }
        completion(true)
    }
    
    // Delete Image
    func deleteImage(imageAddress: String) async {
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()
        // Note that in the URL, characters are URL escaped!
        let httpsReference = storage.reference(forURL: imageAddress)
        
        httpsReference.delete{ error in
            if let error = error{
                print("Error Delete : \(error)")
            }else{
                print("Successfully Deleted!")
            }
        }
        
    }
    
    func deleteQuery(id: String) {
        db.collection("addresslists")
            .document(id)
            .delete()
    }
}
