//
//  HistoryViewController.swift
//  UtilityConverterDemo
//
//  Created by Visal Rajapakse on 2022-03-16.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "History", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.row)"
        cell.contentConfiguration = content
        return cell
    }
}
