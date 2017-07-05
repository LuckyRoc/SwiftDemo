//
//  LoginView.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/5.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit

class LoginView: UIView {

    lazy var userNameTextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "用户名"
        textField.textColor = UIColor.black
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var userPwdField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "密码"
        textField.textColor = UIColor.black
        textField.textAlignment = .center
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.addSubview(userNameTextField)
        
        userNameTextField.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.center.equalTo(self)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
