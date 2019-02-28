//
//  BibaoTool.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/27.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

class BibaoTool: NSObject {

    //MARK:闭包
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    
    /*闭包表达式语法
     { (parameters) -> (return type) in
        statements
     }
     */
    
    //尾随闭包:如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。尾随闭包是一个被书写在函数形式参数的括号外面（后面）的闭包表达式
    func TestFuction(closure:() -> Void) {
        
    }
    
    //捕获值
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    //闭包是引用类型 无论你什么时候赋值一个函数或者闭包给常量或者变量，你实际上都是将常量和变量设置为对函数和闭包的引用
    
    //逃逸闭包  当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用
    
    
    //闭包能够捕获和存储定义在其上下文中的任何常量和变量的引用，这也就是所谓的闭合并包裹那些常量和变量，因此被称为“闭包”，Swift 能够为你处理所有关于捕获的内存管理的操作。
    
    //自动闭包 自动闭包是一种自动创建的用来把作为实际参数传递给函数的表达式打包的闭包。它不接受任何实际参数，并且当它被调用时，它会返回内部打包的表达式的值
    
    
    
    //MARK:init
    override init() {
        super.init()
        //闭包表达式
        let names = ["c", "b", "a", "n"]
        let testNum = names.sorted(by: backward)
        print("test \(testNum)")
        
        var reversedNames = names.sorted { (s1: String, s2: String) -> Bool in
            return s1 > s2
        }
        
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
        //从语境中推断类型
        reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
        //从单表达式闭包隐式返回
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
        //简写的实际参数名
        reversedNames = names.sorted(by: { $0 > $1 })
        //运算符函数  Swift 的 String 类型定义了关于大于号（ >）的特定字符串实现
        reversedNames = names.sorted(by: >)
        //尾随闭包
        reversedNames = names.sorted() {$0 > $1}
        reversedNames = names.sorted {$0 > $1}
        
        TestFuction { }
        TestFuction() { }
        
        let digitNames = [
            0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
            5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
        ]
        let numbers = [14, 52, 520]
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print("\(incrementByTen)")
        
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        
        print("\(strings)")
        print("\(reversedNames)")
        
        var customersInLine = ["a", "b"]
        print(customersInLine.count)
        
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        
        serve(customer: {customersInLine.remove(at: 0)})
    }
    
    //逃逸闭包
    //闭包可以逃逸的一种方法是被储存在定义于函数外的变量里
    var completionHandlers: [() -> Void] = []
    
    //传给函数的形参是“逃逸闭包” ，需要显式地引用self
    func Bibaotaoyi(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }
    //传给函数的形参是“非逃逸闭包”，可以隐式地引用self
    func Feitaoyibibao(closure: () -> Void) {
        closure()
    }
    
    var x = 10
    func doSomething() {
        //传给函数的形参是“逃逸闭包” ，需要显式地引用self
        Bibaotaoyi { self.x = 100 }
        //传给函数的形参是“非逃逸闭包”，可以隐式地引用self
        Feitaoyibibao { x = 200 }
    }
    
    func serve(customer customerProvider: () -> String) {
        print("\(customerProvider())!")
    }
    
}

class SomeClass {

}
