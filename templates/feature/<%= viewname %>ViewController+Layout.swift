
import Foundation

extension <%= viewname %>ViewController {
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            layoutView()
            didSetupConstraints = true;
        }
        super.updateViewConstraints()
    }
    
    private func layoutView() {
        
    }
    
}