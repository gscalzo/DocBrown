
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