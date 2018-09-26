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
    var constValue:CGFloat = 50
    var commentheight:CGFloat = 44
    
    
    //左边按钮的图片
    var btnImage:UIImage? {
        didSet {
            leftButton.setImage(btnImage, for: .normal)
            leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        }
    }
    
    //左边按钮的标题
    var btnTitle:String? {
        didSet {
            leftButton.setTitle(btnTitle, for: .normal)
            leftButton.titleLabel?.text = btnTitle
            leftButton.setTitleColor(.red, for: .normal)
        }
    }

    override func layoutSubviews() {
        self.backgroundColor = .white
        
        leftButton.frame = CGRect(x: 5, y: kStatusHeight, width: constValue, height: commentheight)
        self.addSubview(leftButton)
        
        rightButton.frame = CGRect(x: kWidth - constValue - 5, y: kStatusHeight, width: constValue, height: commentheight)
        self.addSubview(rightButton)
        
        middleTittleView = UIView(frame: CGRect(x: constValue, y: kStatusHeight, width: kWidth-2*constValue, height: commentheight))
        middleTittleView.backgroundColor = .clear
        self.addSubview(middleTittleView)
        
    }
    
    
    
    

}
