//
//  JDArray+Extension.swift
//  WeChat
//
//  Created by chen on 2016/11/10.
//  Copyright © 2016年 JD. All rights reserved.
//

import Foundation

extension Array where Element : Equatable {
    /// 删除一个对象
    mutating func removeObject(object : Element) {
        if let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
    
    /// 删除包含的数组
    mutating func removeObjectInArrays(array : [Element]) {
        for obj in array {
            
            self.removeObject(object: obj)
        }
    }
    
}
