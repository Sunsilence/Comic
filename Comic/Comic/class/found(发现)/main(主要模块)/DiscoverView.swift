//
//  DiscoverView.swift
//  Comic
//
//  Created by Silence on 16/11/3.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit

public enum HomeInfosType:Int{
    case NewScroll=1 //新版轮播图
    case PopularClassic=4 //热门经典-少年热血-轻松爆笑---纯爱少女-耽美BL-绝美古风
    case ShortComic = 5  //一分钟短漫画-新作出炉-主编力推---完结佳作-恐怖悬疑
    case Popularity=9  //人气飙升
    case WeekList = 2  //每周排行榜
    case OfficialEvents = 6 //官方活动
}


class DiscoverView: UIView {
    
    var jumpClosure:HomeJumpClosure?
    
    private var tableView:UITableView?
    
    var model:DiscoverModel?{
        didSet{
            print(model?.code)
            tableView?.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView=UITableView(frame: CGRectZero, style: .Plain)
        tableView?.delegate=self
        tableView?.dataSource=self
        addSubview(tableView!)
        
        //约束
        tableView?.snp_makeConstraints(closure: {[weak self] (make) in
            make.edges.equalTo(self!)
            })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DiscoverView:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var section=1
        if model?.data?.infos?.count>0{
            section += (model?.data?.infos?.count)!
        }
        return section
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = 0
        if section==0{
            //广告
            row=1
        }else{
            let listModel=model?.data?.infos![section-1]
            if (listModel?.item_type?.integerValue)! == HomeInfosType.PopularClassic.rawValue{
                //热门经典
                row=1
            }
        }
        return row
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat=0
        if indexPath.section == 0{
            height=194
        }else{
            let listModel=model?.data?.infos![indexPath.section-1]
            if listModel?.item_type!.integerValue == HomeInfosType.PopularClassic.rawValue{
                //热门经典
                height=405
            }else{
                
            }
        }
        return height
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if model?.data?.infos?.count>0{
//                print(model?.data?.infos)
                if model?.data?.infos?[0].banners != nil {
//                    print(model?.data?.infos?[0].banners)
                    let cell=DiscoverBannerCell.createBannerCellFor(tableView, atIndexPath: indexPath, bannerArray: model?.data?.infos![0].banners)
                    
                    cell.jumpClosure=jumpClosure
                    
                    return cell
                }
            }
        }else{
            let liseModel=model?.data?.infos![indexPath.section-1]
            if liseModel?.item_type?.integerValue == HomeInfosType.PopularClassic.rawValue{
                //热门经典
                let cell = PopularClassicCell.createCellFor(tableView, atIndexPath: indexPath, listModel: [liseModel!])
                cell.jumpClosure=jumpClosure
                cell.selectionStyle = .None
                return cell
            }
        }
        return UITableViewCell()
    }
}
