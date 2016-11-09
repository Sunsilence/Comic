//
//  DiscoverViewController.swift
//  Comic
//
//  Created by Silence on 16/10/23.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.orangeColor()
        
        downloadDiscoverBannerData()
    }
    
    //下载数据
    func downloadDiscoverBannerData(){
        let downloader = DataDownloader()
        downloader.delegate=self
        downloader.downloadGet(discoverRecommendUrl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:DataDownloader的代理方法
extension DiscoverViewController:DataDownloaderDelegate{
    func downloader(downloader: DataDownloader, didFailWithError error: NSError) {
        print(error)
    }
    func downloader(downloader: DataDownloader, didFinishWithData data: NSData?) {
        
        if let tmpData=data{
            //json解析
            let recommendModel = DiscoverModel.parseData(tmpData)
            //显示UI
            let recommendView=DiscoverView(frame: CGRectZero)
            recommendView.model=recommendModel
            view.addSubview(recommendView)
            
            recommendView.jumpClosure={
                jumpUrl in
                print(jumpUrl)
            }
            //约束
            recommendView.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
            })
        }
    }
}
extension DiscoverViewController:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        
    }
}
