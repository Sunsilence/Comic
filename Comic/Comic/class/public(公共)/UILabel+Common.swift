//
//  UILabel+Common.swift
//  Comic
//
//  Created by Silence on 16/10/23.
//  Copyright © 2016年 Silence. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    class func createLabel(text:String?,textAlignment:NSTextAlignment?,font:UIFont?)->UILabel{
        let label=UILabel()
        if let tmpText = text{
            label.text=tmpText
        }
        if let tmpTextAlignment = textAlignment{
            label.textAlignment=tmpTextAlignment
        }
        if let tmpFont=font{
            label.font=tmpFont
        }
        return label
    }
}

