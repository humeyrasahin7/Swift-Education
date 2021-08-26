//
//  main.swift
//  IleriSeviyeSwift
//
//  Created by Hümeyra Şahin on 18.07.2021.
//

import Foundation

let humeyraSinif = UserClass(isim: "hümeyra", yas: 24, meslek: "mühendis")


var humeyraStruct = UserStruct(isim: "humeyra", yas: 24, meslek: "müh")
 
humeyraStruct.yas = 25

//referans ve değer farkı
let humSinifKop = humeyraSinif
var humStructKop = humeyraStruct

humSinifKop.yas = 22
humStructKop.yas = 99


print(humeyraSinif.yas)
print(humeyraStruct.yas)

print("********")

print(humeyraSinif.yas)
humeyraSinif.yasi1Arttir()
print(humeyraSinif.yas)

print("----------")
print(humeyraStruct.yas)
humeyraStruct.yasi1Arttir()
print(humeyraStruct.yas)


//tuple

var benimTuple = (10,30,"benim")

print(benimTuple.0)
benimTuple.0 = 50
print(benimTuple.0)
print(benimTuple.2)


// guard let

let numString = "3"

func inteCevirenIfLet(string : String) -> Int {
    if let benimInt = Int(string){
        return benimInt
    } else {
        return 0
    }
    
}

print(inteCevirenIfLet(string: numString))


func inteCevirenGuardLet(string :  String) -> Int {
    guard let benimIntGuard = Int(string) else {
        return 0
        
    }
    return benimIntGuard
}

print(inteCevirenGuardLet(string: numString))


//break point






