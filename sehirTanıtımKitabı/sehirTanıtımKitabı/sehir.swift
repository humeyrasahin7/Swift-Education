//
//  sehir.swift
//  sehirTanıtımKitabı
//
//  Created by Hümeyra Şahin on 13.04.2021.
//

import Foundation
import UIKit

class Sehir {
    var isim : String
    var bolge : String
    var gorsel : UIImage
    
    init(isim:String, bolge:String, gorsel:UIImage) {
        self.isim = isim
        self.bolge = bolge
        self.gorsel = gorsel
    }
    
}
