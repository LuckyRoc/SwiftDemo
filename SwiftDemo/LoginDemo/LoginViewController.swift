//
//  LoginViewController.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/5.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView: UIView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
    }

    func initView() {
        
        self.view.addSubview(loginView)
        
        loginView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
