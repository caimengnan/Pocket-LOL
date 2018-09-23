//
//  SnapImage.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/9/17.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import Foundation
import UIKit

struct SnapImage {
    static let shared = SnapImage()
    static var imageArray = [UIImageView]()
}

extension SnapImage {
    //全屏截图
    public func theFullScreenSnap() -> UIImageView? {
        
        let screenWindow = UIApplication.shared.keyWindow
        
        guard let screen_window = screenWindow else {
            return nil
        }
        
        UIGraphicsBeginImageContext(screen_window.frame.size)
        screenWindow?.layer.render(in: UIGraphicsGetCurrentContext()!)
        let snapImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageView = UIImageView(frame: (screenWindow?.frame)!)
        imageView.image = snapImage
        
        return imageView
    }
}




