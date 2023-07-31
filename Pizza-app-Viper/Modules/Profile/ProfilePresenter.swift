//
//  ProfilePresenter.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/27/23.
//

import Foundation


protocol ProfilePresenterProtocol: AnyObject {
    
    func viewDidloaded()
    func getData(name: String)
    func moveToProfile()
}


class ProfilePresenter: ProfilePresenterProtocol {

    
    weak var view: ProfileVC?
    
    var interactor: ProfileInteractorProtocol?
    var router: ProfileRouterProtocol?
    
    
    init(interactor: ProfileInteractorProtocol, router: ProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    
    func viewDidloaded() {
        interactor?.getDataFromServer()
    }
    
    func getData(name: String) {
        view?.displayData(name: name)
    }
    
    func moveToProfile() {
        router?.openController()
    }
}
