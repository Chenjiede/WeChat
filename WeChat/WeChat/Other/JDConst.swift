//
//  JDConst.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/3.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

/// 服务器地址
let BASE_URL = ""

/// 第一次启动
let FirstLaunch = "firstLaunch"
/// 是否登录
let isLogin = "isLogin"

func JDLog<T>(message : T, filename : String = #file, methodname : String = #function, linenumber : Int = #line) {
    
    #if DEBUG
        let file = (filename as NSString).pathComponents.last!.components(separatedBy:".").first!
        print("\(file).\(methodname)[\(linenumber)]")
        print(message)
        
    #endif
}

/****************** 颜色 ******************/
/// 跟进rgb来生成颜色
public func Color(r : CGFloat, g : CGFloat, b : CGFloat, a : CGFloat) -> UIColor {
    
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 随机颜色
public func RandomColor() -> UIColor {
    let r = CGFloat(arc4random_uniform(256))
    let g = CGFloat(arc4random_uniform(256))
    let b = CGFloat(arc4random_uniform(256))
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}

/// 全局背景色
func GlobalBackgroundColor() -> UIColor {
    return Color(r: 248, g: 248, b: 248, a: 1.0)
}

/// 全局文字颜色
func GlobalTintColor() -> UIColor {
    return Color(r: 0, g: 190, b: 12, a: 1.0)
}
