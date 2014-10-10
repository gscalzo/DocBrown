//
//  GeoSearchViewController+TableView.swift
//  Hairdressr
//
//  Created by Giordano Scalzo on 24/09/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import Foundation

extension GeoSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableview: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String{
        return viewModel.titleForHeaderInSection(section)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        let (boldText, normalText) = viewModel.cellTextAtIndex(indexPath)
        let b = NSAttributedString(string: boldText, attributes: [
            NSFontAttributeName: UIFont.hdTitleBold(size: 14),
            NSForegroundColorAttributeName: UIColor.blackColor()
            ])
        
        let n = NSAttributedString(string: normalText, attributes: [
            NSFontAttributeName: UIFont.hdNormal(size: 14),
            NSForegroundColorAttributeName: UIColor.lightGrayColor()
            ])
        
        var sumString = NSMutableAttributedString(attributedString: b)
        sumString.appendAttributedString(n)
        cell.textLabel!.attributedText = sumString
        
        return cell
    }
    
//    selezionare città, metterla in areadatastore e fare scatenare la richiesta via server
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath){
            viewModel.didSelectRowAtIndexPath(indexPath)
    }
}