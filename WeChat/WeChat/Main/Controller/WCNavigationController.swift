//
//  WCNavigationController.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/1.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class WCNavigationController: UINavigationController {
    
    /// 设置全局底部栏的样式
    override class func initialize() {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        let bar = UINavigationBar.appearance()
        bar.barTintColor = UIColor.init(colorLiteralRed: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        bar.tintColor = UIColor.white
        
        bar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    /// 拦截push操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }

}
