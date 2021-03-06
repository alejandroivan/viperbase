//
//  DetailsInterfaces.swift
//  ott
//
//  Created by dpsmac1 on 25-04-18.
//  Copyright (c) 2018 Digitalproserver. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum DetailsNavigationOption {
    case closePopup
}

protocol DetailsWireframeInterface: WireframeInterface {
    func navigate(to option: DetailsNavigationOption)
}

protocol DetailsViewInterface: ViewInterface {
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

protocol DetailsPresenterInterface: PresenterInterface {
    func closePopup()
    func fetchDetails(_ media: Media)
    func successFetchingDetails(_ media: Media)
    func failureFetchingDetails(_ error: Error?)
}

protocol DetailsInteractorInterface: InteractorInterface {
    func fetchDetails(media: Media)
}
