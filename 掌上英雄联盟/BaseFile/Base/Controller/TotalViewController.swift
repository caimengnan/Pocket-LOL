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
    var isStoppedAtRight:Bool = false //侧滑状态 true--处于侧滑状态
    
    //透明遮盖视图
    lazy var coverView:UIView = {
        let coverView = UIView(frame: rightVC.view.frame)
        coverView.backgroundColor = .clear
        //拖拽手势
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(coverViewPanAction))
        //轻拍手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(coverTapAction))
        coverView.addGestureRecognizer(gesture)
        coverView.addGestureRecognizer(tapGesture)
        return coverView
    }()
    
    
    let rightViewNormalFrame = CGRect(x: 0, y: 0, width: kWidth, height: kHeight)
    let rightViewSlideFrame = CGRect(x: edgFrame_X, y: 0, width: kWidth, height: kHeight)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        addTwoChildViewChontroler()
        addScreenEdgeTapAction()
        
        //接收折叠展开的通知
        NotificationCenter.default.addObserver(self, selector: #selector(changeFramesWithAnimation), name: kLeftBtnClickActionNotify, object: nil )
        
    }
    
    //往左的侧滑手势事件
    @objc func coverViewPanAction(gesture:UIPanGestureRecognizer) {
        let currentPoint = gesture.location(in: self.view)
        var frame = rightVC.view.frame
    
        if currentPoint.x > edgFrame_X {
            rightVC.view.frame = rightViewSlideFrame
            isStoppedAtRight = true
            return
        }
        
        frame.origin.x = currentPoint.x
        rightVC.view.frame = frame
        
        if gesture.state == .ended || gesture.state == .cancelled {
            if currentPoint.x < edgFrame_X {
                moveToNormalFramePosition()
            } else {
                frame.origin.x = edgFrame_X
                afterLoosenGesturePosition()
            }
        }
    }
    
    
    //轻拍手势
    @objc func coverTapAction() {
        if isStoppedAtRight == true {
            moveToNormalFramePosition()
        }
    }
    
    
    //添加边缘侧滑手势
    private func addScreenEdgeTapAction() {
        let ges = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgTapAction))
        ges.edges = UIRectEdge.left
        self.view.addGestureRecognizer(ges)
    }
    
    
    //往右的侧滑手势事件
    @objc func edgTapAction(ges:UIScreenEdgePanGestureRecognizer) {

        let point = ges.location(in: self.view)
        var frame = rightVC.view.frame
        
        if point.x > edgFrame_X {
            rightVC.view.frame = rightViewSlideFrame
            isStoppedAtRight = true
            self.view.addSubview(self.coverView)
            return
        }
        
        frame.origin.x = point.x
        rightVC.view.frame = frame
        
        if ges.state == .ended || ges.state == .cancelled {
            afterLoosenGesturePosition()
        } 
        
    }
    
    
    @objc func changeFramesWithAnimation(notify:Notification) {
        
        if !isStoppedAtRight {
            afterSliderPosition()
        }else {
            moveToNormalFramePosition()
        }
        
    }
    
    //回到初始位置
    private func moveToNormalFramePosition(){
        
        UIView.animate(withDuration: 0.3) {
            self.rightVC.view.frame = self.rightViewNormalFrame
            self.isStoppedAtRight = false
            self.coverView.removeFromSuperview()
        }
    }
    
    //滑动后位置
    private func afterSliderPosition(){
        UIView.animate(withDuration: 0.3) {
            self.rightVC.view.frame = self.rightViewSlideFrame
            self.isStoppedAtRight = true
            self.view.addSubview(self.coverView)
        }
    }
    
    //手势松手后回到滑动的位置
    private func afterLoosenGesturePosition() {
        UIView .animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.rightVC.view.frame = self.rightViewSlideFrame
            self.isStoppedAtRight = true
        }, completion: { (completed) in
            self.view.addSubview(self.coverView)
        })
    }
    
    
    //添加子视图
    private func addTwoChildViewChontroler() {
        addChildViewController(leftVC)
        view.addSubview(leftVC.view)
        leftVC.view.frame = CGRect(x: 0, y: 0, width: edgFrame_X, height: kHeight)
        leftVC.didMove(toParentViewController: self)
        
        addChildViewController(rightVC)
        view.addSubview(rightVC.view)
        rightVC.view.frame = rightViewNormalFrame
        rightVC.didMove(toParentViewController: self)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

