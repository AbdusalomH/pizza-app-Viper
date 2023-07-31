//
//  ViewController.swift
//  Pizza-app-Viper
//
//  Created by Mac on 7/23/23.
//


import UIKit

protocol MainViewProtocol: AnyObject {
    func saleMenuData(name: [SaleModel])
    func headerMenuData(names: [String])
    func menudetails(data: [MenuModel])
    
}



class MainVC: UIViewController {
    
    
    var presenter: MainViewPresenterProtocol?
    
    
    var saleItemsData: [SaleModel] = []
    var menuDetailsData: [String] = ["Пицца", "Комбо", "Juices", "Burgers"]
    var receviedMenuItemsData: [MenuModel] = []
    
    
    var saleCollectionHeigtConstraint: NSLayoutConstraint!
    var menuItemsCollectionTopConstraints: NSLayoutConstraint!
    var menuDetailsCollectionTopConstraints: NSLayoutConstraint!
    
    var collecionCellHeght: CGFloat = 250
    
    
    lazy var saleItemsCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: saleItemsFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(SaleItemsCell.self, forCellWithReuseIdentifier: SaleItemsCell.indetifier)
        return collection
    }()
    
    lazy var menuItemsCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: menuItemsFlowlayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = #colorLiteral(red: 0.9514434934, green: 0.9609040618, blue: 0.9738582969, alpha: 1)
        collection.register(MenuItemsCell.self, forCellWithReuseIdentifier: MenuItemsCell.indentifier)
        return collection
    }()
    
    lazy var menuDetailsCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: menuDetailsFlowlayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(MenuDetailsBaseCell.self, forCellWithReuseIdentifier: MenuDetailsBaseCell.identifier)
        collection.register(PizzaCell.self, forCellWithReuseIdentifier: PizzaCell.PizzaDescriptionCell)
        collection.register(ComboCell.self, forCellWithReuseIdentifier: ComboCell.ComboCellId)
        collection.register(ZakuskiCell.self, forCellWithReuseIdentifier: ZakuskiCell.juicesCellId)
        collection.isPagingEnabled = true
        collection.layer.cornerRadius = 15
        collection.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        collection.showsHorizontalScrollIndicator = false
        collection.isUserInteractionEnabled = true
        return collection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter?.viewDidloaded()
    }
    
    
    func setupView() {

        view.addSubview(saleItemsCollection)
        view.addSubview(menuItemsCollection)
        view.addSubview(menuDetailsCollection)
        
        NSLayoutConstraint.activate([
            saleItemsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            saleItemsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saleItemsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            menuItemsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuItemsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuItemsCollection.heightAnchor.constraint(equalToConstant: 45),
            
            menuDetailsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuDetailsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuDetailsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        saleCollectionHeigtConstraint = saleItemsCollection.heightAnchor.constraint(equalToConstant: 135)
        saleCollectionHeigtConstraint.isActive = true
        
        menuItemsCollectionTopConstraints = menuItemsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 135)
        menuItemsCollectionTopConstraints.isActive = true
        
        menuDetailsCollectionTopConstraints = menuDetailsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180)
        menuDetailsCollectionTopConstraints.isActive = true
        
    }
}


extension MainVC: MainViewProtocol  {
    
    func saleMenuData(name: [SaleModel]) {
        DispatchQueue.main.async {
            self.saleItemsCollection.reloadData()
        }
    }
    
    func headerMenuData(names: [String]) {
        //menuDetailsData = names
        DispatchQueue.main.async {
            self.menuItemsCollection.reloadData()
        }
    }
    
    func menudetails(data: [MenuModel]) {
        receviedMenuItemsData = data
        DispatchQueue.main.async {
            self.menuDetailsCollection.reloadData()
        }
    }
}


extension MainVC {
    
    //MARK: Flowlayout for collection tables
    func saleItemsFlowLayout() -> UICollectionViewFlowLayout {
        
        let width                        = view.bounds.width
        let padding:CGFloat              = 5
        let minimumItemSpacing:CGFloat   = 20
        let availableWidth               = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                    = availableWidth
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: itemWidth, height: 125)
        flowLayout.scrollDirection       = .horizontal
        return flowLayout
    }
    
    func menuItemsFlowlayout() -> UICollectionViewFlowLayout {
        let padding:CGFloat              = 5
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: 100, height: 35)
        flowLayout.scrollDirection       = .horizontal
        return flowLayout
    }
    
    
    func menuDetailsFlowlayout() -> UICollectionViewFlowLayout {
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        flowLayout.itemSize              = CGSize(width: view.bounds.width, height: view.frame.height - 150)
        flowLayout.scrollDirection       = .horizontal
        flowLayout.minimumLineSpacing    = 0
        return flowLayout
    }
}

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case saleItemsCollection:
            
            return saleItemsData.count
            
        case menuDetailsCollection:

            return 4
            
        case menuItemsCollection:
            return 4
            
        default:
            break
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cells = UICollectionViewCell()
        switch collectionView {
            
        case saleItemsCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleItemsCell.indetifier, for: indexPath) as! SaleItemsCell
            cell.filloutSale(imageName: saleItemsData[indexPath.row].image)
            return cell
        
        case menuDetailsCollection:
            
            
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PizzaCell.PizzaDescriptionCell, for: indexPath) as! PizzaCell
                cell.delegate = self
                return cell
            } else if indexPath.item == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComboCell.ComboCellId, for: indexPath) as! ComboCell
                cell.delegate = self
                return cell
                
            } else if indexPath.item == 2 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZakuskiCell.juicesCellId, for: indexPath) as! ZakuskiCell
                cell.delegate = self
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PizzaCell.PizzaDescriptionCell, for: indexPath) as! PizzaCell
                cell.delegate = self
                return cell
            }
                
 
        case menuItemsCollection:

            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemsCell.indentifier, for: indexPath) as! MenuItemsCell
            cell.getTitles(name: menuDetailsData[indexPath.row])
            return cell
        default:
            break
        }
        return cells
    }
    
    
    func scrollToSelectedSection(row: Int) {
        let index = IndexPath(row: row, section: 0)
        menuDetailsCollection.isPagingEnabled = false
        menuDetailsCollection.selectItem(at: index, animated: true, scrollPosition: .centeredHorizontally)
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView {
        case menuDetailsCollection:
            let index = Int(scrollView.contentOffset.x / view.frame.width)
            let indexpath = IndexPath(row: index, section: 0)
            menuItemsCollection.selectItem(at: indexpath, animated: true, scrollPosition: .centeredHorizontally)
            menuItemsCollection.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: false)
        default:
            break
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case menuItemsCollection:
            self.scrollToSelectedSection(row: indexPath.row)
            self.menuDetailsCollection.isPagingEnabled = true
        default:
            break
        }
    }
}


extension MainVC: MenuDetailsCellDelegate {
    func didScrollUp(in cell: MenuDetailsBaseCell) {
        menuItemsCollectionTopConstraints.constant = 135
        menuDetailsCollectionTopConstraints.constant = 180
        collecionCellHeght = 250
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            self.saleItemsCollection.alpha = 1
            self.view.layoutIfNeeded()
        }) { done in
            if done {
                self.menuDetailsCollection.reloadData()
            }
        }
    }
   
    
    func didScrollDown(in cell: MenuDetailsBaseCell) {
        menuItemsCollectionTopConstraints.constant = 0
        menuDetailsCollectionTopConstraints.constant = 45
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.saleItemsCollection.alpha = 0
            self.view.layoutIfNeeded()
        }) { done in
            if done {
                self.menuDetailsCollection.reloadData()
            }
        }
    }
}



