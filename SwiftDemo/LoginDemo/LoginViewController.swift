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
    var viewModel: LoginViewModel!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()

        viewModel = LoginViewModel(input: (
            username: loginView.userNameTextField.rx.text.orEmpty.asDriver(),
            password: loginView.userPwdField.rx.text.orEmpty.asDriver(),
            loginTaps: loginView.loginButton.rx.tap.asDriver()),
                                   service: ValidationService.instance)

        viewModel.loginButtonEnabled
            .drive(onNext: { [unowned self] valid in
                self.loginView.loginButton.isEnabled = valid
                self.loginView.loginButton.alpha = valid ? 1 : 0.5
            })
            .addDisposableTo(disposeBag)

        viewModel.loginResult
            .drive(onNext: { [unowned self] result in
                switch result {
                case let .ok(message):
                    self.showAlert(message: message)
                case .empty:
                    self.showAlert(message: "")
                case let .failed(message):
                    self.showAlert(message: message)
                }
            })
            .addDisposableTo(disposeBag)
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

    func showAlert(message: String) {
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertViewController.addAction(action)
        present(alertViewController, animated: true, completion: nil)
    }
}
