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
    weak var eyeAnimationView : WCEyeAnimationView?
    
    /// 搜索控制器
    private lazy var searchController : WCSearchController = {
       
        return WCSearchController.customSearchController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 注册cell
        tableView.register(WCHomeCell.classForCoder(), forCellReuseIdentifier: HomeCellIdentifier)
        tableView.rowHeight = WCHomeCell.fixedHeight()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        tableView.backgroundColor = UIColor.clear
        tableView.tableHeaderView = searchController.customSearchBar()
        tableView.sectionHeaderHeight = 25
        
        setupRandomData(count: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 判断眼睛视图是否存在
        if eyeAnimationView == nil {
            setupEyeAnimationView()
        }
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
    
    /// 创建眼睛动画视图
    private func setupEyeAnimationView() {
        let eyeView = WCEyeAnimationView()
        eyeView.bounds = CGRect(x: 0, y: 0, width: 65, height: 44)
        eyeView.center = CGPoint(x: view.bounds.width * 0.5, y: 70)
        tableView.superview?.insertSubview(eyeView, at: 0)
        eyeAnimationView = eyeView
        
        // 添加手势
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(panView(pan:)))
        tableView.superview?.addGestureRecognizer(pan)
//        pan.delegate = self
    }
    
    
}

// MARK: - 手势处理方法
extension WCHomeTableController {
    @objc func panView(pan : UIPanGestureRecognizer) {
        JDLog(message: "12")
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

// MARK: - scrollDelegate
extension WCHomeTableController {
    
}
