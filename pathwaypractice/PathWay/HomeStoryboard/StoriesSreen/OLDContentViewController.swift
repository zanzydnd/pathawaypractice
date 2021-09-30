//
//  ContentViewController.swift
//  Home
//
//  Created by macOS on 13.07.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//

import UIKit

class OLDContentViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pages: UIImageView!
    
    
    var image = #imageLiteral(resourceName: "CarThree")
    var currentPage = 0
    var numberOfPages = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pages.image = image
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage

    }
    

}
