//: Playground - noun: a place where people can play

import UIKit

let n = 20
let rotaciones = [1,-1,-1,1,1,1,1,-1]
let x = 4
let y = 6

var m = NSMutableArray()
var c = 1
for y in 0...n-1 {
    var col = NSMutableArray()
    for x in 0...n-1 {
        col.add(c)
        c += 1
    };
    m.add(col)
};

let pre_result:NSMutableArray = m[y] as! NSMutableArray
let result = pre_result[x]
print(result);

