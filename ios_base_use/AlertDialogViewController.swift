//
//  AlertDialogViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/4.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class AlertDialogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func show(sender: AnyObject) {
        dialog()
        
    }
    
    func dialog(){
        let controller = UIAlertController(title: "Test", message: "show Dialog", preferredStyle: .Alert)
        let cancle = UIAlertAction(title: "取消", style: .Cancel) { (action: UIAlertAction) -> Void in
            
        }
        let ok = UIAlertAction(title: "好的", style: .Default) { (action: UIAlertAction) -> Void in
            
        }
    
        controller.addAction(cancle)
        controller.addAction(ok)
        self.presentViewController(controller, animated: true) { () -> Void in
            
        }
        
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
