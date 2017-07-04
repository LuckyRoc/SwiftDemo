//
//  MoyaView.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import UIKit
import SnapKit

class RankView: UIView {

    lazy var label = { () -> UILabel in
        
        let label = UILabel()
        label.text = "lazy方式懒加载lable1"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
        label.textAlignment = .center
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.center.equalTo(self)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
