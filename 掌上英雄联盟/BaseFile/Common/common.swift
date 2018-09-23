//
//  common.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 屏幕宽高
let kHeight:CGFloat = UIScreen.main.bounds.size.height
let kWidth:CGFloat = UIScreen.main.bounds.size.width
let edgFrame_X:CGFloat = kWidth * 4 / 5

//状态栏高度
var kStatusHeight = UIApplication.shared.statusBarFrame.size.height
//导航栏高度
let kNavHeight:CGFloat = 44
//导航栏加状态栏
var totalNavHeight = kNavHeight + kStatusHeight
//tabbar高度
let kTabbarHeight = UITabBar.appearance().frame.size.height
//适应屏幕宽度
func FIT_SCREEN_WIDTH(_ size: CGFloat) -> CGFloat {
    return size * kWidth / 375.0
}
//适应屏幕高度
func FIT_SCREEN_HEIGHT(_ size: CGFloat) -> CGFloat {
    return size * kHeight / 667.0
}


// MARK: -通知名称
let kLeftBtnClickActionNotify = NSNotification.Name("kLeftBtnClickAction")
let kRightBtnClickActionNotify = NSNotification.Name("kRightBtnClickAction")



