//
//  ClassAndStructTool.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/28.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

/**
 类和结构体的选择
 
 类和结构体都可以用来定义自定义的数据类型，作为你的程序代码构建块。
 《结构体》实例总是通过“值传递”，而《类》实例总是通过“引用传递”
 
 1、结构体的主要目的是为了封装一些相关的简单数据值；
 2、当你在赋予或者传递结构实例时，有理由需要封装的数据值被拷贝而不是引用
 3、任何存储在结构体中的属性是值类型，也将被拷贝而不是被引用
 4、结构体不需要从一个已存在类型继承属性或者行为
 
 事实上，大部分的自定义的数据结构应该是类，而不是结构体
 */

//struct StructSample {
//    var width: Int
//    var height: Int
//}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var a = 100
let b = 100


class ClassAndStructTool: NSObject {
    
    override init() {
        super.init()

        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        let squareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("\(squareCenter)")
        print("square.origin is (\(square.origin.x), \(square.origin.y))")
    
        let stepCounter = TestClass()
        stepCounter.totalSteps = 200
        
    }
    
    
    
//    lazy var fuckTest = FuckClass()
}

class TestClass {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("set totalSteps \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("\(totalSteps - oldValue) steps")
            }
        }
    }
}

//class ClassSample {
//    var structSample = StructSample(width: 3, height: 4)
//    var fuck1 = false
//    var fuck2 = 0.0
//    var name: String?
//}

//class FuckClass {
//    var fileName = "fuck"
//}
