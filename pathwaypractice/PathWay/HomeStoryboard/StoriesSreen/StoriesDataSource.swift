//
//  StoriesDataSource.swift
//  Home
//
//  Created by macOS on 14.07.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//

import UIKit

struct StoriesDataSource {
    var mainElementArray: [StoriesMainElement] = [
        StoriesMainElement(icon: #imageLiteral(resourceName: "AboutApp"), pages: [StoriesPage(page:  #imageLiteral(resourceName: "Hello")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "ToDoList")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "Home")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "Costs")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "Profile "))]),

        StoriesMainElement(icon:  #imageLiteral(resourceName: "Covid"), pages: [StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive"))]),

        StoriesMainElement(icon:  #imageLiteral(resourceName: "Control"), pages: [StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive"))]),

        StoriesMainElement(icon:  #imageLiteral(resourceName: "CarsAndFilms"), pages: [StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:   #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive"))]),
        StoriesMainElement(icon:  #imageLiteral(resourceName: "CarPlay"), pages: [StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive")),
                                        StoriesPage(page:  #imageLiteral(resourceName: "carFive"))]),
    ]
}

struct StoriesMainElement {
    var icon: UIImage
    var pages: [StoriesPage]
}

struct StoriesPage {
    var page: UIImage
}
