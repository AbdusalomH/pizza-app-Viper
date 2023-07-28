//
//  MainViewPresenter.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    func viewDidloaded()
    func receviedData(name: String)
    func moveToProfile()
}



class MainViewPresenter {
    
    
    weak var view: MainViewProtocol?
    
    var router: MainRouterProtocol?
    var interactor: MainViewInteractorProtocol?
    
    init(router: MainRouterProtocol, interactor: MainViewInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
}

extension MainViewPresenter: MainViewPresenterProtocol {
    
    func viewDidloaded() {
        interactor?.getDataFromServer()
    }
    
    
    func receviedData(name: String) {
        view?.displayData(name)
    }
    
    func moveToProfile() {
        router?.navigateTo(to: ProfileVC())
    }
}

