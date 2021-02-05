//
//  ShopCollectionViewCell.swift
//  IOS-Mobile-Dev-1-Assignment-3-Week-7
//
//  Created by ADMIN ODoYal on 04.02.2021.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    static let identifider = String(describing: ShopCollectionViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    var item = Product(name: nil, description: nil, price: nil, imageName: nil)
        
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addToCart(_ sender: Any) {
        CartSingltone.shared.addToCart(item)
    }
    
    func configure(_ item: Product) {
        addButton.layer.cornerRadius = addButton.frame.size
            .height/4
        self.item = item
        productImageView.image = UIImage(named: item.imageName ?? "eror image name")
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        priceLabel.text = String(item.price ?? 0.0)+"$"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
