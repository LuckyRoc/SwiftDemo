//
//  MoyaView.swift
//  SwiftDemo
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import SnapKit

class RankView: UIView {

    lazy var label = { () -> UILabel in
        
        let label = UILabel()
        label.text = "lazy 方式懒加载的 lable1"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var tableView = { () -> UITableView in
        
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
//        self.addSubview(label)
//        
//        label.snp.makeConstraints { (make) in
//            make.width.equalTo(300)
//            make.height.equalTo(50)
//            make.center.equalTo(self)
//        }
     
        self.addSubview(tableView
        )
        tableView.backgroundColor = UIColor.white
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
