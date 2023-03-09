//
//  AddPizzaViewController.swift
//  cwk2A
//
// Edited by Girish on 11/12/2021.
//

import UIKit

protocol AddPizzaDelegate {
    func add(pizza: Pizza)
}

class AddPizzaViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    let ingredientsPlaceholder = "Add ingredients"
    
    var delegate: AddPizzaDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ingredientsTextView.text = ingredientsPlaceholder
        ingredientsTextView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
    
    @IBAction func didTapSave(_ sender: Any) {
        guard let name = nameTextField.text else { return }
                let newPizza = Pizza(name: name, ingredients: ingredientsTextView.text, imageName: "", thumbnailName: "", type: .vegetarian)
                delegate?.add(pizza: newPizza)
                dismiss(animated: true)
    }
    
}
extension AddPizzaViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.tertiaryLabel {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = ingredientsPlaceholder
            textView.textColor = UIColor.tertiaryLabel
        }
    }
    
    
}
