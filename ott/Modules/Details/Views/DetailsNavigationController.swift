//
//  DetailsNavigationController.swift
//  ott
//
//  Created by dpsmac1 on 03-05-18.
//  Copyright © 2018 Digitalproserver. All rights reserved.
//

import UIKit

class DetailsNavigationController: UINavigationController {
//    override var modalTransitionStyle: UIModalTransitionStyle {
//        get {
//            return .crossDissolve
//        }
//        
//        set {}
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .crossDissolve
        
        // Do any additional setup after loading the view.
        navigationBar.isTranslucent = true
        navigationBar.barTintColor = UIColor(red: 21.0/255.0, green: 21.0/255.0, blue: 21.0/255.0, alpha: 1.0)
        topViewController?.automaticallyAdjustsScrollViewInsets = true
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




extension DetailsNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
