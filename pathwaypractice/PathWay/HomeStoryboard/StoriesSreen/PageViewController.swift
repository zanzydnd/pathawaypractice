//
//  PageViewController.swift
//  Home
//
//  Created by macOS on 13.07.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var content: StoriesMainElement?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentViewController  = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
        
        
        
    }
    
    func showViewControllerAtIndex(_ index: Int) -> OLDContentViewController? {
        guard let pages = content?.pages else {return nil}
        guard index >= 0 else {return nil}
        
        guard index < pages.count else {
//            let userDefaults = UserDefaults.standard
//            userDefaults.set(true, forKey: "presentationWasViewed")
//            dismiss(animated: true, completion: nil)
            return nil
        }
        
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? OLDContentViewController else {return nil}
        
        contentViewController.image = pages[index].page
        contentViewController.currentPage = index
        contentViewController.numberOfPages = pages.count
        
        return contentViewController
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! OLDContentViewController).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! OLDContentViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}
