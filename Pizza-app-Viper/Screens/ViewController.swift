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
    
    lazy var tappedButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Нажми на меня", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.textColor = .red
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedButt), for: .touchUpInside)
        return button
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
        view.addSubview(tappedButton)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            tappedButton.heightAnchor.constraint(equalToConstant: 50),
            tappedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            tappedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tappedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    @objc func tappedButt() {
        presenter?.moveToProfile()
    }
}


extension ViewController: MainViewProtocol  {
    func displayData(_ data: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = data
        }
    }
}


