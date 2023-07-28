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
    
    weak var viewController: ViewController?
    
}

extension MainViewRouter: MainRouterProtocol {
    
    func navigateTo(to: UIViewController) {
        let vc
        
        viewController?.present(to,animated: true)
    }
    
    func dismissController() {
        print("dismiss controller")
    }
}
