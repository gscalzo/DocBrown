//
//  <%= filename %>
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

import Foundation

class <%= viewname %>ViewController: UIViewController {
    private var key: String!
    
    var didSetupConstraints = false
    var viewModel: <%= viewname %>ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsUpdateConstraints()
        
        customize()
        render()
        key = viewModel.observe {
            self.render()
        }
    }
    
    deinit{
        viewModel.unobserve(key)
    }
    
}