//
//  UIButton+Common.swift
//  Comic
//
//  Created by Silence on 16/10/23.
//  Copyright © 2016年 Silence. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    class func createBtn(title:String?,bgImageName:String?,hightLightImageName:String?,selectImageName:String?,target:AnyObject?,action:Selector)->UIButton{
        let btn = UIButton(type: .Custom)
        if let tmpTitle=title{
            btn.setTitle(tmpTitle, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn.setTitleColor(UIColor.yellowColor(), forState: .Highlighted)
        }
        if let tmpBgImageName=bgImageName{
            btn.setImage(UIImage(named: tmpBgImageName), forState: .Normal)
        }
        if let tmpHightLigthImageName=hightLightImageName{
            btn.setImage(UIImage(named: tmpHightLigthImageName), forState: .Highlighted)
        }
        if let tmpSelectImageName=selectImageName{
            btn.setImage(UIImage(named: tmpSelectImageName), forState: .Selected)
        }
        if target != nil && action != nil{
            btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
        
        return btn
    }
}