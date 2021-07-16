//
//  Kullanici.swift
//  SwiftOOP
//
//  Created by Hümeyra Şahin on 12.04.2021.
//

import Foundation

enum KullaniciTipi{
    case Admin
    case Normal
    case Yetkisiz
}

class Kullanici {
    var isim : String
    var yas : Int
    var meslek : String
    var tip : KullaniciTipi
    
    //initializer
    init(isim: String, yas: Int, meslek: String, tip:KullaniciTipi) {
        print("init çağırıldı")
        self.isim = isim
        self.yas = yas
        self.meslek = meslek
        self.tip = tip
    }
    func ornekFonk(){
        print("ornek fonk")
    }
    
    
    //access levels
    // open public internal fileprivate private
    
    
}
