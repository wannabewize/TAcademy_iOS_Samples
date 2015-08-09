// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let urlStr = "https://www.google.com/search?q=아이폰"
let encoded = urlStr.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
