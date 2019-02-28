//
//  ViewController.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/19.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
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

    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

}

