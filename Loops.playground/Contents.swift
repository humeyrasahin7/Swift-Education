import UIKit

//loops döngüler

//while
5 == 5
5 == 4
5 != 4
2 <= 2

var x = 0

print("döngü başladı")
while x <= 10 {
    print(x)
    x = x+1 // +=1
    
}

print("döngü bitti")

//for loop
var myArray = ["ahmet", "furkan", "mehmet", "zeynep", "hdong"]

for isim in myArray {
    print(isim.uppercased())
}

var myNumArray = [0,1,2,3,4,10,60,100]

for num in myNumArray {
    let Num = num * 4
    print(Num)
}

//conditional statements
//if
// and && or ||

let myAge = 18
if myAge < 20 {
print("çok gençsin")
} else if myAge > 20 || myAge < 30{
    print("yirmilerindesin")
}


