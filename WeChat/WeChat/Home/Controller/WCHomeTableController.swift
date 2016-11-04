//
//  WCHomeTableController.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/1.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class WCHomeTableController: WCBaseTableController {

    var dataArray = [WCHomeListModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 注册cell
        tableView.register(WCHomeCell.classForCoder(), forCellReuseIdentifier: HomeCellIdentifier)
        tableView.rowHeight = WCHomeCell.fixedHeight()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        tableView.backgroundColor = UIColor.clear
        
        setupRandomData(count: 20)
    }
    
    /// 创建随机数据
    private func setupRandomData(count : Int) {
        for _ in 0 ..< count {
            let model = WCHomeListModel()
            model.name = WCRandomData.randomName()
            model.imageName = WCRandomData.randomImageName()
            model.message = WCRandomData.randomMessage()
            
            dataArray.append(model)
        }
    }
}

// MARK: - Table view data source
extension WCHomeTableController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCellIdentifier, for: indexPath) as! WCHomeCell
        
        cell.listModel = dataArray[indexPath.row]
        
        return cell
    }
}
