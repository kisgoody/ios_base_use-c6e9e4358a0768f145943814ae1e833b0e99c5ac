//
//  DatabaseViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/14.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class DatabaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showAlert(info: String){
    let controller = UIAlertController(title: "dataBase info", message: info, preferredStyle: .Alert)
    let okAc = UIAlertAction(title: "好的", style: .Cancel, handler: nil)
        controller.addAction(okAc)
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func backClick(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func createDb(sender: AnyObject) {
        if DataBaseManager.instance().createDase() {
            showAlert("打开数据库并创建表成功")
        
        }else{
            showAlert("创建失败")
        }
    }

    @IBAction func addData(sender: AnyObject) {
        let user = User()
        user.setUserName("小黄\(count)")
        user.setUserPhone("18665811376\(count)")
        if user.addUser() {
            showAlert("已添加数据:\(user.getUserName()),\(user.getUserPhone())")
        }else{
            showAlert("添加数据失败")

        }
        count++
    }
    
    
    @IBAction func queryData(sender: AnyObject) {
        var info: String = ""
        let users = User().queryUser()
        if User().queryUser().count == 0{
            info = "数据库数据为nil"
            showAlert(info)
            return
        }
        
        for user in users{
            info += "已查到数据\(users.count)条：\n id：\(user.id)\n name：\(user.getUserName())\n phone：\(user.getUserPhone())"
        
        }
        showAlert(info)
    }
    var count: Int = 0
    @IBAction func updateData(sender: AnyObject) {
        var info: String = ""
        if User().queryUser().count == 0{
            info = "数据库数据为nil"
            showAlert(info)
            return
        }
        let user = User().queryUser()[0]
        info = "id:\(user.id),name:\(user.name),phone:\(user.phone)"
        user.setUserName("小蓝\(count)")
        user.setUserPhone("123131231\(count)")
        
        if user.updateUser(){
        info += " \n 修改为: \n id:\(user.id),name:\(user.name),phone:\(user.phone)"
        
        }else{
        info += "  \n修改失败"
        }
        showAlert(info)
        count++
    }
    
    @IBAction func deleteData(sender: AnyObject) {
        var info: String = ""
        if User().queryUser().count == 0{
            info = "数据库数据为nil"
            
        }else {
            let user = User().queryUser()[User().queryUser().count-1]
            info = "id:\(user.id),name:\(user.name),phone:\(user.phone)"
            if user.deleteUser(){
            info += "\n 删除成功"
        
        }else{
                info += "\n 删除失败"
            }
        }
        showAlert(info)
        
    }
    
    
}
