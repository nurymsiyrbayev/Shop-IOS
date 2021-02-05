//
//  Product.swift
//  IOS-Mobile-Dev-1-Assignment-3-Week-7
//
//  Created by ADMIN ODoYal on 04.02.2021.
//

import Foundation

struct Product {
    let name: String?
    let description: String?
    let price: Double?
    let imageName: String?
}

class CartSingltone {
    var cartProducts = [Product]()
    
    static var shared: CartSingltone = {
        let instance = CartSingltone()

        return instance
    }()
    
    private init(){}
    
    func addToCart(_ item: Product) {
        self.cartProducts.append(item)
    }
    
    func buyAllFromCart() {
        self.cartProducts.removeAll()
    }
    
    func removeItem(_ index: Int) {
        self.cartProducts.remove(at: index)
    }
}
