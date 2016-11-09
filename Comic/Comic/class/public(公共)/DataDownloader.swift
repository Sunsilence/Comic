//
//  DataDownloader.swift
//  Comic
//
//  Created by Silence on 16/10/25.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit
import Alamofire

protocol DataDownloaderDelegate:NSObjectProtocol {
    func downloader(downloader:DataDownloader,didFailWithError error:NSError)
    func downloader(downloader:DataDownloader,didFinishWithData data:NSData?)
}



class DataDownloader: NSObject {
    
    weak var delegate:DataDownloaderDelegate?
    func downloadGet(getUrl:String){
        Alamofire.request(.GET, getUrl).responseJSON { (responce) in
            switch responce.result{
            case .Failure(let error):
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                self.delegate?.downloader(self, didFinishWithData: responce.data)
            }
        }
    }
}
