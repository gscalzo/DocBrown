//
//  GeoSearchViewController+TextFieldDelegate.swift
//  Hairdressr
//
//  Created by Giordano Scalzo on 26/09/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import Foundation

extension GeoSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        textField.text = ""
        viewModel.searchEditText("")
//        textField.resignFirstResponder()
        return false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        searchTxtFld.resignFirstResponder()
        
        return true
    }
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            let text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
            viewModel.searchEditText(text)
            return true
    }
    
}