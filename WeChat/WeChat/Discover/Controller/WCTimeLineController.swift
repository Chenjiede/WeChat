//
//  WCTimeLineController.swift
//  WeChat
//
//  Created by chen on 2016/11/30.
//  Copyright © 2016年 JD. All rights reserved.
//

import UIKit

class WCTimeLineController: UITableViewController {
    
    lazy private var iconImageNamesArray : [String] = {
        
        return ["icon0.jpg", "icon1.jpg", "icon2.jpg", "icon3.jpg", "icon4.jpg"]
    }()
    
    lazy private var namesArray : [String] = {
        
        return ["GSD_iOS", "风口上的猪", "当今世界网名都不好起了", "我叫郭德纲", "Hello Kitty"]
    }()
    
    lazy private var textArray : [String] = {
        
        return ["当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，https://github.com/gsdios/SDAutoLayout大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
            "然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，https://github.com/gsdios/SDAutoLayout等于把小屏完全拉伸。",
            "当你的 app 没有提供 3x 的 LaunchImage 时屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。屏幕宽度返回 320；https://github.com/gsdios/SDAutoLayout然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。",
            "但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
            "屏幕宽度返回 320；https://github.com/gsdios/SDAutoLayout然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。"]
    }()
    
    lazy private var commentsArray : [String] = {
    
        return ["社会主义好！👌👌👌👌", "正宗好凉茶，正宗好声音。。。", "你好，我好，大家好才是真的好", "有意思", "你瞅啥？", "瞅你咋地？？？！！！", "hello，看我", "曾经在幽幽暗暗反反复复中追问，才知道平平淡淡从从容容才是真", "人艰不拆", "咯咯哒", "呵呵~~~~~~~~", "我勒个去，啥世道啊", "真有意思啊你💢💢💢"]
    }()
    
    lazy private var picImageNamesArray : [String] = {
       
        return ["pic0.jpg", "pic1.jpg", "pic2.jpg", "pic3.jpg", "pic4.jpg", "pic5.jpg", "pic6.jpg", "pic7.jpg",
                "pic8.jpg"]
    }()
    
    lazy var dataArray : [WCTimeLineCellModel] = {
       
        return [WCTimeLineCellModel]()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 生成数据
        creatModels(with: 10)
        
        // 注册cell
        tableView.register(WCTimeLineCell.classForCoder(), forCellReuseIdentifier: TimeLineCellIdentifier)
    }
    
    /// 生成数据
    private func creatModels(with count:Int){
       
        for _ in 0 ..< count {
            let iconIndex = Int(arc4random_uniform(5))
            let nameIndex = Int(arc4random_uniform(5))
            let contentIndex = Int(arc4random_uniform(5))
            
            let model = WCTimeLineCellModel()
            model.iconName = iconImageNamesArray[iconIndex]
            model.name = namesArray[nameIndex]
            model.msgContent = textArray[contentIndex]
            
            // 模拟随机发图片
            let random = Int(arc4random_uniform(6))
            var tempPics = [String]()
            
            for _ in 0 ..< random {
                let randomIndex = Int(arc4random_uniform(9))
                tempPics.append(picImageNamesArray[randomIndex])
            }
            
            if tempPics.count > 0 {
                model.picNamesArray = tempPics
            }
            
            // 模拟随机评论数据
            
            // 模拟随机点赞数据
            
            dataArray.append(model)
        }
    }
}

// MARK: - Table view data source
extension WCTimeLineController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: TimeLineCellIdentifier, for: indexPath) as! WCTimeLineCell
     
//        cell.textLabel?.text = "123"
        cell.backgroundColor = UIColor.green
     
     return cell
     }
 
}
