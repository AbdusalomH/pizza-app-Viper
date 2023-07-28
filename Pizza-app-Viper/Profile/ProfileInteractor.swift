//
//  ProfileInteractor.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/27/23.
//

import Foundation

protocol ProfileInteractorProtocol {
    
    func getDataFromServer()
    
}

class ProfileInteractor: ProfileInteractorProtocol {
    
    weak var presenter: ProfilePresenterProtocol?
    
    
    let service: DataServiceProtocol
    
    init(service: DataServiceProtocol) {
        self.service = service
    }
    
    func getDataFromServer() {
        service.getPizzaData { [weak self] name in
            self?.presenter?.getData(name: name)
        }
    }
}
