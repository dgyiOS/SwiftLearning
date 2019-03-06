//
//  StringExtension.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/3/6.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import Foundation

extension String {
    
    public func substring(from index: Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex..<self.endIndex]
            return String(subString)
        } else {
            return self
        }
    }
    
}
