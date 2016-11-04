//
//  WCTabBarController.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/1.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class WCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 首页
        let home = WCHomeTableController()
        addchildController(title: "微信", imageName: "tabbar_mainframe", vc: home)
        
        // 通讯录
        let contacts = WCContactsTableController()
        addchildController(title: "通讯录", imageName: "tabbar_contacts", vc: contacts)
        
        // 发现
        let discover = WCDiscoverTableController()
        addchildController(title: "发现", imageName: "tabbar_discover", vc: discover)
        
        // 我
        let me = WCMeTableController()
        addchildController(title: "我", imageName: "tabbar_me", vc: me)
        
    }
    
    private func addchildController(title : String, imageName : String, vc : UIViewController) {
        
        let nav = WCNavigationController(rootViewController: vc)
        nav.title = title
        vc.navigationItem.title = title
        
        nav.tabBarItem.image = UIImage.init(named: imageName )?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = UIImage.init(named: imageName + "HL")?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : Color(r: 0, g: 190, b: 12, a: 1.0)], for: .selected)
        addChildViewController(nav)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
