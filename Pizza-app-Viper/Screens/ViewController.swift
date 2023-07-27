//
//  ViewController.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//


import UIKit

protocol MainViewProtocol: AnyObject {
    
    func displayData(_ data: String)
    
}



class ViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .yellow
        return label
    }()
    
    
    var presenter: MainViewPresenterProtocol?
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSetup()
        presenter?.viewDidloaded()
    }
    
    
    func configureSetup() {
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
}


extension ViewController: MainViewProtocol  {
    func displayData(_ data: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = data
        }
    }
}


