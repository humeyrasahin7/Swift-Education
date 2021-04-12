import UIKit

func functionSample() {
    print("sample")
}

functionSample()

//parametre, input
func myFunction(a : String){
    print(a)
}
myFunction(a: "hüm")

//output, return
func add(x:Int, y:Int) -> Int{ //-> return type istiyor
    let res = x+y
    return res
}
add(x: 5, y: 6)

//opsiyoneller-optionals

var myName : String? //bunun bir değeri olabilir olmaya da bilir ama bekleyebilirsin sonucu niil verir

myName?.uppercased()
myName = "kaan"
myName?.uppercased()


var userNo = "5"

//force unwrapping
//var sonuc = Int(userNo)! * 5 //ünlem demek oluyorki ben girilen verinin inte çevireceğinden %100 eminim demek string girilirse fatal error uygulama çöker.
var sonuc = (Int(userNo) ?? 1) * 5 //kullanıcı no yu çevirebiliyor musun bak çevirirsen sonucu çeviremiyorsan 1 döndür işlemi öyle yap

if let yeniSonuc = Int(userNo){
    yeniSonuc * 5
    
} else{
    print("yanlış değer giriyorsun tekrar gir")
}
