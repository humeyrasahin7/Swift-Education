//
//  Post.swift
//  FotografPaylasma
//
//  Created by Hümeyra Şahin on 17.07.2021.
//

import Foundation

class Post {
    var email:  String
    var yorum: String
    var gorselUrl: String
    
    init(email: String, yorum: String, gorselUrl: String) {
        
        self.email = email
        self.yorum = yorum
        self.gorselUrl = gorselUrl
        
    }
}
