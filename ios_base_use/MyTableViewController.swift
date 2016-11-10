//
//  MyTableViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/3.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    @IBOutlet weak var barItem: UIBarButtonItem!
    
    var navgationBar: UINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navgationBar = UINavigationBar(frame: CGRectMake(0, 20, 320, 44))
        self.view.addSubview(navgationBar!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
