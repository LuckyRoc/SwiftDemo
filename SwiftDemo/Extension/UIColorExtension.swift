//
//  ToolExtension.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/5.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import CoreImage

let screenWidth: CGFloat = UIScreen.main.bounds.width
let screenHeight: CGFloat = UIScreen.main.bounds.height

extension UIColor {
    static func RGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red / 255,
                            green: green / 255,
                            blue: blue / 255,
                            alpha: 1.0)
    }
    static func colorFromHex(hex: UInt32) -> UIColor {
        return UIColor.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((hex & 0xFF)) / 255.0,
                            alpha: 1.0)
    }
}
