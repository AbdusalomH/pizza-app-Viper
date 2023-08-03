//
//  MainViewInteractor.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation

protocol MainViewInteractorProtocol {
    
    func fetchMenuData()

}

class MainViewInteractor: MainViewInteractorProtocol {
    
    
    weak var presenter: MainViewPresenterProtocol?
    
    
    let service: NetworkManagerProtocol?

    
    init(service: NetworkManagerProtocol) {
        self.service = service
    }
    
    
    func fetchMenuData() {
        let group = DispatchGroup()
        
        group.enter()
        service?.getPizzaDataFromServer(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                if let presenter = self.presenter {
                    presenter.receivedPizzaData(data: success)
                    group.leave()
                }
                
            case .failure(let failure):
                print(failure)
                group.leave()
            }
        })
        
        
        group.enter()
        service?.getComboDataFromServer(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                if let presenter = self.presenter {
                    presenter.receivedComboData(data: success)
                    group.leave()
                }
            case .failure(let failure):
                print(failure)
                group.leave()
            }
        })
        
        group.enter()
        service?.getMenuItems(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                if let presenter = self.presenter {
                    presenter.receivedMenuItems(data: success)
                    group.leave()
                }
            case .failure(let failure):
                print(failure)
                group.leave()
            }
        })
        group.notify(queue: .main) {
            print("Dispatchgroup Successfully recevied all data from server")
        }
    }
}
