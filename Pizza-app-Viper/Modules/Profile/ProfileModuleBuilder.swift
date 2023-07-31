//
//  ProfileModuleBuilder.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/27/23.
//

import UIKit


class ProfileModuleBuilder {
    
    static func builder() -> UIViewController {
        
        let dataservice = NetworkManager()
        let interactor = ProfileInteractor(service: dataservice)
        let router = ProfileRouter()
        let presenter = ProfilePresenter(interactor: interactor, router: router)
        
        let vc = ProfileVC()
        
        vc.presenter = presenter
        presenter.view = vc
        router.viewController = vc
        interactor.presenter = presenter
        return vc
    }
}

 
