
import UIKit

/*:
# Segue Handler Protocol
Segue handlers with protocol and protocol extension
*/

protocol SegueHandlerType {
    typealias SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier, segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid segue identifier \(segue.identifier)")
        }
        
        return segueIdentifier
    }
    
}


/*:
Example usage of Segue Handler Type protocol
*/

class TestViewController: UIViewController, SegueHandlerType {
    
    enum SegueIdentifier: String {
        case SegueToFirstViewController
        case SegueToSecondViewController
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segueIdentifierForSegue(segue) {
        case .SegueToFirstViewController:
            print("first")
        case .SegueToSecondViewController:
            print("second")
        }
    }
    
    func onTap() {
        performSegueWithIdentifier(.SegueToFirstViewController, sender: self)
    }
 
}
