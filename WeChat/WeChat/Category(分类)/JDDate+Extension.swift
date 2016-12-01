//
//  JDDate+Extension.swift
//  WeChat
//
//  Created by chen on 2016/11/3.
//  Copyright © 2016年 JD. All rights reserved.
//

import UIKit

extension Date {
    /// 将时间转字符串转换Date
    public static func dateWithString(str : String) -> Date? {
        // 创建时间格式化对象
        let formatter = DateFormatter.init()
        formatter.dateFormat = "EEE MM dd HH:mm:ss Z yyyy";
        formatter.locale = Locale.init(identifier: "en")
        
        // 将时间转字符串转换Date
        return formatter.date(from: str)
    }
    
    /// 返回格式化之后的时间字符串
    var desc : String {
        // 1. 创建时间格式化对象
        let formatter = DateFormatter.init()
        formatter.locale = Locale.init(identifier: "en")
        
        // 2. 日历对象
        let calendar = Calendar.current
        
        if calendar.isDateInToday(self) {
            
            let timeInterval = Int(timeIntervalSince(self))
            
            if timeInterval < 60  {
                return "刚刚"
            } else if timeInterval < 60 * 60 {
                return "\(timeInterval / 60)分钟以前"
            } else if timeInterval < 60 * 60 * 24 {
                return "\(timeInterval / (60 * 60))小时前"
            }
        }
        
        // 昨天
        var formatterStr = "HH:mm"
        
        
        return formatter.string(from: self)
    }
    
}
