//
//  Post.swift
//  HackerNewsClone
//
//  Created by ramil on 15.09.2020.
//

import Foundation

struct Results: Decodable {
    
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let title: String
    let url: String?
}
