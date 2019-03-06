//
//  ArrayExtension.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/3/4.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import Foundation

//对于基本的enum类型swift默认实现了  func ==<T:RawRepresentable where T.RawValue:Equatable>(lhs:T,rhs:T)->Bool
//但是对于非基本enum的 需要重写==运算符。

public func ==<T: Equatable>(param1: [T]?, param2: [T]?) -> Bool {
    switch (param1, param2) {
    case let (param1?, param2?):
        return param1 == param2
    case (.none, .none):
        return true
    default:
        return true
    }
}

extension Array {
    
    //Get a sub array from range of index
    public func get(at range: ClosedRange<Int>) -> Array {
        //'init' is deprecated: CountableRange is now Range. No need to convert any more.
//        let halfOpenClamedRange = Range(range).clamped(to: Range(indices))
        let halfOpenClamedRange = CountableRange(range)
        return Array(self[halfOpenClamedRange])
    }
    
    //Checks if array contains at least 1 item which type is same with given element's type
    public func containsType<T>(of element: T) -> Bool {
        let elementType = type(of: element)
        return contains { type(of: $0) == elementType }
    }
    
    //Decompose an array to a tuple with first element and the rest
    public func decompose() -> (head: Iterator.Element, tail: SubSequence)? {
        return (count > 0) ? (self[0], self[1..<count]) : nil
    }
    
    //Iterates on each element of the array with its index. (Index, Element)
    public func forEachEnumerated(_ body: @escaping (_ offset: Int, _ element: Element) -> Void) {
        enumerated().forEach(body)
    }
    
    //Gets the object at the specified index, if it exists.
    public func get(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
    
    //Prepends an object to the array.
    //mutating 用来修改struct和enum中的方法
    public mutating func insertFirst(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    //Returns a random element from the array.
    public func random() -> Element? {
        guard count > 0 else { return nil }
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
    
    //Reverse the given index. i.g.: reverseIndex(2) would be 2 to the last
    public func reverseIndex(_ index: Int) -> Int? {
        guard index >= 0 && index < count else { return nil }
        return Swift.max(count - 1 - index, 0)
    }
    
    //Shuffles the array in-place using the Fisher-Yates-Durstenfeld algorithm. 洗牌算法？？？
    public mutating func shuffle() {
        guard count > 1 else { return }
        var j: Int
        for i in 0..<(count - 2) {
            j = Int(arc4random_uniform(UInt32(count - i)))
            if i != i + j { self.swapAt(i, i + j) }
        }
    }
    
    //Shuffles copied array using the Fisher-Yates-Durstenfeld algorithm, returns shuffled array.
    public func shuffled() -> Array {
        var result = self
        result.shuffle()
        return result
    }
    
    //Returns an array with the given number as the max number of elements.
    public func takeMax(_ n: Int) -> Array {
        return Array(self[0..<Swift.max(0, Swift.min(n, count))])
    }
    
    //当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用
    //Checks if test returns true for all the elements in self
    public func testAll(_ body: @escaping (Element) -> Bool) -> Bool {
        return !contains { !body($0) }
    }
    
    //Checks if all elements in the array are true or false
    public func testAll(is condition: Bool) -> Bool {
        return !testAll { ($0 as? Bool) ?? !condition == condition }
    }
}

extension Array where Element: Equatable {
    
    //如果闭包表达式作为函数的唯一实际参数传入，而你又使用了尾随闭包的语法，那你就不需要在函数名后边写圆括号了
    //Checks if the main array contains the parameter array
    public func contains(_ array: [Element]) -> Bool {
        return array.testAll { self.index(of: $0) ?? -1 >= 0 }
    }
    
    //Checks if self contains a list of items.
    public func contains(_ elements: Element...) -> Bool {
        return elements.testAll { self.index(of: $0) ?? -1 >= 0 }
    }
    
    //Returns the indexes of the object
    public func indexes(of element: Element) -> [Int] {
        //flatMap 已经过期
        //Returns the indexes of the object
        return enumerated().compactMap { ($0.element == element) ? $0.offset : nil }
    }
    
    //Returns the last index of the object
    public func lastIndex(of element: Element) -> Int? {
        return indexes(of: element).last
    }
    
    //Removes all occurrences of the given object(s), at least one entry is needed.
    public mutating func removeAll(_ firstElement: Element?, _ elements: Element...) {
        var removeAllArr = [Element]()
        if let firstElementVal = firstElement { removeAllArr.append(firstElementVal) }
        
        elements.forEach({element in removeAllArr.append(element)})
        removeAll(removeAllArr)
    }
    
    //Removes all occurrences of the given object(s)
    public mutating func removeAll(_ elements: [Element]) {
        // COW ensures no extra copy in case of no removed elements
        self = filter { !elements.contains($0) }
    }
    
    //Difference of self and the input arrays.
    public func difference(_ values: [Element]...) -> [Element] {
        var result = [Element]()
        elements: for element in self {
            for value in values {
                if value.contains(element) {
                    continue elements
                }
            }
            result.append(element)
        }
        return result
    }
    
    //Intersection of self and the input arrays.
    public func intersection(_ values: [Element]...) -> Array {
        var result = self
        var intersection = Array()
        
        for (i, value) in values.enumerated() {
            //  the intersection is computed by intersecting a couple per loop:
            //  self n values[0], (self n values[0]) n values[1], ...
            if i > 0 {
                result = intersection
                intersection = Array()
            }
            
            //  find common elements and save them in first set
            //  to intersect in the next loop
            value.forEach { (item: Element) -> Void in
                if result.contains(item) {
                    intersection.append(item)
                }
            }
        }
        return intersection
    }
    
    //Union of self and the input arrays.
    public func union(_ values: [Element]...) -> Array {
        var result = self
        for array in values {
            for value in array {
                if !result.contains(value) {
                    result.append(value)
                }
            }
        }
        return result
    }
    
    //Returns an array consisting of the unique elements in the array
    public func unique() -> Array {        
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }
    
}

