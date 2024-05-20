//
//  DBModel.swift
//  FavoriteFood
//
//  Created by Woody on 5/19/24.
//

import SwiftUI
import SQLite3

class DBModel: ObservableObject{
    // SQLite3
    var db: OpaquePointer?
    var foodList: [Food] = []
    
    // 없다면 Create query
    init(){
        // userDomainMask = 이 app의 home directory
        // .appending(path: 파일명)
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: "food.sqlite")
        
        // percent 글자 = 한글
        // c 언어 포인터로 쓰는 방법이라 &db<&의 역할 주소 연산자(위치)>라고 사용한다
        if sqlite3_open(fileURL.path(percentEncoded: true), &db) != SQLITE_OK {
            print("error opening database")
        }
        
        
        // Table 만들기
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS food(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, date TEXT, image BLOB, lat TEXT, lng TEXT)", nil, nil, nil) != SQLITE_OK {
            // error message c언어 스트링
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table\ncode : \(errMsg)")
        }
    }
    
    
    // search Query
    // SwiftUI에서는 Protocol 사용 대신에 SearchQuery에서 [Student] type으로 바로 return 해준다.
    // 작업처리가 몇번 덜 움직이기 때문에 효율적이다.
    func queryDB() async -> [Food]{
        var stmt: OpaquePointer?
        let queryString = "SELECT * FROM food"
        
        // 에러가 발생하는지 확인하기 위해서 if문 사용
        // -1 unlimit length 데이터 크기를 의미한다
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table\ncode : \(errMsg)")
        }
        
        // 불러올 데이터가 있다면 불러온다.
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            let id = Int(sqlite3_column_int(stmt, 0))
            let title = String(cString: sqlite3_column_text(stmt, 1))
            let description = String(cString: sqlite3_column_text(stmt, 2))
            let date = String(cString: sqlite3_column_text(stmt, 3))
            
            var image: UIImage = UIImage()
            // Blob 이미지를 UIImage로 만들기
            if let blobImg = sqlite3_column_blob(stmt, 4) {
                let blobImgLength = sqlite3_column_bytes(stmt, 4)
                let img = Data(bytes: blobImg, count: Int(blobImgLength))
                image = UIImage(data: img)!
            }
            
            let lat = String(cString: sqlite3_column_text(stmt, 5))
            let lng = String(cString: sqlite3_column_text(stmt, 6))
            
            foodList.append(Food(id: id, title: title, description: description, date: date, image: image, lat: lat, lng: lng))
        }
        return foodList
    }
    
    
    // insert
    func insertDB(title: String, description: String, date: String, image: UIImage, lat: String, lng: String) async -> Bool{
        var stmt: OpaquePointer?
        
        // 2 bytes의 코드를 쓰는 곳에서 사용함 (한글)
        // -1 unlimit length 데이터 크기를 의미한다
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        let queryString = "INSERT INTO food (title, description, date, image, lat, lng) VALUES (?,?,?,?,?,?)"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        // insert 실행
        // type이 text이기 때문에 bind_text 타입 잘 확인
        sqlite3_bind_text(stmt, 1, title, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 2, description, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, date, -1, SQLITE_TRANSIENT)
        
        // c로 짜여진 방법이기 때문에 NSData alias 설정 0.4는 크기
        let blobImg = image.jpegData(compressionQuality: 0.4)! as NSData
        sqlite3_bind_blob(stmt, 4, blobImg.bytes, Int32(blobImg.length), SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 5, lat, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 6, lng, -1, SQLITE_TRANSIENT)
        
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            return true
        } else {
            print("실패")
            return false
        }
    }
    
    
    // update query
    func updateDB(title: String, description: String, date: String, image: UIImage, id: Int) -> Bool{
        var stmt: OpaquePointer?
        
        // 2 bytes의 코드를 쓰는 곳에서 사용함 (한글)
        // -1 unlimit length 데이터 크기를 의미한다
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        let queryString = "UPDATE food SET title = ?, description = ?, date = ?, image = ? WHERE id = ?"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        // insert 실행
        // type이 text이기 때문에 bind_text 타입 잘 확인
        sqlite3_bind_text(stmt, 1, title, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 2, description, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, date, -1, SQLITE_TRANSIENT)
        
        let blobImg = image.jpegData(compressionQuality: 0.4)! as NSData
        sqlite3_bind_blob(stmt, 4, blobImg.bytes, Int32(blobImg.length), SQLITE_TRANSIENT)
        
        sqlite3_bind_int(stmt, 5, Int32(id))
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            return true
        } else {
            print("실패")
            return false
        }
    }
    
    // delete query
    func deleteDB(id: Int) -> Bool{
        var stmt: OpaquePointer?
        
        // 2 bytes의 코드를 쓰는 곳에서 사용함 (한글)
        // -1 unlimit length 데이터 크기를 의미한다
//        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        let queryString = "DELETE FROM food WHERE id = ?"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        // insert 실행
        // type이 text이기 때문에 bind_text 타입 잘 확인
        sqlite3_bind_int(stmt, 1, Int32(id))
        
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            return true
        } else {
            print("실패")
            return false
        }
    }
}
