//
//  GeoSearchViewController+Setup.swift
//  Hairdressr
//
//  Created by Giordano Scalzo on 24/09/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import Foundation

extension GeoSearchViewController {
    override func loadView() {
        super.loadView()
        
        view.addSubview(searchTxtFld)
        view.addSubview(cancelBtn)
        view.addSubview(tableView)
        
        searchTxtFld.delegate = self
        searchTxtFld.clearButtonMode = .WhileEditing

        
        cancelBtn.handleControlEvents(.TouchUpInside,
            withBlock: { (weakControl: AnyObject?) in
                self.dismissViewControllerAnimated(false, completion: nil)
        })
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}