//
//  HomeHotCell.swift
//  Comic
//
//  Created by Silence on 16/11/3.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit
import Kingfisher
import SDWebImage

class HomeHotCell: UITableViewCell {
    
    var jumpClosure:HomeJumpClosure?
    
    var listModel:HomeHotComics?{
        didSet{
            showData()
        }
    }
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var thumbLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    func showData(){
        
        let url = NSURL(string: (listModel?.cover_image_url)!)
//        print(url!)
        imageName.kf_setImageWithURL(url, placeholderImage: UIImage(named: "ic_common_placeholder_rank"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
//        imageName.sd_setImageWithURL(url, placeholderImage: UIImage(named: "ic_common_placeholder_rank"))
        
        titleBtn.setTitle(listModel?.label_text, forState: .Normal)
        let btnColor=listModel?.label_color
        titleBtn.backgroundColor=UIColor.RGBA16(btnColor!, A: 1.0)
        let titleColor=listModel?.label_text_color
        titleBtn.setTitleColor(UIColor.RGBA16(titleColor!, A: 1.0), forState: .Normal)
        
        titleLabel.text=listModel?.topic?.title
        authorLabel.text=listModel?.topic?.user?.nickname
        titleText.text=listModel?.title
        thumbLabel.text=String(listModel!.likes_count)
        commentsLabel.text=String(listModel!.comments_count)
        
    }
    
    
    @IBAction func pictureClick(sender: UIButton) {
        
    }

    @IBAction func titleClick(sender: UIButton) {
        
    }
    
    @IBAction func authorClick(sender: UIButton) {
        
    }
    
    @IBAction func thumbClick(sender: UIButton) {
        
    }
    
    @IBAction func commentsClick(sender: UIButton) {
        
    }
    
    class func createCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,listModel:HomeHotComics)->HomeHotCell{
        let cellId="honeHotCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? HomeHotCell
        if cell == nil{
            cell=NSBundle.mainBundle().loadNibNamed("HomeHotCell", owner: nil, options: nil).last as? HomeHotCell
        }
        cell?.listModel = listModel
        
        return cell!
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置圆角
        titleBtn.layer.cornerRadius=13
        titleBtn.layer.masksToBounds=true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
