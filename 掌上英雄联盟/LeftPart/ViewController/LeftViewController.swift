//
//  LeftViewController.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class LeftViewController: BaseViewController {

    var bottomView:DynamicView?
    lazy var bottomImageView: UIImageView = {
        let bottomImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: edgFrame_X, height: kHeight))
        bottomImageView.image = UIImage(named: "imageleft")
        return bottomImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(bottomImageView)
        
        bottomView = DynamicView(frame: CGRect(x: 0, y: 0, width: edgFrame_X, height: kHeight))
        view.addSubview(bottomView!)
        
        
        
        let jumpBtn = UIButton(type: .custom)
        jumpBtn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        jumpBtn.backgroundColor = .yellow
        view.addSubview(jumpBtn)
        jumpBtn.addTarget(self, action: #selector(jumpAction), for: .touchUpInside)
    }
    
    
    @objc func jumpAction() {
        
        let aboutMeVC = AboutMeViewController()
        aboutMeVC.title = "与我相关"
        navigationController?.pushViewController(aboutMeVC, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
