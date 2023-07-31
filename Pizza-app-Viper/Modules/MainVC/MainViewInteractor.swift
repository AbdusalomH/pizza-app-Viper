//
//  MainViewInteractor.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation

protocol MainViewInteractorProtocol {
    
    //func getDataFromServer()
    func fetchMenuData()

}

class MainViewInteractor: MainViewInteractorProtocol {
    
    
    weak var presenter: MainViewPresenterProtocol?
    
    
    let service: NetworkManagerProtocol? // DataServiceProtocol - это протокол, описывающий функциональность сервиса.

    
    init(service: NetworkManagerProtocol) {
        self.service = service
    }
    
    
//    func getDataFromServer() {
//
//        service?.getPizzaDataFromServer(completion: { [weak self] result in
//            switch result {
//            case .success(let pizza):
//                self?.presenter?.receivedPizzaData(data: pizza)
//            case .failure(let error):
//                print(error)
//            }
//        })
//
//        service?.getComboDataFromServer(completion: { result in
//            switch result {
//            case .success(let combo):
//                self.presenter?.receivedComboData(data: combo)
//            case .failure(let error):
//                print(error)
//
//            }
//        })
//    }
    
    func fetchMenuData() {
//        let group = DispatchGroup()
//        
//        group.enter()
//        service?.getPizzaDataFromServer(completion: { [weak self] result in
//            switch result {
//            case .success(let success):
//                self?.presenter?.receivedPizzaData(data: success)
//                group.leave()
//            case .failure(let failure):
//                print(failure)
//                group.leave()
//            }
//        })
//        
//        
//        group.enter()
//        service?.getComboDataFromServer(completion: { [weak self] result in
//            switch result {
//            case .success(let success):
//                self?.presenter?.receivedComboData(data: success)
//                group.leave()
//            case .failure(let failure):
//                print(failure)
//                group.leave()
//            }
//        })
//        
//        group.enter()
//        service?.getMenuItems(completion: { [weak self] result in
//            switch result {
//            case .success(let success):
//                self?.presenter?.receivedMenuItems(data: success)
//                group.leave()
//            case .failure(let failure):
//                print(failure)
//                group.leave()
//            }
//        })
//        group.notify(queue: .main) {
//            print("Dispatchgroup Successfully recevied all data from server")
//        }
    }
}
