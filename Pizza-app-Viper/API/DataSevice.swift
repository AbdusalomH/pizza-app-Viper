//
//  DataSevice.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//

import Foundation


protocol DataServiceProtocol: AnyObject {
    func getPizzaData(completion: @escaping (String) -> Void)
}


class Dataservice: DataServiceProtocol {
    
    func getPizzaData(completion: @escaping (String) -> Void) {
        completion("Новая пиицца готова")
    }
}
