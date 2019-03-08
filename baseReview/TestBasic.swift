//
//  TestBasic.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/22.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

class TestBasic: NSObject {

}

class testVistorControl {
    // open、 public、 internal、 fileprivate、 private
    
   // open 访问是最高的（限制最少）访问级别，private 是最低的（限制最多）访问级别。
    
    //在指定框架的公共接口时，通常使用 open 或 public 访问
    
    //open访问仅仅适用于类和类成员
    
    //Internal 访问 允许实体被定义模块中的任意源文件访问，但不能被该模块之外的任何源文件访问
    
    //File-private 访问 将实体的使用限制于当前定义源文件中。当一些细节在整个文件中使用时，使用 file-private 访问隐藏特定功能的实现细节
    
    //private 访问 将实体的使用限制于封闭声明中。当一些细节仅在单独的声明中使用时，使用 private 访问隐藏特定功能的实现细节。
}

class testBasicClass {
    
    public func reverseIndex(_ index: Int) -> Int? {
        guard index >= 0 && index < 10 else { return nil }
        return max(10 - 1 - index, 0)
    }
    
    //1、常量和变量   let 常量、 var 变量 (去掉警告，使用_替换)
    //        let cl = 10
    //        var bl = 10
    //        var bl1 = 10, bl2 = 10
    
    //2、类型标注
    //        var lxbz: String
    //        var lxbz1, lxbz2: Double
    
    //3、命名常量和变量，常量和变量的名字不能包含空白字符、数学符号、箭头、保留的（或者无效的）Unicode 码位、连线和制表符。也不能以数字开头
    //        var 🐂 = 3.14
    //        🐂 = 4
    
    //4、输出常量和变量
    //        var a: String
    //        a = "Swift"
    //        print("print the bianliang value is \(a)") //字符串插值，反斜杠转义
    
    //5、注释
    /*单行注释头
     /*嵌套注释块*/
     单行注释尾
     */
    
    //6、分号 一行多句需要分号，单句不需要
    //        let b = 5; print(b)
    
    //7、整数 8、16、32、64位编码有符号和无符号整数
    //        UInt8 Int32
    
    //8、整数范围
    //        let minValue = UInt8.min
    //        let maxValue = UInt8.max
    
    //9、Int   32位平台 Int长度同Int32 64位平台  Int长度同Int64
    //10、UInt 无符号整数类型
    
    //11、浮点数 Double 64位浮点数(至少15位数字的精度)  Float 32位浮点数(至少精度6位)
    
    //12、类型安全和类型推断 Swift 在推断浮点值的时候始终会选择 Double （而不是 Float）
    //        let meaningOfLife = 42
    //        let pi = 3.14159
    //        let anotherPi = 3 + 0.14159
    
    //13、数值型字面量 。。。。<<数学概念相关，麻烦点>>
    
    //整数型字面量
    //十进制    无前缀
    //二进制    0b
    //八进制    0o
    //十六进制   0x
    //都是整数17
    //        let decimalInt = 17; let binaryInt = 0b10001;
    //        let octalInt = 0o21; let hexadecimalInt = 0x11
    
    // 十进制 1.25e2 = 1.25 * 10二次方 1.25e-2 = 1.25 * 10负二次方
    //        let test1 = 1.25e2
    //        let test2 = 1.25e-2
    //十六进制 exp指数 15 * 2二次方  12 * 2负二次方
    //        let test1 = 0xFp2
    //        let test2 = 0xFp-2
    
    //14、数值类型转换
    //整数转换
    //        let testInt: Int16 = 2_0000
    //        let testUint = 1 + UInt(10)
    
    // SomeType(ofInitialValue)  是调用 Swift 类型初始化器并传入一个初始值的默认方法 <*涉及到具体再研究*>
    
    //整数和浮点数转换
    //        let pi = Double(3) + 0.1
    
    //15、类型别名 用typealias 关键字定义类型别名
    //        typealias audioSample = UInt16
    //        var maxNum = audioSample.max
    
    //16、布尔值
    //        let a = true
    //        let b = false
    
