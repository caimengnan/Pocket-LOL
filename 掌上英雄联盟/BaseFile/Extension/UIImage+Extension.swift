//
//  UIImage+Extension.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/9/13.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit


extension UIImage {
    
    class func cmn_imageName(_ cmn_imageName: String) -> UIImage? {
       return self.init(named: cmn_imageName)
    }
    
}
