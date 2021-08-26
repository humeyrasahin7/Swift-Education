//
//  UserStruct.swift
//  IleriSeviyeSwift
//
//  Created by Hümeyra Şahin on 18.07.2021.
//

import Foundation

struct UserStruct {
    
    var isim : String
    var yas : Int
    var meslek : String
    
   mutating func yasi1Arttir () {
        self.yas += 1
    }
    
}
