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

    
    
    lazy var tableView = { () -> UITableView in
        
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(tableView)
        tableView.backgroundColor = UIColor.white
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
