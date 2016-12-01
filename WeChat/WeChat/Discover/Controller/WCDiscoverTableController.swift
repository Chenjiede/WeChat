//
//  WCDiscoverTableController.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/1.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class WCDiscoverTableController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    class func discoverController() -> WCDiscoverTableController {
        let vc = UIStoryboard.init(name: "Discover", bundle: nil)
        
        return vc.instantiateInitialViewController() as! WCDiscoverTableController
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let tabVC = WCTimeLineController()
            
            self.navigationController?.pushViewController(tabVC, animated: true)
        }
    }
}
