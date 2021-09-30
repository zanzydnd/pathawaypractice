//
//  CustomStoriesCell.swift
//  Home
//
//  Created by Montypass on 20.09.2021.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    var data: StoryDetailsData? {
        didSet {
            guard let data = data else {return}
            bg.image = data.image
        }
    }

    fileprivate let bg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "toDo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
