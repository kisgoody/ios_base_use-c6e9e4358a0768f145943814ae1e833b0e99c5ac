//
//  TableViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/2.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBAction func back(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func backClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = String(indexPath.row)+" row"
        
        
        return cell
    }
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let controller = UIAlertController(title: "hello tableview",message: String(indexPath.row), preferredStyle: UIAlertControllerStyle.Alert)
        let cancle = UIAlertAction(title: "cancle", style: UIAlertActionStyle.Cancel, handler: { (cancle: UIAlertAction) in
        })
        let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: { (ok: UIAlertAction) in
           
        })
        controller.addAction(cancle)
        controller.addAction(ok)
        self.presentViewController(controller, animated: true, completion: nil)
//        self.presentViewController(con, animated: true, completion: nil)
        return indexPath
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
