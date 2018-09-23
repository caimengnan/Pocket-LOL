//
//  CMNCustomNavBar.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/9/13.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit
import SnapKit

class CMNCustomNavBar: CMNView {

    var leftButton = UIButton(tittle: "", fontSize: 17, tittleColor: .black)
    var rightButton = UIButton(tittle: "", fontSize: 17, tittleColor: .black)
    var middleTittleView:UIView!
    
    //左边按钮的图片
    var btnImage:UIImage? {
        didSet {
            leftButton.setImage(btnImage, for: .normal)
        }
    }
    
    //左边按钮的标题
    var btnTitle:String? {
        didSet {
            leftButton.setTitle(btnTitle, for: .normal)
        }
    }

    override func layoutSubviews() {
        
        leftButton.frame = CGRect(x: 5, y: kStatusHeight, width: 50, height: 44)
        self.addSubview(leftButton)
        
        rightButton.frame = CGRect(x: kWidth - 50 - 5, y: kStatusHeight, width: 50, height: 44)
        self.addSubview(rightButton)
        
    }
    
    
    
    

}
