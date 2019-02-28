//
//  EnumerTool.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/2/28.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import UIKit

enum ASCIIChar: Character { //枚举关联值
    case tab = "\t"
    case line = "\n"
}

enum EnumerationSample: CaseIterable { //CaseIterable 协议 表面允许枚举被遍历
    case north
    case south
    case east
    case west
    case a, b
}

class EnumerTool: NSObject {

    var enuSample = EnumerationSample.west
    let numChoices = EnumerationSample.allCases.count
    
    
    override init() {
        super.init()
        enuSample = .north
        print("\(enuSample)")
        print("\(numChoices) bverages available")
        
        for beverage in EnumerationSample.allCases {
            print(beverage)
        }
        
    }
}
