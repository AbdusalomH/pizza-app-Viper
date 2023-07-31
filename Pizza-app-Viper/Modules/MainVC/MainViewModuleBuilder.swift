//
//  MainViewModuleBuilder.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import UIKit

class MainViewModuleBuilder {
    
    static func build() -> UIViewController {
        
        let dataService = NetworkManager()
        let interactor = MainViewInteractor(service: dataService)
        
        let router = MainViewRouter()
        let presenter = MainViewPresenter(router: router, interactor: interactor)
        let mainVC = MainVC()
        
        mainVC.presenter = presenter
        presenter.view = mainVC
        interactor.presenter = presenter
        router.viewController = mainVC
        return mainVC
    }
}
