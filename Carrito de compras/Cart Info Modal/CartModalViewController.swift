//
//  CartModalViewController.swift
//  Carrito de compras
//
//  Created by Luis Mauricio Esparza Vazquez on 3/26/19.
//  Copyright © 2019 Schock. All rights reserved.
//

import UIKit

class CartModalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    
    var productListCartControl: ItemSaleList! //Para inyectar código
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var cartTotalLabel: UILabel!
    @IBOutlet weak var purchaseButton: PurchaseButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        tableView.backgroundColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
        
        itemsInCartLabel.text = "Items: " + String(productListCartControl.cart.countCartItems(cart: productListCartControl.cart))
        cartTotalLabel.text = "Total: $" + String(productListCartControl.cart.calculateTotal(cart: productListCartControl.cart)) + ".ºº"
        bottomView.backgroundColor = .clear
        
        if productListCartControl.cart.countCartItems(cart: productListCartControl.cart) == 0{
            purchaseButton.isHidden = true
        }
        tableView.separatorColor = .clear
        
    }
    
    //Acciones
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func removeFromCart(_ sender: UIButton) {
        let alert = UIAlertController(title: "Wait!", message: "Remove product from cart?",     preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Remove it 😞", style: .default, handler: { (action) in
            self.productListCartControl.cart.productList.remove(at: sender.tag) //Sender tag lo igualamos al indexpath.row en la creacion de la celda, por eso es posible!!!!
            self.tableView.reloadData()
            self.setupUI()

        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        }))    }

}

//Implementaciones del tableview en extensión
extension CartModalViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListCartControl.cart.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ref de view -> su carrito -> elemento del carrito ; (Product, Qty, Subt) -> Producto
        let product = self.productListCartControl.cart.productList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "modalCartCell") as! CartCell
        //propiedades de la celda se modifican en su clase
        cell.placeCartProduct(cartProduct: product.0, quantity: product.1, subtotal: product.2)
        
        
        //SALVA VIDAS!!! CADA BOTON TIENE ASOCIADO EL INDEXPATH DE SU CELDA
        cell.removeFromCartButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
