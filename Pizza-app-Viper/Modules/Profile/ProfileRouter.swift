//
//  ProfileRouter.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/27/23.
//

import Foundation

protocol ProfileRouterProtocol {
    func openController()
}

class ProfileRouter: ProfileRouterProtocol {
    
    weak var viewController: ProfileVC?
    
    func openController() {
        print("najatie na xxx")
    }
}
