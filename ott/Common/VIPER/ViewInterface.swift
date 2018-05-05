import UIKit

protocol ViewInterface: class {
    var colorTheme: ColorTheme { get }
    func applyColorTheme(animated: Bool, duration: TimeInterval)
    
    func showSideMenu()
}

extension ViewInterface {
    func applyColorTheme(animated: Bool = false, duration: TimeInterval = Double(UINavigationControllerHideShowBarDuration)) {
        let vc = self as! UIViewController
        let opaqueNavBar = !colorTheme.navigationBackground.isEqual(UIColor.clear)
        
        
        let redraw: (() -> Void) = {
            if opaqueNavBar {
                vc.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
                vc.navigationController?.navigationBar.shadowImage = nil
            } else {
                vc.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                vc.navigationController?.navigationBar.shadowImage = UIImage()
            }
            
            vc.navigationController?.navigationBar.barTintColor = self.colorTheme.navigationBackground
            vc.navigationController?.navigationBar.tintColor = self.colorTheme.navigationForeground
            vc.view.backgroundColor = self.colorTheme.background
        }
        
        
        if animated {
            UIView.animate(withDuration: duration) {
                redraw()
            }
        } else {
            redraw()
        }
    }
}
