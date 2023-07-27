//
//  MainViewInteractor.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation

protocol MainViewInteractorProtocol {
    
    func getDataFromServer()

}

class MainViewInteractor: MainViewInteractorProtocol {
    
    
    weak var presenter: MainViewPresenterProtocol?
    
    
    let service: DataServiceProtocol // DataServiceProtocol - это протокол, описывающий функциональность сервиса.

    init(service: DataServiceProtocol) {
        self.service = service
    }
    
    
    func getDataFromServer() {
        service.getPizzaData { [weak self] name in
            self?.presenter?.receviedData(name: name)
        }
    }
}
