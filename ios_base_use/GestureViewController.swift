//
//  GestureViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/21.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    @IBOutlet weak var cube: UIView!
    
    var flag: Int = 0;
    @IBOutlet weak var cube1: UIView!
    let pressLong: Int = 1;
    let move: Int = 2;
    var longPress,longPress1: UILongPressGestureRecognizer?
    var pan: UIPanGestureRecognizer?
    
    
    @IBAction func backClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidAppear(animated: Bool) {
        longPress = UILongPressGestureRecognizer(target: self, action: "长按:")
        longPress1 = UILongPressGestureRecognizer(target: self, action: "长按:")
        
        pan = UIPanGestureRecognizer(target: self, action: "拖动:")
        cube.backgroundColor = UIColor.brownColor()
        cube1.backgroundColor = UIColor.brownColor()
        
        cube.addGestureRecognizer(longPress!)
        cube1.addGestureRecognizer(longPress1!)
    }
    
  
    
    var startPointer: CGPoint?
    var cachePointer: CGPoint?
    var anotherView: UIView?
    var change: Bool = false
    func 长按(recognizer:UILongPressGestureRecognizer){
        let view = recognizer.view
        switch(recognizer.state){
        case UIGestureRecognizerState.Began :
            print("----Began----")
            change = false
            if view==cube1{
                anotherView = cube
            }
            if view == cube {
                anotherView = cube1
            }
//            self.view.bringSubviewToFront(recognizer.view!)
//            self.view.insertSubview(view!, atIndex: (view?.superview?.subviews.count)!-1)
            
            cachePointer = anotherView?.center
            
            startPointer = view?.center
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.5)
            view!.backgroundColor = UIColor.blackColor()
            UIView.commitAnimations()
            
        case UIGestureRecognizerState.Cancelled:
            print("----Cancelled----")
            
        case UIGestureRecognizerState.Changed:
            let pointer = recognizer.locationInView(self.view)
            view!.center = pointer
            
            
            
        case UIGestureRecognizerState.Failed:
            print("----Failed-----")
        case UIGestureRecognizerState.Ended:
             print("----Ended-----")
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.5)
             view!.backgroundColor = UIColor.brownColor()
            UIView.commitAnimations()
             if self.是否重叠(view!,view2: anotherView!) {//重叠
                UIView.beginAnimations(nil, context: nil)
                UIView.setAnimationDuration(0.5)
                anotherView?.center = self.startPointer!
                view?.center = cachePointer!
                UIView.commitAnimations()
            
             }

            
        default:
            break
        }
        
        
    
    }
    
    func 是否重叠(view1: UIView, view2: UIView) -> Bool{
        let bound1 = view1.frame
        let bound2 = view2.frame
        if bound1.maxX < bound2.minX||bound1.maxY < bound2.minY||bound1.minX > bound2.maxX||bound1.minY > bound2.maxY
        {
            return false
        }else{
            return true
        }
        
        
    }
    
    func 拖动(ges: UIPanGestureRecognizer){
        if ges.state == UIGestureRecognizerState.Changed{
            let pointer = ges.locationInView(self.view)
            cube.center = pointer
        } else if ges.state == UIGestureRecognizerState.Cancelled{
//        cube.removeGestureRecognizer(ges)
        }
    
    }
    
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(0.5)
//        cube.alpha = 0.5
//        UIView.commitAnimations()
//    }
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//    }
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        switch(flag){
//        case 1:
//            cube.removeGestureRecognizer(longPress!)
//        case 2:
//            cube.removeGestureRecognizer(pan!)
//        default:
//            UIView.beginAnimations(nil, context: nil)
//            UIView.setAnimationDuration(0.5)
//            cube.alpha = 1
//            UIView.commitAnimations()
//            
//        }
//        
//        
//    }
    
    override func didReceiveMemoryWarning() {
        
    }
    

}
