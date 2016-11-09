//
//  UIColor.swift
//  Comic
//
//  Created by Silence on 16/11/2.
//  Copyright © 2016年 Silence. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class func RGBA16(RGBValue:NSString , A:CGFloat)->UIColor{
        var Str:NSString = RGBValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        if RGBValue.hasPrefix("#"){
            Str=(RGBValue as NSString).substringFromIndex(1)
        }
        
        let red = (Str as NSString ).substringToIndex(2)
        let green = ((Str as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let blue = ((Str as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        
        NSScanner(string: red).scanHexInt(&r)
        NSScanner(string: green).scanHexInt(&g)
        NSScanner(string: blue).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: A)
    }
    /*
     class func RGBA16(RGBValue:Int,A:CGFloat) -> UIColor {
     return UIColor(red: CGFloat((RGBValue & 0xff0000)>>16)/255.0, green: CGFloat((RGBValue & 0xff00) >> 8)/255.0, blue: CGFloat(RGBValue & 0xff)/255.0, alpha: A)
     }
     */
}