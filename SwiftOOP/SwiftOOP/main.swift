//
//  main.swift
//  SwiftOOP
//
//  Created by Hümeyra Şahin on 12.04.2021.
//

import Foundation

let humeyra  = Kullanici(isim: "hümeyra", yas: 24, meslek: "müh",tip: KullaniciTipi.Admin)

print(humeyra.meslek)

humeyra.ornekFonk()

let zeynep = ozelKullanıcı(isim: "zeynep",yas:24, meslek:"dev", tip: KullaniciTipi.Normal)
zeynep.ornekFonk()
