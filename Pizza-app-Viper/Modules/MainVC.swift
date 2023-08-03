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
    func menuPizzadetails(data: [MenuModel])
    func menuCombodetails(data: [MenuModel])
}



class MainVC: UIViewController {
    
    
    var presenter: MainViewPresenterProtocol?
    
    
    var salesItemsData: [SaleModel] = saleItemsData
    var headerMenuData: [String] = []
    var menuItemsData: [MenuModel] = []
    var dividedData: [[MenuModel]] = [[]]
    
    
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
    
    lazy var headerMenuCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: menuItemsFlowlayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = #colorLiteral(red: 0.9514434934, green: 0.9609040618, blue: 0.9738582969, alpha: 1)
        collection.register(MenuItemsCell.self, forCellWithReuseIdentifier: MenuItemsCell.indentifier)
        
        return collection
    }()
    
    lazy var menuItemsCollection: UICollectionView = {
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
        view.addSubview(headerMenuCollection)
        view.addSubview(menuItemsCollection)
        
        NSLayoutConstraint.activate([
            saleItemsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            saleItemsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saleItemsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            headerMenuCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerMenuCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerMenuCollection.heightAnchor.constraint(equalToConstant: 45),
            
            menuItemsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuItemsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuItemsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        saleCollectionHeigtConstraint = saleItemsCollection.heightAnchor.constraint(equalToConstant: 135)
        saleCollectionHeigtConstraint.isActive = true
        
        menuItemsCollectionTopConstraints = headerMenuCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140)
        menuItemsCollectionTopConstraints.isActive = true
        
        menuDetailsCollectionTopConstraints = menuItemsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180)
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
        headerMenuData = names
        
        DispatchQueue.main.async {
            self.headerMenuCollection.reloadData()
            self.menuItemsCollection.reloadData()
        }
    }
    
    func menuPizzadetails(data: [MenuModel]) {
        menuItemsData.append(contentsOf: data)
        
        DispatchQueue.main.async {
            self.menuItemsCollection.reloadData()
        }
    }
    
    func menuCombodetails(data: [MenuModel]) {
        menuItemsData.append(contentsOf: data)

        DispatchQueue.main.async {
            self.menuItemsCollection.reloadData()
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
        flowLayout.itemSize              = CGSize(width: 100, height: 30)
        flowLayout.scrollDirection       = .horizontal
        return flowLayout
    }
    
    
    func menuDetailsFlowlayout() -> UICollectionViewFlowLayout {
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
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
            
            return salesItemsData.count
            
        case headerMenuCollection:
            
            return headerMenuData.count
            
        case menuItemsCollection:

            return headerMenuData.count
    
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
            cell.filloutSale(imageName: salesItemsData[indexPath.row].image)
            return cell
            
        case headerMenuCollection:

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemsCell.indentifier, for: indexPath) as! MenuItemsCell
            cell.getTitles(name: headerMenuData[indexPath.row])
            
            return cell
        
        case menuItemsCollection:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuDetailsBaseCell.identifier, for: indexPath) as! MenuDetailsBaseCell
            cell.delegate = self
            cell.menuItemsData = menuItemsData
            return cell
        default:
            break
        }
        return cells
    }
    
    
    func scrollToSelectedSection(row: Int) {
        let index = IndexPath(row: row, section: 0)
        menuItemsCollection.isPagingEnabled = false
        menuItemsCollection.selectItem(at: index, animated: true, scrollPosition: .centeredHorizontally)
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView {
        case menuItemsCollection:
            let index = Int(scrollView.contentOffset.x / view.frame.width)
            let indexpath = IndexPath(row: index, section: 0)
            headerMenuCollection.selectItem(at: indexpath, animated: true, scrollPosition: .centeredHorizontally)
            headerMenuCollection.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: false)
        default:
            break
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case headerMenuCollection:
            self.scrollToSelectedSection(row: indexPath.row)
            self.menuItemsCollection.isPagingEnabled = true
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
                self.menuItemsCollection.reloadData()
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
                self.menuItemsCollection.reloadData()
            }
        }
    }
}



