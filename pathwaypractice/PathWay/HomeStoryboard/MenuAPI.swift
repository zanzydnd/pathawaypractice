//
//  MenuAPI.swift
//  Home
//
//  Created by Montypass on 20.09.2021.
//

import UIKit

protocol MenuDataSource {
    func menu() -> String
}

class MenuAPI {
    static var dataSource: MenuDataSource?
    
    static func getMenu() -> [Menu] {
        
        let profileImage = getProfileImage() ?? #imageLiteral(resourceName: "Profile")
        let task = getTask() ?? "Nothing to do"
        let date = updateDatesOfInsurance() ?? "-"
        let name = getName() ?? "Hey, User!"
        let cost = getCosts()
        
        let menu = [
            Menu(heading: "Profile", info: name, image: profileImage),
            Menu(heading: "Weather", info: "It's rainy :(", image:  #imageLiteral(resourceName: "Weather")),
            Menu(heading: "ToDoList", info: "Current task", image:  #imageLiteral(resourceName: "toDo")),
            Menu(heading: "Total costs:", info: cost, image:  #imageLiteral(resourceName: "Costs-2")),
            Menu(heading: "Technical inspection info", info: "Date from last T.I. = " + date, image:  #imageLiteral(resourceName: "TO"))
        ]
        return menu
    }
    
    private static func updateDatesOfInsurance() -> String? {
        if let date = UserDefaults.standard.string(forKey: "maintenance") {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateOfM = dateFormatter.date(from:date)!
            let dateOfNow = Date()
            let components = Calendar.current.dateComponents([.day], from: (dateOfM), to: dateOfNow)
            let result = String(components.day!)
            return result
        } else {return nil}
    }
    
    private static func getName() -> String? {
        if let name = UserDefaults.standard.string(forKey: "name") {
            return "Hey, " + name + "!"
        } else {return nil}
    }
    
    private static func getCosts() -> String {
        return String(UserDefaults.standard.double(forKey: "total")) + "$"
    }
    
    private static func getTask() -> String? {
        return nil
    }
    
    private static func getProfileImage() -> UIImage? {
        let image: UIImage
        let data = UserDefaults.standard.value(forKey: "CarPhoto") as? NSData
        if let data = data {
            image = UIImage(data: data as Data)!
            return image
        }
        return nil
    }
}

