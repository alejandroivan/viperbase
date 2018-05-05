import UIKit
import SideMenu

class AppNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setRootWireframe(HomeWireframe(), animated: false)
        setupNavigationBar()
        setupRightLogo()
        
        delegate = self
        let sideMenuStoryboard = UIStoryboard(name: "SideMenu", bundle: nil)
        
        SideMenuManager.default.menuLeftNavigationController = sideMenuStoryboard.instantiateInitialViewController() as? UISideMenuNavigationController
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuWidth = UIScreen.main.bounds.width - 64.0
        
        SideMenuManager.default.menuAddPanGestureToPresent(toView: navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: view, forMenu: .left)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension AppNavigationController {
    func setupNavigationBar() {
        hidesNavigationBarHairline = true
        navigationBar.isTranslucent = true
        
        guard let vc = topViewController as? ViewInterface else {
            return
        }
        
        vc.applyColorTheme()
    }
    
    func setupRightLogo() {
        let img = UIImage(named: "logo_navbar")
        let barButton = UIBarButtonItem(image: img, style: .plain, target: nil, action: nil)
        barButton.isEnabled = false
        
        if let vc = topViewController {
            vc.navigationItem.rightBarButtonItem = barButton
        } else {
            navigationItem.rightBarButtonItem = barButton
        }
    }
}




extension AppNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard animated, let vc = viewController as? ViewInterface else {
            return
        }
        
        navigationController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            vc.applyColorTheme() // animated = false, ya que se anima por el transitionCoordinator
        }, completion: nil)
    }
}




// MARK: - Status bar
extension AppNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var interfaceOrientation: UIInterfaceOrientation {
        return .portrait
    }
}
