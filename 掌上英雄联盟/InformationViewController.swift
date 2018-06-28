//
//  InformationViewController.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class InformationViewController: BaseViewController {

    var showStatus = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        let leftBarButton = UIBarButtonItem(title: "折叠", style: .plain, target: self, action: #selector(showAndFoldAction))
        navigationItem.leftBarButtonItem = leftBarButton
        
    }
    
    @objc func showAndFoldAction(sender:UIBarButtonItem) {
        showStatus = !showStatus
        sender.title = showStatus ? "折叠" : "展开"
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "changeStatus"), object: nil, userInfo: ["status":showStatus])
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
