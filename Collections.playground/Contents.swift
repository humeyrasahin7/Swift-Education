import UIKit

//Collections

var firstArray =  ["humeyra","bedirhan","irem","burcu"]

//index

firstArray[0].uppercased()
firstArray[2] = "İrem"
firstArray[2]

//karışık dizinin yanına as any koyarsan karışık veri tiplerinden ooluşan dizi oluşturabilirsin
var heterogenArray = [100,200,"hüm",true, false] as [Any]

//as -> casting, any-> to any obj
var newVar = heterogenArray[2] as! String //ünlem koyunca ben bu işlemin çalışacağından eminin sen çalıştır demek opsiyoneller

heterogenArray.append("zeynep")

heterogenArray.count // element sayısı = index + 1
heterogenArray.last  //son element
//sort sıraya göre dizer. alfabe, sayılar


//2. koleksiyon SET içerisinde bir eleman sadece bir defa yer alabiliyor

var numbers = [1,1,1,1,3,4,5,6]

var numbersSet : Set = [1,1,1,3,2,5,6] //düzen, index vs yok ama uniqe karakterlerle

var orderArray = ["ist", "ist", "ayt", "ank"]
orderArray.count
var orderSet = Set(orderArray)
orderSet.count

// üçüncü set sözlük
//dictionary
//key value pairing

let meyveDizisi = ["armut","muz","elma","karpuz"]
let kaloriDizisi = [100,150,120,300]

meyveDizisi[2]
kaloriDizisi[2]

let meyveKaloriDictionary = ["armut":100, "muz":150, "elma":120, "karpuz": 300]
meyveKaloriDictionary["armut"]

meyveKaloriDictionary.keys
meyveKaloriDictionary.values

//sadece str int değil str str int int de yapılabiliyor


