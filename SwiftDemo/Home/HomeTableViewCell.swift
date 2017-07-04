//
//  HomeTableViewCell.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/6/30.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var firstTitle  : UILabel? = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    func setUpUI() {

        firstTitle?.font = UIFont.systemFont(ofSize: 18)
        firstTitle?.textAlignment = NSTextAlignment.center
        firstTitle?.textColor = UIColor.blue
        self.addSubview(firstTitle!)
        
        firstTitle?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        })

    }
    
    func setValueForCell(dic: NSDictionary) {
//        firstTitle!.text = "世界各地大排档的招牌美食"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
