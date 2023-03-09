//
//  ViewController.swift
//  AreaCalculator
//
//  Created by Ruchira Sahabandu  on 2023-01-27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var calculateAreaButton: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    
    var widthValue: String = ""
    var heightValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = ""
    }
    
    @IBAction func didTapCalculateButton(_ sender: Any) {
        
        let width = widthTextField.text
        let height = heightTextField.text
        
        //if something is wrong in the guard method, code below it won't execute
        guard let w = width, let h = height,
                let floatWidth = Float(w),
                let floatHeight = Float(h) else { return }
        
        let area = floatWidth * floatHeight
        outputLabel.text = String(area)
        
    }


//    @IBAction func calculateArea(_ sender: Any) {
//        // Calculating and setting the area
//        let width = Double(widthValue) ?? 0
//        let height = Double(heightValue) ?? 0
//
//        let area = 0.5 * width * height
//        outputLabel.text = "\(area)"
//    }

}