    //17、元组 元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型
    //任何类型的排列都可以被用来创建一个元组，他可以包含任意多的类型。例如 (Int, Int, Int) 或者 (String, Bool) ，实际上，任何类型的组合都是可以的
    //        let httpError = (404, "Not Found") // 可以被描述为“一个类型为 (Int, String)  的元组”
    //元组拆分 不需要用_省略，可以取下标拿值，可以通过名字拿元素的值
    //        let (statusCode, _) = httpError
    //        print("the status is \(statusCode)")
    //        print("the status is \(httpError.0)")
    //        let http200 = (start: 200, description: "ok")
    //        print("the status is \(http200.start)")
    
    //18、可选项 可以利用可选项来处理值可能缺失的情况
    //Swift 中的 nil 和Objective-C 中的 nil 不同，在 Objective-C 中 nil 是一个指向不存在对象的指针。在 Swift中， nil 不是指针，他是值缺失的一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型
    //        var testA: Int? = 404
    //        testA = nil
    
    //        var testB: String?
    
    //if语句以及强制展开
    //你可以利用 if 语句通过比较 nil 来判断一个可选中是否包含值。利用相等运算符 （ == ）和不等运算符（ != ）。如果一个可选有值，他就“不等于” nil
    //一旦你确定可选中包含值，你可以在可选的名字后面加一个感叹号 （ ! ） 来获取值，感叹号的意思就是说“我知道这个可选项里边有值，展开吧。”这就是所谓的可选值的强制展开
    //        var a: String?
    //        a = "test"
    //        if a != nil {
    //            print("print \(String(describing: a))")
    //        }
    
    //可选项绑定
    //        if let constantName = Int("2") {
    //            print("\'\(constantName)")
    //        } else {
    //            print("\'\(constantName)")
    //        }
    
    //        if let a = Int("4"), let b = Int("5"), a < b && b < 100 {
    //            print("\(a) < \(b) < 100")
    //        }
    
    //隐式展开可选项
    //        let possibleString: String? = "An optional string."
    //        let forcedString: String = possibleString! // requires an exclamation mark
    //
    //        let assumedString: String! = "An implicitly unwrapped optional string."
    //        let implicitString: String = assumedString // no need for an exclamation mark
    
    //错误处理
    //        func canThrowAnError() throws {
    //
    //        }
    //
    //        do {
    //            try canThrowAnError()
    //        } catch {
    //
    //        }
    
    //断言和先决条件
    //        let a: Int = 5
    //        assert(a == 4, "can't let a != 5")
    //        assert(a == 4)
    //        assertionFailure("fuck")
    
    //强制先决条件
    //        precondition(index > 0, "Index must be greater than zero.")
    
    
    //基本运算符
    //        let (x, y) = (1, 1)
    //        if x == y {
    //            print("x \(x) y \(y)")
    //        }
    //         x...y
    //        x..<y
    
    //        func testA() -> String {
    //            let testStr = """
    //                the fuck test      "
    //       """
    //            return testStr
    //        }
    
    //        var testC = "welcom"
    //        let testStr: Character = "!"
    //        testC.append(testStr)
    
    //创建空数组
    //        var arr = [Int]() // empty array
    //        arr.append(3)     // [3]
    //        arr = []          // empty array
    
    //创建默认数组
    //        var arr2 = Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]
    
    //连接两个数组创建数组
    //        var arr3 = [0.0] + arr2
    
    //        var shoppingList: [String] = ["egg", "milk"]
    //        shoppingList[0...1] = ["a", "b"]
    //        let deleteElement = shoppingList.removeLast()
    
    //        for (index, item) in shoppingList.enumerated() {
    //            print("item \(index + 1): \(item)")
    //        }
    
    //控制流
    
    //for循环
    //for in 遍历array,dictionary,set
    
    //array
    //        let namesArr = ["A", "B", "C", "D"];
    //        for name in namesArr {
    //            print("test \(name)!")
    //        }
    //
    //...闭区间(左右包含) ..<开区间(左包含，右不包含)
    //        for index in 1...5 {
    //            print("\(index) to is \(index * 5)")
    //        }
    
    //        let base = 3
    //        let power = 10
    //        var answer = 1
    //        for _ in 1...power {
    //            answer *= base
    //        }
    //        print("\(base) to the power of \(power) is \(answer)")
    //        let minutes = 60
    //        let minuteInterval = 5
    
    // stride(from:to:by:) 开区间
    // stride(from:through:by:) 闭区间
    
    //        for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    //        }
    
