//
//  CustomStoriesCell.swift
//  Home
//
//  Created by Montypass on 20.09.2021.
//

import UIKit

class PreViewController: UIViewController, SegmentedProgressBarDelegate {

    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyAvatar: UIImageView!
    @IBOutlet weak var storyName: UILabel!
    
    var pageIndex : Int = 0
    var items: [StoryDetailsData] = []
    var item: [UIImage] = []
    var progressBar: SegmentedProgressBar!
    let duration: TimeInterval = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storyAvatar.layer.cornerRadius = self.storyAvatar.frame.size.height / 2;
        storyAvatar.image = items[pageIndex].image
        storyName.text = items[pageIndex].name
        item = items[pageIndex].content
        
        progressBar = SegmentedProgressBar(numberOfSegments: item.count, duration: 5)
        
        progressBar.frame = CGRect(x: 18, y: UIApplication.shared.statusBarFrame.height + 5, width: view.frame.width - 35, height: 3)

        progressBar.delegate = self
        progressBar.topColor = UIColor.white
        progressBar.bottomColor = UIColor.white.withAlphaComponent(0.25)
        progressBar.padding = 2
        progressBar.isPaused = true
        progressBar.currentAnimationIndex = 0
        progressBar.duration = duration
        view.addSubview(progressBar)
        view.bringSubviewToFront(progressBar)
        
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(tapOn(_:)))
        tapGestureImage.numberOfTapsRequired = 1
        tapGestureImage.numberOfTouchesRequired = 1
        storyImageView.addGestureRecognizer(tapGestureImage)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 0.8) {
            self.view.transform = .identity
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.progressBar.startAnimation()
            self.showImage(index: 0)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        DispatchQueue.main.async {
            self.progressBar.currentAnimationIndex = 0
            self.progressBar.cancel()
            self.progressBar.isPaused = true
        }
    }
    
    //MARK: - SegmentedProgressBarDelegate
    func segmentedProgressBarChangedIndex(index: Int) {
        showImage(index: index)
    }
    
    func segmentedProgressBarFinished() {
        if pageIndex == (self.items.count - 1) {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            _ = ContentViewControllerVC.goNextPage(fowardTo: pageIndex + 1)
        }
    }
    
    @objc func tapOn(_ sender: UITapGestureRecognizer) {
        progressBar.skip()
    }
    
    //MARK: - Play or show image
    func showImage(index: NSInteger) {
        self.progressBar.duration = 5
        self.storyImageView.isHidden = false
        self.storyImageView.image = item[index]
    }
    
    
    //MARK: - Button actions
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
