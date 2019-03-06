//
//  DictionaryExtension.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/3/6.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import Foundation

extension Dictionary {
    
    //Returns the value of a random Key-Value pair from the Dictionary
    public func random() -> Value? {
        return Array(values).random()
    }
    
    //Union of self and the input dictionaries.
    public func union(_ dictionaries: Dictionary...) -> Dictionary {
        var result = self
        dictionaries.forEach { (dictionary) -> Void in
            dictionary.forEach { (arg) -> Void in
                let (key, value) = arg
                result[key] = value
            }
        }
        return result
    }
    
    //Checks if a key exists in the dictionary.
    public func has(_ key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    //Creates an Array with values generated by running
    // each [key: value] of self through the mapFunction.
    //map函数 public func map<T>(_ transform: ((key: Key, value: Value)) throws -> T) rethrows -> [T]
    public func toArray<T>(_ map: (Key, Value) -> T) -> [T] {
        return self.map(map)
    }
    
    //Creates a Dictionary with the same keys as self and values generated by running
    // each [key: value] of self through the mapFunction.
    public func mapValues<T>(_ map: (Key, Value) -> T) -> [Key: T] {
        var mapped: [Key: T] = [:]
        forEach {
            mapped[$0] = map($0, $1)
        }
        return mapped
    }
    
    //  Creates a Dictionary with the same keys as self and values generated by running
    // each [key: value] of self through the mapFunction discarding nil return values.
    public func mapFilterValues<T>(_ map: (Key, Value) -> T?) -> [Key: T] {
        var mapped: [Key: T] = [:]
        forEach {
            if let value = map($0, $1) {
                mapped[$0] = value
            }
        }
        return mapped
    }
    
    // Creates a Dictionary with keys and values generated by running
    // each [key: value] of self through the mapFunction discarding nil return values.
    public func mapFilter<K, V>(_ map: (Key, Value) -> (K, V)?) -> [K: V] {
        var mapped: [K: V] = [:]
        forEach {
            if let value = map($0, $1) {
                mapped[value.0] = value.1
            }
        }
        return mapped
    }
    
    // Creates a Dictionary with keys and values generated by running
    // each [key: value] of self through the mapFunction.
    public func map<K, V>(_ map: (Key, Value) -> (K, V)) -> [K: V] {
        var mapped: [K: V] = [:]
        forEach {
            let (_key, _value) = map($0, $1)
            mapped[_key] = _value
        }
        return mapped
    }
    
    //Constructs a dictionary containing every [key: value] pair from self
    // for which testFunction evaluates to true.
    public func filter(_ test: (Key, Value) -> Bool) -> Dictionary {
        var result = Dictionary()
        for (key, value) in self {
            if test(key, value) {
                result[key] = value
            }
        }
        return result
    }
    
    //Checks if test evaluates true for all the elements in self.
    public func testAll(_ test: (Key, Value) -> (Bool)) -> Bool {
        return contains { !test($0, $1) }
    }
    
    
    //Unserialize JSON string into Dictionary
    //jsonObject函数 open class func jsonObject(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> Any
    public static func constructFromJSON(json: String) -> Dictionary? {
        if let data = (try? JSONSerialization.jsonObject(
            with: json.data(using: String.Encoding.utf8, allowLossyConversion: true)!,
            
            options: JSONSerialization.ReadingOptions.mutableContainers)) as? Dictionary {
            
            return data
        } else {
            return nil
        }
    }
    
    // Serialize Dictionary into JSON string
    public func formatJson() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions()) {
            let jsonStr = String(data: jsonData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            return String(jsonStr ?? "")
        }
        return nil
    }
}

extension Dictionary where Value: Equatable {
    // Difference of self and the input dictionaries.
    // Two dictionaries are considered equal if they contain the same [key: value] pairs.
    public func difference(_ dictionaries: [Key: Value]...) -> [Key: Value] {
        var result = self
        for dictionary in dictionaries {
            for (key, value) in dictionary {
                if result.has(key) && result[key] == value {
                    result.removeValue(forKey: key)
                }
            }
        }
        return result
    }
}

//Combines the first dictionary with the second and returns single dictionary
//运算符重载
public func += <KeyType, ValueType>(left: inout [KeyType: ValueType], right: [KeyType: ValueType]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}
