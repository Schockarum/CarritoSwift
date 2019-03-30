//
//  CartCell.swift
//  Carrito de compras
//
//  Created by Luis Mauricio Esparza Vazquez on 3/27/19.
//  Copyright © 2019 Schock. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPrizeLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productSubtotalLabel: UILabel!
    @IBOutlet weak var removeFromCartButton: UIButton!
    
    //propiedades de la celda
    func placeCartProduct(cartProduct: Product, quantity: Int, subtotal: Int){
        self.productImageView.image = cartProduct.image
        self.productTitleLabel.text = cartProduct.title
        self.productPrizeLabel.text = "Price: $" + String(cartProduct.price) + ".ºº"
        self.productQuantityLabel.text = "Qty: " + String(quantity)
        self.productSubtotalLabel.text = "Subtotal: $" + String(subtotal) + ".ºº"
        self.removeFromCartButton.imageView?.image = UIImage(named: "black remove cart")
        
        self.backgroundColor = .clear
        self.productTitleLabel.textColor = .white
        self.productPrizeLabel.textColor = .white
    }
    
}
