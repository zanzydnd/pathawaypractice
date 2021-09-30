//
//  MainProfileViewController.swift
//  PathWay
//
//  Created by Montypass on 19.09.2021.
//

import UIKit

class MainProfileViewController: UIViewController {

    @IBOutlet weak var carPhoto: UIImageView!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var autoNameField: UILabel!
    @IBOutlet weak var numberCarField: UILabel!
    @IBOutlet weak var dataOfInsurance: UILabel!
    @IBOutlet weak var dataOfTO: UILabel!
    
    
    var defaults = UserDefaults.standard
    var boolean = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carPhoto.layer.cornerRadius = carPhoto.frame.height / 2
        carPhoto.clipsToBounds = true
        
        nameField.layer.cornerRadius = 20
        nameField.clipsToBounds = true
        autoNameField.layer.cornerRadius = 20
        autoNameField.clipsToBounds = true
        dataOfInsurance.layer.cornerRadius = 20
        dataOfInsurance.clipsToBounds = true
        dataOfTO.layer.cornerRadius = 20
        dataOfTO.clipsToBounds = true
        numberCarField.layer.cornerRadius = 20
        numberCarField.clipsToBounds = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if defaults.bool(forKey: "bool") {
            nameField.text = defaults.string(forKey: "name")
            autoNameField.text = defaults.string(forKey: "auto")
            dataOfInsurance.text = defaults.string(forKey: "insurance")
            dataOfTO.text = defaults.string(forKey: "maintenance")
            numberCarField.text = defaults.string(forKey: "autoNumber")
        }
        
        let data = defaults.value(forKey: "CarPhoto") as? NSData
        if let data = data {
            carPhoto.image = UIImage(data: data as Data)
            carPhoto.contentMode = .scaleAspectFill
        }
    }
    
    @IBAction func editButton(_ sender: Any) {
        let storyboard = self.storyboard
        let second = storyboard?.instantiateViewController(identifier: "second") as! TestProfileViewController
        second.second = self
        second.modalPresentationStyle = .fullScreen
        UserDefaults.standard.set(true, forKey: "change")
        present(second, animated: true)
        }
}
    

