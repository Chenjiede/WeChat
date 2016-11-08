//
//  WCContactsTableController.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/1.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class WCContactsTableController: WCBaseTableController {
    
    var dataArray = [WCContactModel]()
    
    
    /// 搜索控制器
    private lazy var searchController : UISearchController = {
        let searchVC = UISearchController.init(searchResultsController: WCContactsSearchResultController())
        searchVC.view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        return searchVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置tableView的顶部视图
        let bar = searchController.searchBar
        bar.barStyle = UIBarStyle.default
        bar.isTranslucent = true
        bar.barTintColor = GlobalBackgroundColor()
        bar.tintColor = GlobalTintColor()
        let imageView = bar.subviews.first?.subviews.first as! UIImageView
        imageView.layer.borderColor = GlobalBackgroundColor().cgColor
        imageView.layer.borderWidth = 1
        
        bar.layer.borderColor = UIColor.red.cgColor
        bar.showsBookmarkButton = true
        
        bar.setImage(UIImage.init(named: "VoiceSearchStartBtn"), for: .bookmark, state: .normal)
        
        // 设置尺寸
        bar.height = 44
        
        // tableView的设置
        tableView.tableHeaderView = bar
        tableView.sectionIndexColor = UIColor.lightGray
        tableView.sectionIndexBackgroundColor = UIColor.clear
        tableView.sectionHeaderHeight = 25
        
        // 生成数据
        getDataWithCount(count: 30)
    }
    
    /// 生成数据
    private func getDataWithCount(count : Int) {
        let xings = ["赵","钱","孙","李","周","吴","郑","王","冯","陈","楚","卫","蒋","沈","韩","杨"]
        let ming1 = ["大","美","帅","应","超","海","江","湖","春","夏","秋","冬","上","左","有","纯"]
        let ming2 = ["强","好","领","亮","超","华","奎","海","工","青","红","潮","兵","垂","刚","山"]
        
        // 创建模型
        for _ in 0 ..< count {
            var index = arc4random_uniform(UInt32(xings.count))
            var name = xings[Int(index)]
            index = arc4random_uniform(UInt32(ming1.count))
            let ming = ming1[Int(index)]
            name.append(ming)
            
            if arc4random_uniform(10) > 3 {
                index = arc4random_uniform(UInt32(ming2.count))
                name.append(ming2[Int(index)])
            }
            
            let model = WCContactModel()
            model.name = name;
            model.imageName = WCRandomData.randomImageName()
            dataArray.append(model)
        }
        
        // 进行姓名排序
        setUpTableSection()
    }
    
    /// 进行姓名排序
    private func setUpTableSection() {
        let localizedIndex = UILocalizedIndexedCollation.current()
        
        // 创建一个临时数组
        let numberOfSections = localizedIndex.sectionTitles.count
        var newSectionArray = [[String]]()
        for _ in 0 ..< numberOfSections {
            newSectionArray.append([String]())
        }
        
        // 将模型放进数组
        
    }
}

// MARK: - Table view data source
extension WCContactsTableController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCellIdentifier, for: indexPath) as! WCHomeCell
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "constactCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "constactCell")
        }
        
        cell?.textLabel?.text = "message -- \(indexPath.row)"
        
        return cell!
    }
}

