//
//  DetailsViewController.swift
//  ott
//
//  Created by dpsmac1 on 25-04-18.
//  Copyright (c) 2018 Digitalproserver. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import SideMenu

final class DetailsViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: DetailsPresenterInterface!
    
    // MARK: - Private properties -
    private let activityIndicator = UIActivityIndicatorView()
    fileprivate var activityIndicatorCount: Int = 0 { // Cuando es 0, se oculta
        didSet {
            if activityIndicatorCount != 0 {
                view.isUserInteractionEnabled = false
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
                view.isUserInteractionEnabled = true
            }
        }
    }

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        // MARK: Activity indicator
        activityIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.clipsToBounds = true
        activityIndicator.layer.cornerRadius = 8.0
        view.addSubview(activityIndicator)
    }
	
    @IBAction func closePopup() {
        presenter.closePopup()
    }
    
}

// MARK: - Extensions -

extension DetailsViewController: DetailsViewInterface {
    // MARK: Color theme
    var colorTheme: ColorTheme { return Themes.darkGray }
    
    // MARK: Side menu
    func showSideMenu() {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    // MARK: Activity indicator
    func showLoadingIndicator() {
        activityIndicatorCount += 1
    }
    
    func hideLoadingIndicator() {
        activityIndicatorCount -= 1
    }
}
