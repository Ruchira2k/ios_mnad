//
//  ViewController.swift
//  UtilityConverterDemo
//
//  Created by Visal Rajapakse on 2022-03-02.
//

import UIKit

class ViewController: UIViewController {

    let ounceInKilos: Double = 0.0283495
    let poundsInKilos: Double = 0.453592
    let gramsInKilos: Double = 1000
    let stoneInKilos: Double = 0.157473

    @IBOutlet weak var keyboard: ReusableView!
    
    @IBOutlet var textfields: [UITextField]! // Outlet collectionview to hold the textfields

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the delegate of the keyboard.
        keyboard.delegate = self
        // Looping throught each texfield to disable the default keyboard
        textfields.forEach { textfield in
            textfield.inputView = UIView()
            textfield.inputAccessoryView = UIView()
        }

//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: nil)

        let kilosToOunces = UserDefaults.standard.double(forKey: "KILOS_TO_OUNCES")
        let tf = getTextFieldByTag(tag: 0)
        tf?.text = "\(kilosToOunces)"
        print(kilosToOunces)
    }

    func calculate(textfield: UITextField) {
        if textfield.tag == 0 {
            let text = textfield.text ?? ""
            let number = Double(text) ?? 0
            let conversion = number * ounceInKilos

            let textfield = textfields.filter { tf in
                return tf.tag == 2
            }.first

            textfield?.text = "\(conversion)"
            // Changing the value of Ounces to Kilograms
        } else if textfield.tag == 5 {
            print(textfield.tag)
            // Changing the value of Kilograms to Ounces
            let text = textfield.text ?? ""
            let number = Double(text) ?? 0
            let kilosToOunces = number / ounceInKilos
            let kilosToPounds = number / poundsInKilos
            let kilosToGrams = number * gramsInKilos
            let kilosToStone = number * stoneInKilos
            let stonePound: Double = 10

            let ounceTF = getTextFieldByTag(tag: 0)
            let poundTF = getTextFieldByTag(tag: 1)
            let gramTF = getTextFieldByTag(tag: 2)
            let stoneTF = getTextFieldByTag(tag: 3)
            let stonePoundTF = getTextFieldByTag(tag: 4)

            let weight = Weight(
                ounce: kilosToOunces,
                pound: kilosToPounds,
                gram: kilosToGrams,
                stone: kilosToStone,
                stonePound: stonePound,
                kilos: number)

            ounceTF?.text = "\(weight.ounce)"
            poundTF?.text = "\(weight.pound)"
            gramTF?.text = "\(weight.gram)"
            stoneTF?.text = "\(weight.stone)"
            stonePoundTF?.text = "\(weight.stonePound)"

            UserDefaults.standard.set(weight.ounce, forKey: "KILOS_TO_OUNCES")
        }
    }

    func getTextFieldByTag(tag: Int) -> UITextField? {
        let textfield = textfields.filter { tf in
            return tf.tag == tag
        }.first
        return textfield
    }
}

// MARK: Implementation of the Reusable protocol methods
extension ViewController: ReusableProtocol {

    func changeWeight(textfield: UITextField) {
        calculate(textfield: textfield)
    }

    func didPressNumber(_ number: String) {
        let textfield = textfields.filter { tf in
            return tf.isFirstResponder
        }.first

        if let tf = textfield {
            tf.text! += "\(number)"
            changeWeight(textfield: tf)
        }
    }

    func didPressDecemialNegative(_ value: String) {

        if value == "-" {
            return
        }

        let textfield = textfields.filter { tf in
            return tf.isFirstResponder
        }.first

        if let tf = textfield {
            if (tf.text?.count ?? 0) > 0 {
                tf.text! += "."
            }
        }
    }

    func didPressDelete() {
        let textfield = textfields.filter { tf in
            return tf.isFirstResponder
        }.first
        if let tf = textfield {
            if (tf.text?.count ?? 0) > 0 {
                _ = tf.text!.removeLast()
            }
            calculate(textfield: tf)
        }
    }
}

