//
//  PizzasListViewController.swift
//  cwk2A
//
// Edited by Girish on 11/12/2021.
//

import UIKit

class PizzasListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model = PizzaModel()
    var selectedType: PizzaType? //optional
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showRecipeDetail" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let pizza = model.pizzas[indexPath.row]
                    let detailVC = segue.destination as? PizzaDetailViewController
                    detailVC?.pizza = pizza
                }
            } else if segue.identifier == "addRecipe" {
                let navVC = segue.destination as? UINavigationController
                let addVC = navVC?.viewControllers.first as? AddPizzaViewController
                addVC?.delegate = self
            }
        }
    
    @IBAction func didChangeFilter(_ sender: UISegmentedControl) {
        print("changed filter")
              switch sender.selectedSegmentIndex  {

              case 0:
                  selectedType = nil
              case 1:
                  selectedType = .meat
              case 2:
                  selectedType = .vegetarian
              default:
                  break
              }
              tableView.reloadData() // whever the segmented control changes
    }
    
}
extension PizzasListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.pizzas(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell", for: indexPath)
        let burger = model.pizzas(forType: selectedType)[indexPath.row]
        
        cell.textLabel?.text = burger.name
        //cell.detailTextLabel?.text = burger.ingredients
        cell.imageView?.image = UIImage(named: burger.thumbnailName)
        
        return cell
    }
}
extension PizzasListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension PizzasListViewController: AddPizzaDelegate {
    func add(pizza: Pizza) {
        model.add(pizza: pizza)
        tableView.reloadData()
    }
}
