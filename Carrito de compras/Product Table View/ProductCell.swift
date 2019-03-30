//
//  ProductCell.swift
//  Carrito de compras
//
//  Created by Luis Mauricio Esparza Vazquez on 3/26/19.
//  Copyright © 2019 Schock. All rights reserved.
//
//  Tipo de celda del table view

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPrizeLabel: UILabel!
    
    
    //propiedades de la celda
    func placeProduct(product: Product){
        self.productImageView.image = product.image
        self.productTitleLabel.text = product.title
        self.productPrizeLabel.text = "$" + String(product.price) + ".ºº"
        
        self.backgroundColor = .clear
        self.productTitleLabel.textColor = .white
        self.productPrizeLabel.textColor = .white
    }
}
