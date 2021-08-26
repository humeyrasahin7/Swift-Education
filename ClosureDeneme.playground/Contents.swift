import UIKit

func sum(num1:Int, num2:Int) -> Int {
    return num1 + num2
}



func calculate(num1: Int, num2: Int, myFunc: (Int,Int)->Int) -> Int {
    return myFunc(num1,num2)
}
calculate(num1: 5, num2: 6, myFunc: sum)




calculate(num1: 7, num2: 7, myFunc: { (num1:Int, num2: Int) -> Int in
    return num1 * num2
})



calculate(num1: 7, num2: 7, myFunc: { (num1, num2) -> Int in
    return num1 * num2
})

calculate(num1: 7, num2: 7, myFunc: { (num1, num2) in num1 * num2 })

calculate(num1: 4, num2: 5, myFunc: {$0 * $1})

let myArray = [10,20,30,40]

func test(num1: Int) -> Int{
    return num1 / 5

}

myArray.map(test)
