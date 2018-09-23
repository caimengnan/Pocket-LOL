//
//  AllProtocols.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/9/13.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

protocol CustomNavBarDelegate {}

extension CustomNavBarDelegate where Self: UIViewController {
    
    var customNavBar:CMNCustomNavBar {
        return CMNCustomNavBar(frame: CGRect(x: 0, y: 0, width: kWidth, height: totalNavHeight))
    }
}

protocol NibLoadProtocol {}
extension NibLoadProtocol {
    static func loadViewNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
}


