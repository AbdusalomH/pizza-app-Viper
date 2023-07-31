//
//  DataSevice.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation


protocol NetworkManagerProtocol: AnyObject {
    
    func getMenuItems(completion: @escaping (Result<[String], Error>) -> Void)
    func getPizzaDataFromServer(completion: @escaping (Result<[MenuModel], Error>) -> Void)
    func getComboDataFromServer(completion: @escaping (Result<[MenuModel], Error>) -> Void)
    
}


class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    
    func getPizzaDataFromServer(completion: @escaping (Result<[MenuModel], Error>) -> Void) {
        
        
        let pizzaUrl = "https://649cfb339bac4a8e669d2398.mockapi.io/api/v1/pizaitems"
        
        
        guard let url = URL(string: pizzaUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            
            do {
                let receivedData = try decoder.decode([MenuModel].self, from: data)
                completion(.success(receivedData))
            } catch {
                print("Something went wrong")
            }
        }
        task.resume()
    }
    
    func getComboDataFromServer(completion: @escaping (Result<[MenuModel], Error>) -> Void) {
        
        let pizzaUrl = "https://64a0f84b0079ce56e2dab651.mockapi.io/api/v2/combo"
        
        
        guard let url = URL(string: pizzaUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            
            do {
                let receivedData = try decoder.decode([MenuModel].self, from: data)
                completion(.success(receivedData))
            } catch {
                print("Something went wrong")
            }
        }
        task.resume()
    }
    
    
    
    
    func getMenuItems(completion: @escaping (Result<[String], Error>) -> Void) {
        
        let menuItemsUrl = "https://649cfb339bac4a8e669d2398.mockapi.io/api/v1/comboitems"
        
        guard let url = URL(string: menuItemsUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            do {
                let receivedData = try decoder.decode([String].self, from: data)
                completion(.success(receivedData))
            } catch {
                print("Something went wrong")
            }
        }
        task.resume()
    }
}
