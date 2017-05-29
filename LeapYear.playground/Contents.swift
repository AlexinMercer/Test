//: Playground - noun: a place where people can play

import UIKit

func isLeapYear(n:Int) -> Bool {
    return ((n % 4 == 0) && (n % 100 != 0)) || (n % 400 == 0)
}

let year_start = 2000
let year_stop = 2017
var years:NSMutableArray = NSMutableArray()

for i:Int in year_start...year_stop {
    if isLeapYear(n:i) {
        years.add(i)
    }
}

let result = years.componentsJoined(by: "@")
print(result)