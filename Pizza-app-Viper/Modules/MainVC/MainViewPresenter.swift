//
//  MainViewPresenter.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    func viewDidloaded()
    func pushdata() -> [MenuModel]
    func receivedPizzaData(data: [MenuModel])
    func receivedComboData(data: [MenuModel])
    func receivedMenuItems(data: [String])
    func moveToProfile()

}



class MainViewPresenter {
    
    weak var view: MainViewProtocol?
    
    
    var receivedData: [MenuModel] = []

    var router: MainRouterProtocol?
    var interactor: MainViewInteractorProtocol?
    
    init(router: MainRouterProtocol, interactor: MainViewInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}


extension MainViewPresenter: MainViewPresenterProtocol {
    
    
    
    func pushdata() -> [MenuModel] {
        return receivedData
    }
    

    func viewDidloaded() {
        interactor?.fetchMenuData()
    }

    
    func receivedMenuItems(data: [String]) {
        view?.headerMenuData(names: data)
    }

    
    func receivedPizzaData(data: [MenuModel]) {
        view?.menudetails(data: data)
        receivedData = data
    }
    
    
    func receivedComboData(data: [MenuModel]) {
        view?.menudetails(data: data)
    }

    
    func moveToProfile() {
        router?.navigateTo(to: ProfileVC())
    }
}


