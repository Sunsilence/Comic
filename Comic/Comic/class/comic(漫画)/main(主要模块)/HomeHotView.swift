//
//  HomeHotView.swift
//  Comic
//
//  Created by Silence on 16/11/3.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit

class HomeHotView: UIView {
    
    private var tableView:UITableView?
    
    var jumpClosure:HomeJumpClosure?
    
    var model:HomeHotModel?{
        didSet{
            tableView?.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView=UITableView(frame: CGRectZero, style: .Plain)
        tableView?.delegate=self
        tableView?.dataSource=self
        addSubview(tableView!)
        
        tableView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HomeHotView:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows=model?.data?.comics?.count
        return rows!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 308
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let listModel=model?.data?.comics![indexPath.row]
        let cell=HomeHotCell.createCellFor(tableView, atIndexPath: indexPath, listModel: listModel!)
        cell.jumpClosure=jumpClosure
        
        return cell
    }
}