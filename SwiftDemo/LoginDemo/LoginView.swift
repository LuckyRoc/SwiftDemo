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
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 4
        textField.textAlignment = .center
        return textField
    }()

    lazy var userPwdField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "密码"
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 4
        textField.textAlignment = .center
        return textField
    }()

    lazy var loginButton = { () -> UIButton in
        let button = UIButton()
        button.backgroundColor = UIColor.orange
        button.setTitle("登录", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)

        let textFieldHeight = 44

        self.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.height.equalTo(textFieldHeight)
            make.centerX.equalTo(self)
            make.top.equalTo(200)
        }
        self.addSubview(userPwdField)
        userPwdField.snp.makeConstraints { (make) in
            make.width.equalTo(userNameTextField)
            make.height.equalTo(userNameTextField)
            make.centerX.equalTo(self)
            make.top.equalTo(userNameTextField.snp.bottom).inset(-10)
        }
        self.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(userNameTextField)
            make.height.equalTo(userNameTextField)
            make.centerX.equalTo(self)
            make.top.equalTo(userPwdField.snp.bottom).inset(-20)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
