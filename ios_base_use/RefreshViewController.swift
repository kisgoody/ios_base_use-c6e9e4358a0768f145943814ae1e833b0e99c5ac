
//
//  刷新.swift
//  ios_base_use
//
//  Created by EDF on 16/12/12.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class RefreshViewController: UITableViewController {
    
    var datas = ["星期一","星期二","星期三","星期四","星期五","星期六","星期七"]
    @IBOutlet var listView: UITableView!
    var refresh = UIRefreshControl()
    var image: UIImageView?
    override func viewDidAppear(animated: Bool) {
        refresh.addTarget(self, action: "refreshData", forControlEvents: .ValueChanged)
        refresh.attributedTitle = NSAttributedString(string: "正在刷新...")
        refresh.backgroundColor = UIColor.yellowColor()
        for item in refresh.subviews{
                item.removeFromSuperview()
        }
//        refresh.beginRefreshing()
//        refresh.backgroundColor = UIColor.clearColor()
//        refresh.tintColor = UIColor.clearColor()
        
        image = UIImageView(frame: CGRectMake(self.view.frame.width/2-10, -40, 20, 20))
        image!.image = UIImage(named: "cha-fan")
        image?.contentMode = UIViewContentMode.Center
        image!.alpha = 0
        旋转(image!)
        refresh.addSubview(image!)
        listView.addSubview(refresh)
    }
    func refreshData(){
    print("-------刷新-------")

        self.refreshEndDelay(3.0){
            print("-------refreshEndDelay-------")

        self.refresh.endRefreshing()
            
        }
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let sg = ( scrollView.contentOffset.y * -1 ) / 60.0
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image!.alpha = sg
            self.image?.frame = CGRectMake(self.view.frame.width/2-10, (scrollView.contentOffset.y * -1)/2, 20, 20)

        }
    }
    
    func 旋转(imageView: UIImageView){
        // 创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 设置动画属性
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 1
        anim.removedOnCompletion = false
        // 将动画添加到图层上
        imageView.layer.addAnimation(anim, forKey: nil)
    
    }
    
    func refreshEndDelay(time: Double,closure:()->()){
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TableCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableCell
        cell.setData(self.datas[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        print("item:\(indexPath.row)")
        return indexPath
    }
    

}
