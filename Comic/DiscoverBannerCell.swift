//
//  DiscoverBannerCell.swift
//  Comic
//
//  Created by Silence on 16/11/4.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit

class DiscoverBannerCell: UITableViewCell {
    
    var jumpClosure:HomeJumpClosure?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    //数据
    var bannerArray:[DiscoverModelBanners]?{
        didSet{
            if bannerArray?.count>0{
                showData()
            }
        }
    }
    
    func showData(){
        
        //删除之前的子视图
        for sub in scrollView.subviews{
            sub.removeFromSuperview()
        }
        
        //遍历添加图片
        let cnt = bannerArray?.count
        if bannerArray?.count>0{
            
            //创建容器视图
            let containerView=UIView.createView()
            
            scrollView.addSubview(containerView)
            
            containerView.snp_makeConstraints { (make) in
                make.edges.equalTo(scrollView)
                make.height.equalTo(scrollView)
            }
            
            //设置子视图的约束，子视图添加到容器视图上
            var lastView:UIView?=nil
            for i in 0..<cnt!{
                let model=bannerArray![i]
                let tmpImageView=UIImageView()
                
                let url=NSURL(string: model.pic!)
                tmpImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "ic_common_placeholder_rank"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                containerView.addSubview(tmpImageView)
                
                //添加点击事件
                tmpImageView.userInteractionEnabled = true
                tmpImageView.tag=100+i
                //添加手势
                let g = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
                tmpImageView.addGestureRecognizer(g)
                
                //图片约束
                tmpImageView.snp_makeConstraints(closure: { (make) in
                    make.top.bottom.equalTo(containerView)
                    make.width.equalTo(scrollView)
                    if lastView == nil{
                        make.left.equalTo(containerView)
                    }else{
                        make.left.equalTo((lastView?.snp_right)!)
                    }
                    
                })
                
                lastView=tmpImageView
                
            }
            
            //修改容器视图containerView的宽度
            containerView.snp_makeConstraints(closure: { (make) in
                make.right.equalTo(lastView!)
            })
            
            //分页控件
            pageCtrl.numberOfPages = cnt!
        }
    }
    
    func tapAction(g:UITapGestureRecognizer){
        let index = (g.view?.tag)!-100
        
        //获取点击的数据
        let banner = bannerArray![index]
        if jumpClosure != nil && banner.pic != nil{
            jumpClosure!(banner.pic!)
        }
    }
    
    //创建cell的方法
    class func createBannerCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,bannerArray:[DiscoverModelBanners]?)->DiscoverBannerCell{
        let cellId="discoverBannerCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? DiscoverBannerCell
        if cell==nil{
            cell=NSBundle.mainBundle().loadNibNamed("DiscoverBannerCell", owner: nil, options: nil).last as? DiscoverBannerCell
        }
        cell?.bannerArray=bannerArray
        
        return cell!
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        scrollView.delegate=self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension DiscoverBannerCell:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        pageCtrl.currentPage = Int(index)
    }
}
