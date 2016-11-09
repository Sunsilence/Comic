//
//  HomeHotModel.swift
//  Comic
//
//  Created by Silence on 16/10/25.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeHotModel: NSObject {
    var code:NSNumber?
    var data:HomeHotData?
    var message:String?
    
    class func parseData(data:NSData)->HomeHotModel{
        let json=JSON(data:data)
        let model=HomeHotModel()
        model.code=json["code"].number
        model.data=HomeHotData.parseModel(json["data"])
        model.message=json["message"].string
        
        return model
    }
}
class HomeHotData:NSObject{
    var comics:[HomeHotComics]?
    var since:NSNumber?
    var timestamp:NSNumber?
    
    class func parseModel(json:JSON)->HomeHotData{
        let model=HomeHotData()
        
        var dataArray=[HomeHotComics]()
        for (_,subjson) in json["comics"]{
            let tmpModel=HomeHotComics.parseModel(subjson)
            dataArray.append(tmpModel)
        }
        model.comics=dataArray
        
        model.since=json["since"].number
        model.timestamp=json["timestamp"].number
        return model
    }
}

class HomeHotComics:NSObject{
    var comments_count:NSNumber!
    var cover_image_url:String?
    var created_at:NSNumber?
    var id:NSNumber?
    var info_type:NSNumber?
    var is_liked:Bool?
    var label_color:String?
    var label_text:String?
    var label_text_color:String?
    var likes_count:NSNumber!
    var push_flag:NSNumber?
    var serial_no:NSNumber?
    var shared_count:NSNumber?
    var status:String?
    var storyboard_cnt:NSNumber?
    var title:String?
    var topic:HomeHotTopic?
    var updated_at:NSNumber?
    var url:String?
    
    class func parseModel(json:JSON)->HomeHotComics{
        let model=HomeHotComics()
        
        model.comments_count=json["comments_count"].number
        model.cover_image_url=json["cover_image_url"].string
        model.created_at=json["created_at"].number
        model.id=json["id"].number
        model.info_type=json["info_type"].number
        model.is_liked=json["is_liked"].bool
        model.label_color=json["label_color"].string
        model.label_text=json["label_text"].string
        model.label_text_color=json["label_text_color"].string
        model.likes_count=json["likes_count"].number
        model.push_flag=json["push_flag"].number
        model.serial_no=json["serial_no"].number
        model.shared_count=json["shared_count"].number
        model.status=json["status"].string
        model.storyboard_cnt=json["storyboard_cnt"].number
        model.title=json["title"].string
        
        model.topic=HomeHotTopic.parseModel(json["topic"])
        
        model.updated_at=json["updated_at"].number
        model.url=json["url"].string
        
        return model
    }
}

class HomeHotTopic:NSObject{
    var comics_count:NSNumber?
    var cover_image_url:String?
    var created_at:NSNumber?
    var description1:String?
    var discover_image_url:String?
    var exclusive_flag:NSNumber?
    var id:NSNumber?
    var label_id:NSNumber?
    var order:NSNumber?
    var title:String?
    var updated_at:NSNumber?
    var user:HomeHotUser?
    var vertical_image_url:String?
    
    class func parseModel(json:JSON)->HomeHotTopic{
        let model=HomeHotTopic()
        model.comics_count=json["comics_count"].number
        model.cover_image_url=json["cover_image_url"].string
        model.created_at=json["created_at"].number
        model.description1=json["description1"].string
        model.discover_image_url=json["discover_image_url"].string
        model.exclusive_flag=json["exclusive_flag"].number
        model.id=json["id"].number
        model.label_id=json["label_id"].number
        model.order=json["order"].number
        model.title=json["title"].string
        model.updated_at=json["updated_at"].number
        
        model.user=HomeHotUser.parseModel(json["user"])
        
        model.vertical_image_url=json["vertical_image_url"].string
        
        return model
    }
}

class HomeHotUser:NSObject{
    var avatar_url:String?
    var grade:NSNumber?
    var id:NSNumber?
    var nickname:String?
    var pub_feed:NSNumber?
    var reg_type:String?
    
    class func parseModel(json:JSON)->HomeHotUser{
        let model=HomeHotUser()
        
        model.avatar_url=json["avatar_url"].string
        model.grade=json["grade"].number
        model.id=json["id"].number
        model.nickname=json["nickname"].string
        model.pub_feed=json["pub_feed"].number
        model.reg_type=json["reg_type"].string
        
        return model
    }
}

