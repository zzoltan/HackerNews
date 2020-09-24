//
//  PostData.swift
//  HackerNews
//
//  Created by Zoltan Zavarko on 24/9/20.
//

import Foundation
struct Results: Decodable{
    let hits:[Post]
}

struct Post: Decodable, Identifiable {
    var id: String{
        // computed property
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
