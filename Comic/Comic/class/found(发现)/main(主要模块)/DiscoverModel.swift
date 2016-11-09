//
//  DiscoverModel.swift
//  Comic
//
//  Created by Silence on 16/11/3.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit
import SwiftyJSON

class DiscoverModel: NSObject {
    var code:NSNumber?
    var data:DiscoverModelData?
    var message:String?
    
    class func parseData(data:NSData)->DiscoverModel{
        let json=JSON(data: data)
        
        let model=DiscoverModel()
        model.code=json["code"].number
        model.data=DiscoverModelData.parseData(json["data"])
        model.message=json["message"].string
        
        return model
    }
}

class DiscoverModelData:NSObject{
    var infos:[DiscoverModelInfos]?
    
    class func parseData(json:JSON)->DiscoverModelData{
        let model=DiscoverModelData()
        
        var array=[DiscoverModelInfos]()
        for (_,subjson) in json["infos"]{
            let tmpModel=DiscoverModelInfos.parseData(subjson)
            array.append(tmpModel)
        }
        model.infos=array
        
        return model
    }
}

class DiscoverModelInfos:NSObject{
    var action:String?
    var action_type:NSNumber?
    var item_type:NSNumber?
    var more_flag:String?
    var title:String?
    
    var banners:[DiscoverModelBanners]?
    var topics:[DiscoverModelTopics]?
    
    class func parseData(json:JSON)->DiscoverModelInfos{
        let model=DiscoverModelInfos()
        model.action=json["action"].string
        model.action_type=json["action_type"].number
        model.item_type=json["item_type"].number
        model.more_flag=json["more_flag"].string
        model.title=json["title"].string
        
        var bannersArray=[DiscoverModelBanners]()
        for (_,subjson) in json["banners"]{
            let tmpModel=DiscoverModelBanners.parseData(subjson)
            bannersArray.append(tmpModel)
        }
        model.banners=bannersArray
        
        var topicsArray=[DiscoverModelTopics]()
        for (_,subjson) in json["topics"]{
            let tmpModel=DiscoverModelTopics.parseData(subjson)
            topicsArray.append(tmpModel)
        }
        model.topics=topicsArray
        
        return model
    }
}

class DiscoverModelBanners:NSObject{
    var good_alias:String?
    var good_price:String?
    var id:NSNumber?
    var pic:String?
    var request_id:String?
    var target_app_url:String?
    var target_id:NSNumber?
    var target_package_name:String?
    var target_title:String?
    var target_web_url:String?
    var type:NSNumber?
    
    class func parseData(json:JSON)->DiscoverModelBanners{
        let model=DiscoverModelBanners()
        model.good_alias=json["good_alias"].string
        model.good_price=json["good_price"].string
        model.id=json["id"].number
        model.pic=json["pic"].string
        model.request_id=json["request_id"].string
        model.target_app_url=json["target_app_url"].string
        model.target_id=json["target_id"].number
        model.target_package_name=json["target_package_name"].string
        model.target_title=json["target_title"].string
        model.target_web_url=json["target_web_url"].string
        model.type=json["type"].number
        
        return model
    }
}

class DiscoverModelTopics:NSObject{
    var desc:String?
    var label_color:String?
    var label_id:NSNumber?
    var label_text:String?
    var label_text_color:String?
    var pic:String?
    var recommended_text:String?
    var target_id:NSNumber?
    var title:String?
    var type:NSNumber?
    var user:DiscoverModelUser?
    
    class func parseData(json:JSON)->DiscoverModelTopics{
        let model=DiscoverModelTopics()
        model.desc=json["desc"].string
        model.label_color=json["label_color"].string
        model.label_id=json["label_id"].number
        model.label_text=json["label_text"].string
        model.label_text_color=json["label_text_color"].string
        model.pic=json["pic"].string
        model.recommended_text=json["recommended_text"].string
        model.target_id=json["target_id"].number
        model.title=json["title"].string
        model.type=json["type"].number
        model.user=DiscoverModelUser.parseData(json["user"])
        
        return model
    }
}

class DiscoverModelUser:NSObject{
    var avatar_url:String?
    var grade:NSNumber?
    var id:NSNumber?
    var nickname:String?
    var pub_feed:NSNumber?
    var reg_type:String?
    
    class func parseData(json:JSON)->DiscoverModelUser{
        let model=DiscoverModelUser()
        model.avatar_url=json["avatar_url"].string
        model.grade=json["grade"].number
        model.id=json["id"].number
        model.nickname=json["nickname"].string
        model.pub_feed=json["pub_feed"].number
        model.reg_type=json["reg_type"].string
        
        return model
    }
}

