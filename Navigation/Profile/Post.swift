//
//  Post.swift
//  Navigation
//
//  Created by Admin on 03.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

struct Post {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
    var isLiked: Bool


    static func makeModel() -> [Post] {
        var posts = [Post]()
        posts.append(Post(author: "Solar system", description: "Mercury is the first planet of our Solar system.", image: "Mercury", likes: 1232, views: 5967, isLiked: false))
        posts.append(Post(author: "Milkey Way", description: "Venus is too hot for any form of life.", image: "Venus", likes: 487, views: 1506, isLiked: false))
        posts.append(Post(author: "Andromeda", description: "We'll destroy you one day, the Earth.", image: "Earth", likes: 59873, views: 305667, isLiked: false))
        posts.append(Post(author: "NASA", description: "NASA says that the Red Planer is waiting.",image: "Mars", likes: 65, views: 1157, isLiked: false))
    
        return posts
    }
    
}
