//
//  MainViewRouter.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    
    func navigateTo(to: UIViewController)
    func dismissController()
    
}



class MainViewRouter {
    
    weak var presenter: MainViewPresenterProtocol?
    
}

extension MainViewRouter: MainRouterProtocol {
    
    func navigateTo(to: UIViewController) {
        print("navigato to another controller")
    }
    
    func dismissController() {
        print("dismiss controller")
    }
}
