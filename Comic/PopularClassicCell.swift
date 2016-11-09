//
//  PopularClassicCell.swift
//  Comic
//
//  Created by Silence on 16/11/7.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit

class PopularClassicCell: UITableViewCell {
    
    var jumpClosure:HomeJumpClosure?
    
    var listModel:[DiscoverModelInfos]?{
        didSet{
            showData()
        }
    }
    
    @IBAction func clickBtn(sender: UIButton) {
        let index = sender.tag-100
        if listModel?.count>6*index{
            let tmpData = listModel![1].topics![index*3]
            if jumpClosure != nil && tmpData.pic != nil{
                jumpClosure!((tmpData.pic)!)
            }
        }
    }
    
    func showData(){
        if listModel?.count>0{
            for i in 0..<6{
                //图片
                if listModel?.count>0{
                    if listModel![1].topics != nil{
                        let tmpView = contentView.viewWithTag(200+i)
                        if tmpView?.isKindOfClass(UIImageView)==true{
                            let imageView = tmpView as! UIImageView
                            let url=NSURL(string: listModel![1].topics![i].pic!)
                            imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "ic_common_placeholder_rank"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                        }
                    }
                }
                
                //title
                if listModel?.count>0{
                    if listModel![1].topics != nil{
                        let tmpView = contentView.viewWithTag(300+i)
                        if tmpView?.isKindOfClass(UILabel)==true{
                            let labelText=tmpView as! UILabel
                            labelText.text=listModel![1].topics![i].title
                        }
                    }
                }
                
                //recommended_text
                if listModel?.count>0{
                    if listModel![1].topics != nil{
                        let tmpView = contentView.viewWithTag(400+i)
                        if tmpView?.isKindOfClass(UILabel)==true{
                            let labelText=tmpView as! UILabel
                            labelText.text=listModel![1].topics![i].recommended_text
                        }
                    }
                }
            }
        }
    }
    
    class func createCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,listModel:[DiscoverModelInfos])->PopularClassicCell{
        let cellId="popularClassicCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? PopularClassicCell
        if cell==nil{
            cell=NSBundle.mainBundle().loadNibNamed("PopularClassicCell", owner: nil, options: nil).last as? PopularClassicCell
        }
        cell?.listModel=listModel
        
        return cell!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
