//
//  NavigationSecondViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/3.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class NavigationSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="second";
        //Item 标题        //Item样式       //目标所有        //nxet 事件触发的方法名字
        let nextItem=UIBarButtonItem(title:"back",style:.Plain,target:self,action:"back");
//        nextItem.image = UIImage(named: "info")
        
        //  添加到到导航栏上
        self.navigationItem.leftBarButtonItem = nextItem;
        self.view.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    func back(){
        
        self.navigationController?.popViewControllerAnimated(true)
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
