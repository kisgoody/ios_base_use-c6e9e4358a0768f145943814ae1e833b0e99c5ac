//
//  ValueSendFristViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/4.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class ValueSendFristViewController: UIViewController,BackListener {

//    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var inputText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "finish")
//        btn.addTarget(self, action: "push", forControlEvents: .TouchUpInside)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var back: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func finish(){
    self.dismissViewControllerAnimated(true, completion: nil)
    }
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SeguePushSend"{
        
        let view = segue.destinationViewController as! ValueSendSecondViewController
            view.backListener = self
            view.backInfo = {(str: String) in
                self.back.text = str
            }
        
        view.intentInfo  = inputText.text
        }
    }
    func OnBackListener(_info: String) {
        self.back.text = _info;
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
