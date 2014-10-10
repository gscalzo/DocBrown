//
//  GeoSearchViewController+Render.swift
//  Hairdressr
//
//  Created by Giordano Scalzo on 24/09/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import Foundation

extension GeoSearchViewController {
    func render() {
        if viewModel.isToDismiss {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
        cancelBtn.setTitle("Annulla", forState: .Normal)
        searchTxtFld.placeholder = "Inserisci il tuo indirizzo o città"
        tableView.reloadData()
    }
}