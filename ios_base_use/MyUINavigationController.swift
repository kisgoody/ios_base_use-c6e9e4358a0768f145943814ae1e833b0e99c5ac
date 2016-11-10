//
//  MyUINavigationController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/3.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class MyUINavigationController: UINavigationController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //创建一个导航项
    func onMakeNavitem()->UINavigationItem{
        var navigationItem = UINavigationItem()
        //创建左边按钮
        var leftBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add,
            target: self, action: "onAdd")
        //创建右边按钮
        var rightBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel,
            target: self, action: "onRemove")
        //设置导航栏标题
        navigationItem.title = "第\(count)个导航项"
        //设置导航项左边的按钮
        navigationItem.setLeftBarButtonItem(leftBtn, animated: true)
        //设置导航项右边的按钮
        navigationItem.setRightBarButtonItem(rightBtn, animated: true)
        return navigationItem
    }
    
    //增加导航项函数
    func onAdd(){
        count++
        //给导航条增加导航项
        navigationBar?.pushNavigationItem(onMakeNavitem(), animated: true)
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
