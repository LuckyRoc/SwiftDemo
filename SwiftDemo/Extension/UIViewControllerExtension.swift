//
//  UIViewControllerExtension.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/8.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideBackBarButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
