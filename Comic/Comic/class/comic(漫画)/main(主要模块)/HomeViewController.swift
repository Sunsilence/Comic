//
//  HomeViewController.swift
//  Comic
//
//  Created by Silence on 16/10/23.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit

public typealias HomeJumpClosure=(String->Void)

class HomeViewController: BaseViewController {
    
    
    var hotView:HomeHotView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.greenColor()
        // Do any additional setup after loading the view.
        downloadHomeHotData()
    }
    
    func downloadHomeHotData(){
        let downloader = DataDownloader()
        downloader.delegate=self
        downloader.downloadGet(homeHotUrl)
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

//MARK:
extension HomeViewController:DataDownloaderDelegate{
    func downloader(downloader: DataDownloader, didFailWithError error: NSError) {
        print(error)
    }
    func downloader(downloader: DataDownloader, didFinishWithData data: NSData?) {
        
//        let str=NSString(data: data!, encoding: NSUTF8StringEncoding)
//        print(str!)
        
        if let tmpData=data{
            //解析数据
            let recommonModel=HomeHotModel.parseData(tmpData)
            //显示UI
            hotView=HomeHotView(frame: CGRectZero)
            hotView?.model=recommonModel
            view.addSubview(hotView!)
            
            hotView?.jumpClosure={
                jumpUrl in
//                print(jumpUrl)
            }
            hotView?.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
            })
        }
    }
}







