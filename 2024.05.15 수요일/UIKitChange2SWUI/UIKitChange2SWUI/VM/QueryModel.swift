//
//  QueryModel.swift
//  UIKitChange2SWUI
//
//  Created by Woody on 5/15/24.
//

import Foundation

struct SearchQuery{
    func loadData(url: URL) async throws -> [Todo]{
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Todo].self, from: data)
    }
}


struct InsertQuery{
    func updateData(url: URL) async throws -> Bool{
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if data.isEmpty{
            return false
        }else{
            return true
        }
    }
}

struct UpdateQuery{
    func updateData(url: URL) async throws -> Bool{
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if data.isEmpty{
            return false
        }else{
            return true
        }
    }
}

struct UpdateCompletion{
    func updateData(url: URL) async throws -> Bool{
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if data.isEmpty{
            return false
        }else{
            return true
        }
    }
}

struct UpdateMoveId{
    func updateData(url: URL) async throws -> Bool{
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if data.isEmpty{
            return false
        }else{
            return true
        }
    }
}

