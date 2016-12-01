//
//  WCSearchController.swift
//  WeChat
//
//  Created by chen on 2016/11/28.
//  Copyright © 2016年 JD. All rights reserved.
//

import UIKit

class WCSearchController: UISearchController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class func customSearchController() -> WCSearchController {
        let searchVC = WCSearchController.init(searchResultsController: WCContactsSearchResultController())
        searchVC.view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        return searchVC 
    }
    
    func customSearchBar() -> UISearchBar {
        
        let bar = self.searchBar
        bar.delegate = self;
        bar.barStyle = UIBarStyle.default
        bar.isTranslucent = true
        bar.barTintColor = GlobalBackgroundColor()
        bar.tintColor = GlobalTintColor()
        let imageView = bar.subviews.first?.subviews.first as! UIImageView
        imageView.layer.borderColor = GlobalBackgroundColor().cgColor
        imageView.layer.borderWidth = 1
        
        bar.layer.borderColor = UIColor.red.cgColor
        bar.showsBookmarkButton = true
        bar.placeholder = "搜索"
        
        bar.setImage(UIImage.init(named: "VoiceSearchStartBtn"), for: .bookmark, state: .normal)
        
        // 设置尺寸
        bar.height = 44
        
        return bar
    }
    
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        // 更改取消按钮的文字
        searchBar.showsCancelButton = true
        let canleBtn = searchBar.value(forKey: "cancelButton") as! UIButton
        canleBtn.setTitle("取消", for: .normal)
        
        return true
    }
    
}
