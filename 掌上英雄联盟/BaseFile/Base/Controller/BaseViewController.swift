//
//  BaseViewController.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UINavigationControllerDelegate {

    //左上角按钮到左边的距离
    open var leftDistance:Int?
    //左上角按钮的标题
    open var leftTittle:String?
    
    var customNavBar = CMNCustomNavBar(frame: CGRect(x: 0, y: 0, width: kWidth, height: totalNavHeight))
    
    //是否是主视图
    var isRootView:Bool?
    //触摸点
    var forwardpoint:CGPoint?
    //滑动距离
    var xGapValue:CGFloat?
    // 区分是手势交互转场还是直接pop/push
    var isInteractive:Bool?
    
    //转场手势动画
    var gestureAnimation:UIPercentDrivenInteractiveTransition = {
       let gestureAnimation = UIPercentDrivenInteractiveTransition()
        return gestureAnimation
    }()

    lazy var transitionAnimation:TransitionAnimation = {
        var transitionAnimation = TransitionAnimation()
        return transitionAnimation
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        creatNavBar()
        addPanGestureAction()
        
    }
    
    func creatNavBar() {
        
        isRootView = !((self.navigationController?.viewControllers.count)! > 1)
        
        customNavBar.backgroundColor = .white
        self.view.addSubview(self.customNavBar)
        
        self.customNavBar.leftButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        if  isRootView == false {
            self.customNavBar.btnImage = UIImage.cmn_imageName("back")
        }
        self.customNavBar.btnTitle = leftTittle
    }

    
    //添加边缘侧滑手势
    private func addPanGestureAction() {
        let ges = UIPanGestureRecognizer(target: self, action: #selector(edgTapAction))
        self.view.addGestureRecognizer(ges)
    }
    
    //侧滑事件
    @objc func edgTapAction(ges:UIScreenEdgePanGestureRecognizer) {
        
        //判断是否是RootView
        if isRootView == true {
            //移除右滑事件，响应侧滑事件
            self.view.removeGestureRecognizer(ges)
            return
        }
        
        //找到当前点
        let translation = ges.translation(in: ges.view)
        //translation.x > 0 表示向右滑动， translation.x < 0 表示向左滑动 translation.x == 0 表示手势刚开始
        if translation.x < 0 {
            return
        }
        
        var percentComplete = 0.0
        print(translation.x)
        
        //滑动比例
        percentComplete = Double(translation.x / kWidth)
        percentComplete = Double(fabsf(Float(percentComplete)))
        
        switch ges.state {
        case .began:
            
            isInteractive = true
            
            let currentVCArray = self.navigationController?.viewControllers
            if (currentVCArray?.count)! > 1 {
                self.navigationController?.popViewController(animated: true)
            }
            
        case .changed:
            
            self.gestureAnimation.update(CGFloat(percentComplete))
            
        case .ended:
            
            isInteractive = false
            
            if percentComplete >= 0.5 {
                self.gestureAnimation.finish()
            } else {
                self.gestureAnimation.cancel()
            }
        default:
            break
        }
        
    }
 
    
    
    //处理push/pop过渡动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            self.transitionAnimation.animationType = .push
        } else if operation == .pop {
            self.transitionAnimation.animationType = .pop
        }
        return self.transitionAnimation
        
    }
    
    //处理push/pop手势百分比
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        if self.transitionAnimation.animationType == .pop {
            
            let gestureMove = isInteractive == true ? self.gestureAnimation : nil
            
            return gestureMove
        }
        
        return nil
        
    }
 
    
    
    @objc func backAction() {
        if isRootView == true {
            NotificationCenter.default.post(name: kLeftBtnClickActionNotify, object: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
