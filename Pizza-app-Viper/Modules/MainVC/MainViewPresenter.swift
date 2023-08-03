//
//  MainViewPresenter.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    func viewDidloaded()
    func receivedPizzaData(data: [MenuModel])
    func receivedComboData(data: [MenuModel])
    func receivedMenuItems(data: [String])
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
        interactor?.fetchMenuData()
    }

    
    func receivedMenuItems(data: [String]) {
        view?.headerMenuData(names: data)
    }

    
    func receivedPizzaData(data: [MenuModel]) {
        view?.menuPizzadetails(data: data)
    }
    
    
    func receivedComboData(data: [MenuModel]) {
        view?.menuCombodetails(data: data)
    }

    
    func moveToProfile() {
        router?.navigateTo(to: ProfileVC())
    }
}


