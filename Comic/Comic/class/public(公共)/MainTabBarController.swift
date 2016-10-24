//
//  MainTabBarController.swift
//  Comic
//
//  Created by Silence on 16/10/21.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    var bgView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creataControllers()
        
        tabBar.hidden=true
        createMyTabBar()
        
    }
    
    func createMyTabBar(){
        bgView=UIView.createView()
        bgView?.backgroundColor=UIColor(white: 0.9, alpha: 1.0)
        view.addSubview(bgView!)
        
        bgView?.snp_makeConstraints(closure: {[weak self] (make) in
            make.left.right.bottom.equalTo(self!.view)
            make.height.equalTo(49)
        })
        
        let imageNames=["ic_tabbar_home","ic_tabbar_discover","ic_tabbar_media","ic_tabbar_me"]
        let titles=["漫画","发现","V社区","我的"]
        let width=screenWidth/CGFloat(imageNames.count)
        for i in 0..<imageNames.count{
            let imageName=imageNames[i]+"_normal"
            let selectName=imageNames[i]+"_pressed"
            let btn = UIButton.createBtn(nil, bgImageName: imageName, hightLightImageName: nil, selectImageName: selectName, target: selectName, action: #selector(btnClick(_:)))
            btn.tag = 300+i
            bgView?.addSubview(btn)
            
            //按钮的位置
            btn.snp_makeConstraints(closure: {[weak self] (make) in
                make.left.equalTo(width*CGFloat(i))
                make.top.bottom.equalTo((self?.bgView!)!)
                make.width.equalTo(width)
            })
            
            //按钮标题
            let titleLabel=UILabel.createLabel(titles[i], textAlignment: .Center, font: UIFont.systemFontOfSize(12))
            btn.addSubview(titleLabel)
            //按钮标题的位置
            titleLabel.snp_makeConstraints(closure: { (make) in
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(15)
            })
        }
        
    }
    
    func creataControllers(){
        let nameArray=["Comic.HomeViewController","Comic.DiscoverViewController","Comic.CommunityViewController","Comic.MineViewController"]
        var ctrlArray:[UINavigationController]=[]
        for i in 0..<nameArray.count{
            let ctrl = NSClassFromString(nameArray[i]) as! UIViewController.Type
            let vc = ctrl.init()
            let navCtrl=UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }
        viewControllers = ctrlArray
    }
    
    func btnClick(curBtn:UIButton){
        let index = curBtn.tag-300
        
        let lastBtn=bgView?.viewWithTag(300+selectedIndex) as! UIButton
        lastBtn.selected=false
        lastBtn.userInteractionEnabled=true
        
        curBtn.selected=true
        curBtn.userInteractionEnabled=false
        selectedIndex = index
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
