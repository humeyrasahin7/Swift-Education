//
//  UserClass.swift
//  IleriSeviyeSwift
//
//  Created by Hümeyra Şahin on 18.07.2021.
//

import Foundation

class UserClass{
    var isim : String
    var yas : Int
    var meslek :  String
    
    init(isim:String,yas:Int,meslek:String) {
        self.isim = isim
        self.meslek = meslek
        self.yas = yas
        
    }
    
    func yasi1Arttir() {
        self.yas = yas + 1
        
    }
}
