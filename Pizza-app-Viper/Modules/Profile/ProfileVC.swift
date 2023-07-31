//
//  ProfileVC.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/27/23.
//

import UIKit



protocol ProfileVCProtocol {
    
    func displayData(name: String)
    
}

class ProfileVC: UIViewController {
    
    
    var presenter: ProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidloaded()
        view.backgroundColor = .green
    }
}


extension ProfileVC: ProfileVCProtocol {
    func displayData(name: String) {
        print(name)
    }
}
