//
//  AnimationViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/18.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var ww: CGFloat = 40
    @IBOutlet weak var mainView: UIView!
    var padding: CGFloat = 8
    @IBAction func 透明(sender: AnyObject) {
        透明动画()
        
    }
    @IBAction func 缩放(sender: AnyObject) {
        缩放动画()
        
    }
    @IBAction func 移动(sender: AnyObject) {
            移动动画()
    }
    var count: Int = 4
    var arrays: Array<UIView>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrays = Array<UIView>()
        self.initViews()
        
    }
    @IBAction func animation(sender: AnyObject) {
        playAnimation()
        
    }
    @IBAction func backClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func initViews(){
        self.view.window
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        let mainview = UIView(frame: CGRectMake(0, 0, 184, 184))
        mainview.backgroundColor = UIColor.blueColor()
        mainview.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        
//        mainview.addConstraint(NSLayoutConstraint(item: mainview, attribute: .CenterX, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: 0))
        
//        let right:NSLayoutConstraint = NSLayoutConstraint(item: mainview, attribute: NSLayoutAttribute.Right, relatedBy:NSLayoutRelation.Equal, toItem:self.view, attribute:NSLayoutAttribute.Right, multiplier:1.0, constant: -20)
//        mainview.addConstraint(right)
//        self.view.addSubview(mainview)
        for _ in 0..<count{
            x = 0
            
            for _ in 0..<count{
            let view = UIView(frame: CGRectMake(x, y, ww, ww))
                view.backgroundColor = UIColor.brownColor()
                
                mainView.addSubview(view)
                arrays?.append(view)
                x += self.ww + self.padding
            }
            y += self.ww + self.padding
            
        }
        
    }
    func 缩放动画()
    {
        for tile in arrays!{
            //先将数字块大小置为原始尺寸的 1/10
            tile.layer.setAffineTransform(CGAffineTransformMakeScale(0.1,0.1))
            
            //设置动画效果，动画时间长度 1 秒。
            UIView.animateWithDuration(1, delay:0.01,
                options:UIViewAnimationOptions.TransitionNone, animations:
                {
                    ()-> Void in
                    tile.layer.setAffineTransform(CGAffineTransformMakeScale(1,1))
                },
                completion:{
                    (finished:Bool) -> Void in
                    UIView.animateWithDuration(0.08, animations:{
                        ()-> Void in
                        tile.layer.setAffineTransform(CGAffineTransformIdentity)
                    })
            })
        }
    }
    
    
    
    func 透明动画(){
        
        for tile in arrays!{
            tile.alpha = 0;
            
            //设置动画效果，动画时间长度 1 秒。
            UIView.animateWithDuration(1, delay:0.01,
                options:UIViewAnimationOptions.CurveEaseInOut, animations:
                {
                    ()-> Void in
                },
                completion:{
                    (finished:Bool) -> Void in
                    UIView.animateWithDuration(1, animations:{
                        ()-> Void in
                        tile.alpha = 1
                    })
            })
        }
        
    
    }
    var isRight: Bool = true
    func 移动动画(){
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        if mainView.center.x+100>self.view.bounds.width || mainView.center.x - 100 < 0 {
            isRight = !isRight
        }

        if isRight {
            mainView.center = CGPointMake(mainView.center.x+100, mainView.center.y)
        }else{
            mainView.center = CGPointMake(mainView.center.x-100, mainView.center.y)
        }
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut) //设置动画相对速度
        UIView.commitAnimations()
    
    }
    
    func playAnimation(){
    
        for item in arrays!{
            item.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1))
            
            UIView.animateWithDuration(1, delay: 0.01, options: .TransitionNone, animations: { () -> Void in
                item.layer.setAffineTransform(CGAffineTransformMakeRotation(90.0))
                }, completion: { (flag: Bool) -> Void in
                    item.layer.setAffineTransform(CGAffineTransformIdentity)
            })
        
        
        
        }
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }


}
