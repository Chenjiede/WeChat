//
//  WCHomeCell.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/3.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class WCHomeCell: UITableViewCell {
    
    weak var iconImageView : UIImageView?
    weak var nameLabel : UILabel?
    weak var timeLabel : UILabel?
    weak var messageLabel : UILabel?
    weak var deletBtn : UIButton?
    weak var tagBtn : UIButton?
    
    /// 传入的数据模型
    var listModel : WCHomeListModel? {
        didSet {
            nameLabel?.text = listModel?.name
            messageLabel?.text = listModel?.message
            if let imageName = listModel?.imageName  {
                iconImageView?.image = UIImage.init(named: imageName)
            }
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
        
        setupGestureRecognizer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
//        setupGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化内部控件
    private func setup() {
        // 基本设置
        contentView.backgroundColor = UIColor.white
        selectionStyle = UITableViewCellSelectionStyle.none
        
        // 头像
        let iconImageView = UIImageView.init()
        contentView.addSubview(iconImageView)
        self.iconImageView = iconImageView
        
        // 名称
        let nameLabel = UILabel.init()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        self.nameLabel = nameLabel
        
        // 时间
        let timeLabel = UILabel.init()
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = UIColor.lightGray
        contentView.addSubview(timeLabel)
        self.timeLabel = timeLabel
        
        // 信息
        let messageLabel = UILabel.init()
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = UIColor.lightGray
        contentView.addSubview(messageLabel)
        self.messageLabel = messageLabel
        
        // 删除按钮
        let deletBtn = UIButton.init(type: UIButtonType.custom)
        deletBtn.setTitle("删除", for: UIControlState.normal)
        deletBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        deletBtn.backgroundColor = UIColor.red
        insertSubview(deletBtn, belowSubview: contentView)
        self.deletBtn = deletBtn
        
        // 标记未读
        let tagBtn = UIButton.init(type: UIButtonType.custom)
        tagBtn.setTitle("标记未读", for: UIControlState.normal)
        tagBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        tagBtn.backgroundColor = UIColor.lightGray
        insertSubview(tagBtn, belowSubview: contentView)
        self.tagBtn = tagBtn
    }
    
    /// 添加手势
    private func setupGestureRecognizer() {
        let pan = UIPanGestureRecognizer.init(target: self, action:#selector(panView(pan:)))
        pan.delaysTouchesBegan = false
        contentView.addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer.init(target: self, action:#selector(tapView(tap:)))
        tap.isEnabled = false
        contentView.addGestureRecognizer(tap)
    }
    
    /// 拖拽手势监听
    @objc private func panView(pan : UIPanGestureRecognizer) {
        JDLog(message: "panView")
    }
    
    /// 拍击手势监听
    @objc private func tapView(tap : UITapGestureRecognizer) {
        JDLog(message: "tapView")
    }
    
    override func layoutSubviews() {
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        self.iconImageView?.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        self.nameLabel?.frame = CGRect(x: 70, y: 10, width: width - 150, height: 26)
        
        self.timeLabel?.frame = CGRect(x: width - 70, y: 10, width: 60, height: 16)
        
        self.messageLabel?.frame = CGRect(x: 70, y: height - 31, width: width - 80, height: 18)
        
        self.deletBtn?.frame = CGRect(x: width - 60, y: 0, width: 60, height: height)
        
        self.tagBtn?.frame = CGRect(x: width - 120, y: 0, width: 60, height: height)
    }
    
}

// MARK : 外部接口方法
extension WCHomeCell {
    class func fixedHeight() -> CGFloat {
        return 70.0
    }
}
