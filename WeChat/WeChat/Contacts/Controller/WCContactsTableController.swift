//
//  WCContactsTableController.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/1.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class WCContactsTableController: WCBaseTableController {
    /// 模型数组
    var dataArray = [WCContactModel]()
    /// 标题数组
    var sectionTitles = [String]()
    /// 分组数组
    var sectionArray = [[WCContactModel]]()
    
    /// 搜索控制器
    private lazy var searchController : WCSearchController = {
        
        return WCSearchController.customSearchController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置tableView的顶部视图
        tableView.tableHeaderView = searchController.customSearchBar()
        tableView.sectionHeaderHeight = 25
        
        // 注册cell
        tableView.register(WCContactsCell.classForCoder(), forCellReuseIdentifier: ContactsCellIdentifier)
        tableView.rowHeight = WCContactsCell.fixedHeight()
        
        // tableView的设置
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.sectionIndexColor = UIColor.lightGray
        tableView.sectionIndexBackgroundColor = UIColor.clear
        
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
        var newSectionArray = [[WCContactModel]]()
        for _ in 0 ..< numberOfSections {
            newSectionArray.append([WCContactModel]())
        }
        
        // 将模型放进数组
        for model in dataArray {
            let sectionIndex = localizedIndex.section(for: model, collationStringSelector: #selector(getter: WCContactModel.name))
            newSectionArray[sectionIndex].append(model)
        }
        
        // 对每个分组的模型进行排序
        for index in 0 ..< numberOfSections {
            let arrayForSection = newSectionArray[index]
            let sortArray = localizedIndex.sortedArray(from: arrayForSection, collationStringSelector: #selector(getter: WCContactModel.name))
            newSectionArray[index] = sortArray as! [WCContactModel]
        }
        
        // 移除空的分组，并设置组标题
        for index in 0 ..< newSectionArray.count {
            let array = newSectionArray[index]
            if array.count != 0 {
                sectionArray.append(array)
                sectionTitles.append(localizedIndex.sectionTitles[index])
            }
        }
        
        // 创建第一组数据
        var operrationModels = [WCContactModel]()
        let dicts = [["name" : "新的朋友", "imageName" : "plugins_FriendNotify"],
                     ["name" : "群聊", "imageName" : "add_friend_icon_addgroup"],
                     ["name" : "标签", "imageName" : "Contact_icon_ContactTag"],
                     ["name" : "公众号", "imageName" : "add_friend_icon_offical"]]
        for dict in dicts {
            let contactModel = WCContactModel()
            contactModel.name = dict["name"]
            contactModel.imageName = dict["imageName"]
            operrationModels.append(contactModel)
        }
        
        sectionArray.insert(operrationModels, at: 0)
        sectionTitles.insert("", at: 0)
    }
}

// MARK: - Tableview
extension WCContactsTableController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsCellIdentifier, for: indexPath) as! WCContactsCell
         
        cell.contactModel = sectionArray[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return sectionTitles
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitles[section]
    }
}

