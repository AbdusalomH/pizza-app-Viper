//
//  Models.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/28/23.
//

import Foundation

struct MenuModel: Codable {
    let id: Int
    let title: String
    let image: String
    let pizzaDescription: String
    let size: [String]
    let price: [Int]
}

struct SaleModel {
    let image: String
}

let saleItemsData: [SaleModel] = [
    SaleModel(image: "sale1"),
    SaleModel(image: "sale2"),
    SaleModel(image: "sale3"),
    SaleModel(image: "sale4")
]


