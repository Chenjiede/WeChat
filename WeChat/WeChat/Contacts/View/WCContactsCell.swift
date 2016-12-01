//
//  WCContactsCell.swift
//  WeChat
//
//  Created by chen on 2016/11/10.
//  Copyright © 2016年 JD. All rights reserved.
//

import UIKit

class WCContactsCell: UITableViewCell {
    weak var nameLabel : UILabel?
    weak var iconImageView : UIImageView?
    
    var contactModel : WCContactModel? {
        didSet {
            nameLabel?.text = contactModel?.name
            if let imageName = contactModel?.imageName {
                iconImageView?.image = UIImage.init(named: imageName)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        // 头像
        let iconImageView = UIImageView.init()
        contentView.addSubview(iconImageView)
        self.iconImageView = iconImageView
        
        // 名称
        let nameLabel = UILabel.init()
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = UIColor.darkGray
        contentView.addSubview(nameLabel)
        self.nameLabel = nameLabel
    }
    
    override func layoutSubviews() {
        let height = bounds.height
        let width = bounds.width
        
        // 头像
        iconImageView?.frame = CGRect(x: 8, y: (height - 35) * 0.5, width: 35, height: 35)
        
        // 姓名
        nameLabel?.frame = CGRect(x: 51, y: (height - 30) * 0.5, width: width - 59, height: 30)
    }
    
    class func fixedHeight() -> CGFloat {
        return 50
    }
}
