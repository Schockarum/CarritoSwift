//
//  ItemSaleList.swift
//  Carrito de compras
//
//  Created by Luis Mauricio Esparza Vazquez on 3/26/19.
//  Copyright © 2019 Schock. All rights reserved.
//
//  View controller del table view
import UIKit

class ItemSaleList: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var shoppingCartIcon: UIImageView!
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var purchaseTotalLabel: UILabel!
    
    var products: [Product] = []
    var cart = ShoppingCart()
    
    var itemsInCart = Int()
    var cartTotal = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        products = createProductArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemsInCart = cart.countCartItems(cart: cart)
        cartTotal = cart.calculateTotal(cart: cart)
        itemsInCartLabel.text = "Items: " + String(itemsInCart)
        purchaseTotalLabel.text = "Total: $" + String(cartTotal)

    }
    
    func createProductArray() -> [Product]{
        var temp: [Product] = []
        
        let j1 = Product(image: UIImage(named: "j1")!, title: "The Legend of Zelda: Breath of the Wild", price: 1299)
        let j2 = Product(image: UIImage(named: "j2")!, title: "Splatoon 2", price: 1299)
        let j3 = Product(image: UIImage(named: "j3")!, title: "ARMS", price: 899)
        let j4 = Product(image: UIImage(named: "j4")!, title: "Bayonetta 2", price: 999)
        let j5 = Product(image: UIImage(named: "j5")!, title: "Captain Toad: Treasure Tracker", price: 999)
        let j6 = Product(image: UIImage(named: "j6")!, title: "Super Mario Party", price: 1099)
        let j7 = Product(image: UIImage(named: "j7")!, title: "Dragon Ball FighterZ", price: 999)
        let j8 = Product(image: UIImage(named: "j8")!, title: "Hyrule Warrios: Definitive Edition", price: 1099)
        let j9 = Product(image: UIImage(named: "j9")!, title: "Mario Kart 8 DELUXE", price: 1299)
        let j10 = Product(image: UIImage(named: "j10")!, title: "Mario Tenis ACES", price: 1199)
        let j11 = Product(image: UIImage(named: "j11")!, title: "Portal Knights", price: 899)
        let j12 = Product(image: UIImage(named: "j12")!, title: "Yoshi's Crafted World", price: 1299)
        let j13 = Product(image: UIImage(named: "j13")!, title: "Just Dance 2017", price: 1099)
        let j14 = Product(image: UIImage(named: "j14")!, title: "Dark Souls REMASTERED", price: 1199)
        let j15 = Product(image: UIImage(named: "j15")!, title: "Kirby Star Allies", price: 1299)
        let j16 = Product(image: UIImage(named: "j16")!, title: "The Way of Sushido", price: 999)
        let j17 = Product(image: UIImage(named: "j17")!, title: "Dragon Quest Builders", price: 1299)
        
        temp.append(j1)
        temp.append(j2)
        temp.append(j3)
        temp.append(j4)
        temp.append(j5)
        temp.append(j6)
        temp.append(j7)
        temp.append(j8)
        temp.append(j9)
        temp.append(j10)
        temp.append(j11)
        temp.append(j12)
        temp.append(j13)
        temp.append(j14)
        temp.append(j15)
        temp.append(j16)
        temp.append(j17)
        
        return temp
    }

    func setupUI(){
        navigationItem.title = "Catálogo"
        
        tableView.backgroundColor = .clear
        
        itemsInCartLabel.text = "Items: " + String(itemsInCart)
        purchaseTotalLabel.text = "Total: $" + String(cartTotal)
        shoppingCartIcon.image = UIImage(named: "white cart")
        bottomView.backgroundColor = .clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toProductDetail":
            let indexPath = tableView.indexPathForSelectedRow
            let productView = segue.destination as? ProductDetailViewController
            productView?.product = products[indexPath!.row]
            productView?.productListCartControl = self //Referencia de éste view p/inyección
        case "toCartInfo":
            let cartView = segue.destination as? CartModalViewController
            cartView?.productListCartControl = self //Inyecciones ftw \o/
        default:
            print("¡Oh, Neptuno!")
        }
    }
    
    //Acciones
    
}


//Implementaciones del tableview en extensión
extension ItemSaleList: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductCell
        
        //propiedades de la celda se modifican en su clase
        cell.placeProduct(product: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
