//
//  DispatchQueue+public extension.swift
//  YE
//
//  Created by 侯佳男 on 2017/12/21.
//  Copyright © 2017年 侯佳男. All rights reserved.
//  延迟执行

import Dispatch
import Foundation

public extension DispatchQueue {
    static var userInteractive: DispatchQueue { return DispatchQueue.global(qos: .userInteractive) }
    static var userInitiated: DispatchQueue { return DispatchQueue.global(qos: .userInitiated) }
    static var utility: DispatchQueue { return DispatchQueue.global(qos: .utility) }
    static var background: DispatchQueue { return DispatchQueue.global(qos: .background) }
    
    func ga_after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: closure)
    }
}

/*
DispatchQueue.once(token: "DispatchQueue") {
    
}
 */
// MARK: 执行一次
public extension DispatchQueue {
    private static var _onceTracker = [String]()
    
    class func once(token: String, block: () -> ()) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
    
//    func async(block: @escaping ()->()) {
//        self.async(execute: block)
//    }
//    
//    func after(time: DispatchTime, block: @escaping ()->()) {
//        self.asyncAfter(deadline: time, execute: block)
//    }
}
