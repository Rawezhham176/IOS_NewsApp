//
//  PostData.swift
//  H4X0R News
//
//  Created by rawezh on 19.11.21.
//

import Foundation

struct Results: Decodable {
    let  sources: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String
    let name: String
    let description: String
    let url: String?
}
