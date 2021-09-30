//
//  ProfileViewController.swift
//  PathWay
//
//  Created by Montypass on 19.09.2021.
//

import UIKit

class TestProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var autoNumber: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var autoNameField: UITextField!
    @IBOutlet weak var dateOfInsurance: UITextField!
    @IBOutlet weak var dateOfMaintenance: UITextField!
    @IBOutlet weak var myCarPhotoButton: UIButton!
    @IBOutlet weak var photoCar: UIImageView!
    weak var second: MainProfileViewController!
    
    var defaults = UserDefaults.standard
    var imagePicker = UIImagePickerController()
    
    let datePickerFirst = UIDatePicker()
    let datePickerSecond = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helpToMakeDate()
        helpToMakeDate2()
        
        imagePicker.delegate = self
        
        photoCar.layer.cornerRadius = photoCar.frame.height / 2
        photoCar.clipsToBounds = true
        
        let data = defaults.value(forKey: "CarPhoto") as? NSData
        if let data = data {
            photoCar.image = UIImage(data: data as Data)
            photoCar.contentMode = .scaleAspectFill
        }
        
        nameField.text = defaults.string(forKey: "name")
        autoNameField.text = defaults.string(forKey: "auto")
        dateOfInsurance.text = defaults.string(forKey: "insurance")
        dateOfMaintenance.text = defaults.string(forKey: "maintenance")
        autoNumber.text = defaults.string(forKey: "autoNumber")
    }

    func helpToMakeDate() {
        
        dateOfInsurance.inputView = datePickerFirst
        datePickerFirst.datePickerMode = .date
        let localID = Locale.preferredLanguages.first
        datePickerFirst.locale  = Locale(identifier: localID!)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        dateOfInsurance.inputAccessoryView = toolbar
    }
    
    @objc func doneAction() {
        
        getDateFromPicker()
        view.endEditing(true)
    }
    
    func getDateFromPicker() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateOfInsurance.text = formatter.string(from: datePickerFirst.date)
    }
    
    func helpToMakeDate2() {
        
        dateOfMaintenance.inputView = datePickerSecond
        datePickerSecond.datePickerMode = .date
        let localID = Locale.preferredLanguages.first
        datePickerSecond.locale  = Locale(identifier: localID!)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneActionSecond))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        dateOfMaintenance.inputAccessoryView = toolbar
    }
    
    @objc func doneActionSecond() {
        getDateFromPickerSecond()
        view.endEditing(true)
    }
    
    func getDateFromPickerSecond() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateOfMaintenance.text = formatter.string(from: datePickerSecond.date)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       
        defaults.set(nameField.text, forKey: "name")
        defaults.set(autoNameField.text, forKey: "auto")
        defaults.set(dateOfInsurance.text, forKey: "insurance")
        defaults.set(dateOfMaintenance.text, forKey: "maintenance")
        defaults.set(autoNumber.text, forKey: "autoNumber")
        defaults.set(true, forKey: "bool")
        second.viewWillAppear(true)
    }
    
    @IBAction func addCarPhoto(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoCar.contentMode = .scaleAspectFill
            photoCar.image = pickedImage
            let imageData: NSData = pickedImage.pngData()! as NSData
            defaults.set(imageData, forKey: "CarPhoto")
           }
           dismiss(animated: true, completion: nil)
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
