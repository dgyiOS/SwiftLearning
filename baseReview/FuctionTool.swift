//
//  FuctionTool.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/27.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

class FuctionTool: NSObject {

    //MARK: 全局函数
    func greet(person: String) -> String {
        let greeting = "hello" + person + "!"
        return greeting
    }
    
    //无参数的函数
    func SayNoParams() -> String {
        return "no params"
    }
    
    //多形式参数函数
    func SayMoreParams(params1: String, params2: Bool) -> String {
        if params2 {
            return "params2"
        } else {
            return "params1"
        }
    }
    
    //无返回值函数
    func SayNoReturn(params: String) {
        print("hello")
    }
    
    //当函数被调用时，函数的返回值可以被忽略
    func print1(string: String) -> Int {
        print(string)
        return string.count
    }
    
    func print2(string: String) {
        let _ = print1(string: string)
    }
    
    //多返回值的函数，可以使用元组类型作为返回类型
    //可选元组返回类型 为了安全的处理这种“空数组”情景，需要把返回类型写做可选元组，当数组是空的时候返回一个nil值
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        var curMin = array[0]
        var curMax = array[0]
        for value in array[1..<array.count] {
            if value < curMin {
                curMin = value
            } else if value > curMax {
                curMax = value
            }
        }
        return (curMin, curMax)
    }
    
    //函数实际参数标签和形式参数名
    func testFunction1(firstParam: Int, secondeParam: Int) { }
    func testFunction2(_: Int) { }
    //指定实际参数标签--->实际参数标签的使用能够让函数的调用更加明确，更像是自然语句，同时还能提供更可读的函数体并更清晰地表达你的意图
    func testFunction3(argument params: Int) { }
    
    //省略实际参数标签
    func testFunction4(_ params1: Int, params2: Int) { }
    //默认形式参数值
    func testFunction5(paramsDefault: Int = 12) { }
    //可变形式参数
    func testFunction6(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    //输入输出形式参数 inout关键字可以定义一个输入输出形式参数
    func testFunction7(_ a: inout Int, _ b: inout Int) {
        let temp = a
        a = b
        b = temp
    }
    
    //函数类型
    func testFunction8(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    //函数类型作为形式参数类型
    func hanshuAdd(_ testFunction8: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(testFunction8(a, b))")
    }
    
    //函数类型作为返回类型
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    
    func stepBack(_ input: Int) -> Int {
        return input - 1
    }
    //函数返回值是 (Int) -> Int
    func chooseStepFuction(back: Bool) -> (Int) -> Int {
        return back ? stepBack : stepForward
    }
    
    //MARK: 内嵌函数
    //在函数的内部定义另外一个函数。这就是内嵌函数。
    func chooseStepFuction2(back: Bool) -> (Int) -> Int {
        func stepForward2(input: Int) -> Int { return input + 1 }
        func stepBack2(input: Int) -> Int { return input - 1 }
        return back ? stepBack2 : stepForward2
    }
    
    
    //MARK: init
    override init() {
        super.init()

        //利用可选项绑定去检查这个函数返回了一个实际的元组值还是nil
        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
            print("min is \(bounds.min) and max is \(bounds.max)")
        }
        
        testFunction1(firstParam: 1, secondeParam: 1)
        testFunction2(2)
        testFunction3(argument: 3)
        testFunction4(4, params2: 4)
        testFunction5()
        testFunction5(paramsDefault: 5)
        
        var testA = 3
        var testB = 4
        swap(&testA, &testB)
        
        //使用函数类型
        let mathFunction: (Int, Int) -> Int = testFunction8
        print("Result: \(mathFunction(1, 2))")
        
        hanshuAdd(testFunction8(_:_:), 3, 5)
        hanshuAdd(testFunction8, 3, 5)
        
        let currentValue = 3
        let moveDirection = chooseStepFuction(back: currentValue > 0)
        print("\(moveDirection)")
    }
    
}

