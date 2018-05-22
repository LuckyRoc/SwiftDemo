//
//  HomeTableViewCell.swift
//  SwiftDemo
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    var firstTitle: UILabel? = UILabel()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }

    func setUpUI() {
        firstTitle?.font = UIFont.systemFont(ofSize: 16)
        firstTitle?.textAlignment = NSTextAlignment.center
        firstTitle?.textColor = UIColor.black
        self.addSubview(firstTitle!)
        firstTitle?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        })

    }
    func setValueForCell(dic: NSDictionary) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
