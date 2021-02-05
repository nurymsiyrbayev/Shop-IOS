//
//  CartTableViewCell.swift
//  IOS-Mobile-Dev-1-Assignment-3-Week-7
//
//  Created by ADMIN ODoYal on 04.02.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    static let identifider = String(describing: CartTableViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(_ item: Product) {
        productImageView.image = UIImage(named: item.imageName ?? "eror image name")
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        priceLabel.text = String(item.price ?? 0.0)+"$"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
