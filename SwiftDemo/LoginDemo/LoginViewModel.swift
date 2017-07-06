//
//  LoginViewModel.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/5.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum Result {
    case ok(message: String)
    case empty
    case failed(message: String)
}

class LoginViewModel: NSObject {
    
    let loginButtonEnabled: Driver<Bool>
    let loginResult: Driver<Result>
    
    init(input: (username: Driver<String>, password: Driver<String>, loginTaps: Driver<Void>), service: ValidationService) {
        
        let usernameAndPassword = Driver.combineLatest(input.username, input.password) {
            ($0, $1)
        }
        
        loginResult = input.loginTaps.withLatestFrom(usernameAndPassword).throttle(0.3)
            .flatMapLatest { (username, password) in
                return service.login(username, password: password)
                    .asDriver(onErrorJustReturn: .failed(message: "failed"))
        }
        
        loginButtonEnabled = input.password
            .map { $0.characters.count > 0 }
            .asDriver()
    }
    
}
