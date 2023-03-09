//
//  PizzaDetailViewController.swift
//  cwk2A
//
// Edited by Girish on 11/12/2021.
//

import UIKit

class PizzaDetailViewController: UIViewController {

    @IBOutlet weak var bannerImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var pizza: Pizza!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerImageView.image = UIImage(named: pizza.imageName)
       
        nameLabel.text = pizza.name
        
        ingredientsTextView.text = bulletedList(forIngredients: pizza.ingredients)
        

        // Do any additional setup after loading the view.
    }
    
    private func bulletedList(forIngredients ingredients: String) -> String{
        var list = ""
        let items = ingredients.split(separator: ",")
        items.forEach { list.append("\u{2022} \($0)\n")}
        return list
    }

}
