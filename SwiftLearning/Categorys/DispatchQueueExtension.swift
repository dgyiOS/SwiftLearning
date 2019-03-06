//
//  DispatchQueueExtension.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/3/6.
//  Copyright © 2019 邓光洋. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static var `default`: DispatchQueue { return DispatchQueue.global(qos: .`default`) }
    static var userInteractive: DispatchQueue { return DispatchQueue.global(qos: .userInteractive) }
    static var userInitiated: DispatchQueue { return DispatchQueue.global(qos: .userInitiated) }
    static var utility: DispatchQueue { return DispatchQueue.global(qos: .utility) }
    static var background: DispatchQueue { return DispatchQueue.global(qos: .background) }
    
    //@convention(swift)  @convention(block)  @convention(c) swift的闭包，oc的block， c的函数指针
    func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        asyncAfter(deadline: .now(), execute: closure)
    }
    
    private static var _onceTracker = [String]()
    public class func once(block: () -> Void) {
        let token = UUID().uuidString
        
        //OC加解锁
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        if _onceTracker.contains(token) { return }
        _onceTracker.append(token)
        block()
    }
}
