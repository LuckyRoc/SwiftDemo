//
//  LoginViewController.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/5.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    let loginView: LoginView = LoginView()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
//        loginView.loginButton.rx.tap
        
//        let nameObserable = loginView.userNameTextField.rx.text.shareReplay(1).map({($0?.characters.count)! >= 6})
//            
    
    }

    func initView() {
        
        self.title = "RxSwift登录Demo"
        self.view.backgroundColor = .white
        
        self.view.addSubview(loginView)
        
        loginView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