    //dictionary
    //        let namesDic = ["a":1, "b":2]
    //        for (key, value) in namesDic {
    //            print("key \(key) value \(value)")
    //        }
    
    //set
    //        let sets: Set<String> = ["set1", "set2", "set3"]
    //        for setElement in sets {
    //            print("\(setElement)")
    //        }
    
    //while 循环
    //        let a = 25
    //        var b = 1
    //        while b < a {
    //            b += 1
    //        }
    
    //repeat-while 类似OC do-while
    //        repeat {
    //
    //        } while
    
    //条件语句
    //if语句
    //        switch <#value#> {
    //        case <#pattern#>:
    //            <#code#>
    //        default:
    //            <#code#>
    //        }
    
    //        let stillAnotherPoint = (9, 0)
    //        switch stillAnotherPoint {
    //        case (let distance, 0), (0, let distance):
    //            print("On an axis, \(distance) from the origin")
    //        default:
    //            print("Not on an axis")
    //        }
    
    //控制转移语句
    //continue
    //break
    //        if #available(iOS 10, *) {
    //
    //        } else {
    //
    //        }
}

/*
 //如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。 尾随闭包是一个被书写在函数形式参数的括号外面（后面）的闭包表达式
 //如果闭包表达式作为函数的唯一实际参数传入，而你又使用了尾随闭包的语法，那你就不需要在函数名后边写圆括号了：
 //无论你什么时候赋值一个函数或者闭包给常量或者变量，你实际上都是将常量和变量设置为对函数和闭包的引用
 //尾随闭包经典写法
 
 
 func testMethod(param: () -> Void) {
 
 }
 
 
 var completionHandlers: [() -> Void] = []
 //不加escaping 会报错，逃逸闭包
 func testBiBao(completion: @escaping () -> Void) {
 completionHandlers.append(completion)
 }
 
 var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
 print(customersInLine.count)
 
 
 //自动闭包
 func serve(customer customerProvider: @autoclosure () -> String) {
 print("Now serving \(customerProvider())!")
 }
 
 serve(customer: customersInLine.remove(at: 0))
 //print "Now serving Alex!"
 
 */

/*
 //值传递类型
 func test() {
 var a: Int = 5
 handle(a: &a)
 print(a)
 }
 
 func handle(a: inout Int) {
 print(a)
 a = a + 1
 }
 */

/*
 泛型：
 
 func swapTwoInts(_ a: inout Int, _ b: inout Int)
 func swapTwoValues<T>(_ a: inout T, _ b: inout T)
 
 泛型版本的函数用了一个占位符类型名（这里叫做 T ），而不是一个实际的类型名（比如 Int 、 String 或 Double ）。占位符类型名没有声明 T 必须是什么样的，但是它确实说了 a 和 b 必须都是同一个类型 T ，或者说都是 T 所表示的类型，但是它确实说了 a 和 b 必须都是同一个类型 T ，或者说都是 T 所表示的类型。替代 T 实际使用的类型将在每次调用 swapTwoValues(_:_:) 函数时决定。
*/

//struct 和 class区别

//1、property init difference      constructor 构造函数
//主要的差別就是 class 在初始化时不能直接把 property 放在 默认的constructor 的参数里，而是需要自己创建一个带参数的constructor
//        let snode = SNode(Data: 4)
//        print("snode.data:\(String(describing: snode.Data))")
//
//        let cnode = CNode.init(data: 5)
//        cnode.Data = 5
//        print("cnode.data:\(String(describing: cnode.Data))")

//2、变量赋值方式不同(深浅拷贝)

//struct赋值， 会copy一份完整相同的内容给另一个变量
//        let snode = SNode(Data: 4)
//        var snodel = snode
//        snodel.Data = 5
//        print("snode.data:\(String(describing: snode.Data))\n snodel.data:\(String(describing: snodel.Data))")

//class赋值，不会copy一份完整的内容给另一个变量，只是增加了原变量内存地址的引用而已，没有开辟新的内存地址
//        let cnode = CNode.init(data: 6)
//        let cnodel = cnode
//        cnodel.Data = 7
//        print("cnode.data:\(String(describing: cnode.Data))\n cnodel.data:\(String(describing: cnodel.Data))")

//3、struct的fuction要去改变property的值的时候需要加上mutating，而class不用
