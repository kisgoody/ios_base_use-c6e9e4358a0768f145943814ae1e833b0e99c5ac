//
//  NavifationFristViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/3.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class NavifationFristViewController: UIViewController {

//    @IBOutlet weak var navItem: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title="One";
        let nextItem=UIBarButtonItem(title:"下一页",style:.Plain,target:self,action:"next");
        
        let barbtn: UIBarButtonItem = UIBarButtonItem(customView: btnBack())

        
        self.navigationItem.rightBarButtonItem = nextItem;
        self.navigationItem.leftBarButtonItem = barbtn
    }
    
    func btnBack()->UIButton{
    let btn2: UIButton = UIButton(type: .Custom)
    btn2.frame = CGRectMake(50, 100, 120, 35)
    btn2.setImage(UIImage(named: "info"), forState: .Normal)
    btn2.backgroundColor = UIColor.blackColor()
    btn2.titleLabel?.font = UIFont.systemFontOfSize(20)
    btn2.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
    btn2.setTitle("图片按钮", forState: .Normal)
    //偏移量，分别为上下左右
    btn2.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0)
    btn2.titleEdgeInsets = UIEdgeInsetsMake(0, -80, 0, 5)
    btn2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    btn2.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
    btn2.adjustsImageWhenHighlighted = false
    self.view.addSubview(btn2)
    return btn2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func next(){
        let tow_vc = NavigationSecondViewController();
        //推入下一个视图
        self.navigationController?.pushViewController(tow_vc, animated: true)
    
    }
    func back(){
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
