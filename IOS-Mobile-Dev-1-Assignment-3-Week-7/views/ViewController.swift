//
//  ViewController.swift
//  IOS-Mobile-Dev-1-Assignment-3-Week-7
//
//  Created by ADMIN ODoYal on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {
    static let identifier = String(describing: ViewController.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    var productArray = [Product]()
    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var viewSegmentedController:UISegmentedControl!
    @IBOutlet weak var cartButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productArrayConfigure()
        shopTableConfigure()
        shopCollectionConfigure()
    }
    @IBAction func showCart(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: CartViewController.identifier) as! CartViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
            {
            case 0:
                hideShopCollectionView()
            case 1:
                hideShopTableView()
            default:
                break
            }
        shopTableView.reloadData()
        shopCollectionView.reloadData()
    }
    
    func shopTableConfigure(){
        shopTableView.backgroundColor = .systemGray6
        shopTableView.delegate = self
        shopTableView.dataSource = self
        shopTableView.register(ShopTableViewCell.nib, forCellReuseIdentifier: ShopTableViewCell.identifider)
    }
    
    func shopCollectionConfigure(){
        shopCollectionView.backgroundColor = .systemGray6
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
        shopCollectionView.register(ShopCollectionViewCell.nib, forCellWithReuseIdentifier: ShopCollectionViewCell.identifider)
    }
    
    func hideShopCollectionView() {
        self.shopCollectionView.isHidden = true
        self.shopTableView.isHidden = false
        
    }
    
    func hideShopTableView() {
        self.shopTableView.isHidden = true
        self.shopCollectionView.isHidden = false
    }
    
    func productArrayConfigure() {
        self.productArray.append(Product(name: "MagSafe Charger", description: "MagSafe is a new ecosystem of accessories for easy attachment and faster wireless charging. With endless combinations, there is a mix to match any style.", price: 39.00 , imageName: "MagSafeCharger-1x1"))
        self.productArray.append(Product(name: "MagSafe Duo Charger", description: "The MagSafe Duo Charger conveniently charges your compatible iPhone, Apple Watch, Wireless Charging Case for AirPods, and other Qi-certified devices. Just place your devices on the charger and a steady, efficient charge begins on contact. The charger folds together neatly so you can easily take it with you wherever you go.", price: 129.00 , imageName: "MagSafeDuoCharger-1x1"))
        self.productArray.append(Product(name: "Twelve South PlugBug Duo", description: "Twelve South PlugBug Duo streamlines your charging setup by letting you charge your MacBook along with two more devices at the same time from one outlet—without dongles. PlugBug Duo attaches to any model of MacBook power adapter and has two standard USB charging ports for powering up your other devices. As an added bonus, this little power pack also doubles as an international charger and includes five popular plugs that work in most major countries around the world.", price: 0.99 , imageName: "TwelveSouthPlugBugDuo-1x1"))
        self.productArray.append(Product(name: "USB-C to Lightning Cable (2 m)", description: "Connect your iPhone, iPad, or iPod with Lightning connector to your USB-C or Thunderbolt 3 (USB-C) enabled Mac for syncing and charging, or to your USB-C enabled iPad for charging.", price: 35, imageName: "USB-CToLightningCable(2m)-1x1"))
        self.productArray.append(Product(name: "USB-C to Lightning Cable (1 m)", description: "Connect your iPhone, iPad, or iPod with Lightning connector to your USB-C or Thunderbolt 3 (USB-C) enabled Mac for syncing and charging, or to your USB-C enabled iPad for charging.", price: 19.00, imageName: "USB-CToLightningCable(1m)-1x1"))
        self.productArray.append(Product(name: "USB-C Digital AV Multiport Adapter", description: "The USB-C Digital AV Multiport Adapter lets you connect your USB-C-enabled Mac or iPad to an HDMI display, while also connecting a standard USB device and a USB-C charging cable.", price: 69.00, imageName: "USB-CDigitalAVMultiportAdapter-1x1"))
        self.productArray.append(Product(name: "20W USB-C Power Adapter", description: "The Apple 20W USB‑C Power Adapter offers fast, efficient charging at home, in the office, or on the go. While the power adapter is compatible with any USB‑C-enabled device, Apple recommends pairing it with the iPad Pro and iPad Air for optimal charging performance. You can also pair it with iPhone 8 or later to take advantage of the fast-charging feature.", price: 19.00, imageName: "20WUSB-CPowerAdapter-1x1"))
        self.productArray.append(Product(name: "", description: "The 96W USB-C Power Adapter offers fast, efficient charging at home, in the office, or on the go. While this power adapter is compatible with any USB-C–enabled device, Apple recommends pairing it with your 16-inch MacBook Pro for optimal charging performance.", price: 79.00, imageName: "96WUSB-CPowerAdapter-1x1"))
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shopTableView.dequeueReusableCell(withIdentifier: ShopTableViewCell.identifider) as! ShopTableViewCell
        cell.configure(self.productArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: ProductViewController.identifider) as! ProductViewController
        vc.item = self.productArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shopCollectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifider, for: indexPath) as! ShopCollectionViewCell
        cell.configure(self.productArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: ProductViewController.identifider) as! ProductViewController
        vc.item = self.productArray[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}
