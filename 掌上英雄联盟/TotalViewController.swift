//
//  ViewController.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {

    let leftVC = LeftViewController()
    let rightVC = RightTabBarViewController()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        //添加子视图
        addTwoChildViewChontroler()
        //接收折叠展开的通知
        NotificationCenter.default.addObserver(self, selector: #selector(changeFramesWithAnimation), name: NSNotification.Name(rawValue: "changeStatus"), object: nil )
        
    }
    
    @objc func changeFramesWithAnimation(notify:Notification) {
        
        let value = notify.userInfo!["status"] as! Bool
        print(value)
        if value {
            UIView.animate(withDuration: 0.3) {
                self.rightVC.view.frame = CGRect(x: kWidth * 4 / 5, y: 0, width: kWidth, height: kHeight)
            }
        }else {
            UIView.animate(withDuration: 0.3) {
                self.rightVC.view.frame = CGRect(x: 0, y: 0, width: kWidth, height: kHeight)
            }
        }
        
    }
    
    
    
    private func addTwoChildViewChontroler() {
        
        
        addChildViewController(leftVC)
        view.addSubview(leftVC.view)
        leftVC.view.frame = CGRect(x: 0, y: 0, width: kWidth * 4 / 5, height: kHeight)
        leftVC.didMove(toParentViewController: self)
        
        
        addChildViewController(rightVC)
        view.addSubview(rightVC.view)
        rightVC.view.frame = CGRect(x: kWidth * 4 / 5, y: 0, width: kWidth, height: kHeight)
        rightVC.didMove(toParentViewController: self)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

