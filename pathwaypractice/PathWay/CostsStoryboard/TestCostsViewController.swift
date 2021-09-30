//
//  CostsViewController.swift
//  PathWay
//
//  Created by Montypass on 20.09.2021.
//

import UIKit

class TestCostsViewController: UIViewController {
    
    @IBOutlet weak var tableCost: UITableView!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var defaults = UserDefaults.standard
    
    var names: [String] = []
    var prices: [Double] = []
    var total: Double = 0.0
    
    override func viewWillAppear(_ animated: Bool) {
        names = defaults.stringArray(forKey: "names") ?? [String]()
        prices = defaults.array(forKey: "prices") as? [Double] ?? [Double]()
        total = defaults.double(forKey: "total")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        
        tableCost.delegate = self
        tableCost.dataSource = self
        tableCost.rowHeight = 60
        
        totalLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        totalUpdateLabel()
    }

    override func viewDidDisappear(_ animated: Bool) {
        defaults.setValue(names, forKey: "names")
        defaults.setValue(prices, forKey: "prices")
        defaults.setValue(total, forKey: "total")
    }
    
    @IBAction func addCost(_ sender: Any) {
        let addAlert = UIAlertController(title: "New Cost", message: "Please, enter: \n Name and Price", preferredStyle: .alert)
        addAlert.addTextField()
        addAlert.addTextField { (textField) in
            textField.keyboardType = .decimalPad
        }
        let addCostAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let name = addAlert.textFields![0].text?.trimmingCharacters(in: .whitespacesAndNewlines)
            if name != "" {
                let price = Double(addAlert.textFields![1].text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "0")
                self.total += price ?? 0.0
                self.names.append(name ?? "")
                self.prices.append(price ?? 0.0)
                self.tableCost.reloadData()
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        addAlert.addAction(cancelAction)
        addAlert.addAction(addCostAction)
        
        present(addAlert, animated: true, completion: nil)
        viewDidDisappear(true)
        UserDefaults.standard.set(true, forKey: "change")
        totalUpdateLabel()
    }
    
    func totalUpdateLabel() {
        total = Double(round(100*total)/100)
        totalPriceLabel.text = String(total) + " $"
        totalPriceLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        totalPriceLabel.textColor = .systemGreen
    }
}

extension TestCostsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CostTableViewCell
        cell.name.text = names[indexPath.row]
        cell.price.text = String(prices[indexPath.row]) + " $"
        totalUpdateLabel()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.total -= prices[indexPath.row]
            prices.remove(at: indexPath.row)
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableCost.reloadData()
            totalUpdateLabel()
            UserDefaults.standard.set(true, forKey: "change")
        } else if editingStyle == .insert {
          
        }
    }
    
}
