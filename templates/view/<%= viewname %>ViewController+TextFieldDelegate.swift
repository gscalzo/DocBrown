import Foundation

extension GeoSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        textField.text = ""
        viewModel.searchEditText("")
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