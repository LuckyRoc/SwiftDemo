
//
//  LoginViewModelServer.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/5.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ValidationService {
    
    static let instance = ValidationService()
    
    private init() {}
    
    let minCharactersCount = 6
    
    func login(_ username: String, password: String) -> Observable<Result> {
        let filePath = NSHomeDirectory() + "/Documents/users.plist"
        
        let userDic = NSDictionary(contentsOfFile: filePath)
        
        if username.characters.count == 0 {
            return .just(.failed(message: "用户名为空"))
        }
        
        if username.characters.count < minCharactersCount {
            return .just(.failed(message: "至少6个字符"))
        }
        
        if password.characters.count == 0 {
            return .just(.failed(message: "密码为空"))
        }
        
        if let userPass = userDic?.object(forKey: username) as? String {
            if  userPass == password {
                return .just(.ok(message: "登录成功"))
            }
        }
        
        return .just(.failed(message: "密码错误"))
        
    }
}
