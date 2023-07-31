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
    
    
    let service: NetworkManagerProtocol
    
    init(service: NetworkManagerProtocol) {
        self.service = service
    }
    
    func getDataFromServer() {
        service.getPizzaDataFromServer { data in
            print(data)
        }
    }
}
