//
//  Const.swift
//  Comic
//
//  Created by Silence on 16/10/21.
//  Copyright © 2016年 Silence. All rights reserved.
//

import Foundation
import UIKit


let screenWidth=UIScreen.mainScreen().bounds.width
let screenHeight=UIScreen.mainScreen().bounds.height
/*
 首页
 */
//首页热门
let homeHotUrl="http://api.kkmh.com/v1/daily/comic_lists/0?since=0"
//首页关注 http://api.kkmh.com/v1/fav/timeline?since=0
let discoverRecommendUrl="http://api.kkmh.com/v1/topic_new/discovery_list?"
//发现推荐 http://api.kkmh.com/v1/topic_new/discovery_list?
/*
 发现分类
 全部 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=0&since=0&count=20&
 恋爱 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=20&since=0&count=20&
 爆笑 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=24&since=0&count=20&
 奇幻 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=22&since=0&count=20&
 恐怖 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=32&since=0&count=20&
 耽美 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=36&since=0&count=20&
 剧情 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=23&since=0&count=20&
 成人 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=44&since=0&count=20&
 日常 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=19&since=0&count=20&
 治愈 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=27&since=0&count=20&
 百合 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=45&since=0&count=20&
 三次元 http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=41&since=0&count=20&
 */

/*
 社区
 广场-热门 http://api.kkmh.com/v1/feeds/feed_lists?uid=25454399&since=0&page_num=1&catalog_type=2&
    -最新 http://api.kkmh.com/v1/feeds/feed_lists?uid=25454399&since=0&page_num=1&catalog_type=1&
 
 关注  http://api.kkmh.com/v1/feeds/following/feed_lists?since=0&
 */












