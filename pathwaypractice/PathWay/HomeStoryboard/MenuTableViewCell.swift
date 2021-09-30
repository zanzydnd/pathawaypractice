//
//  MenuTableViewCell.swift
//  Home
//
//  Created by Montypass on 20.09.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    var menu: Menu? {
        didSet {
            guard let menuItem = menu else {return}
            
            if let heading = menuItem.heading {
                headingLabel.text = heading
            }
            
            if let info = menuItem.info {
                infoDetailedLabel.text = info
            }
            
            if let image = menuItem.image {
                cellImageView.image = image
            }
        }
    }
    
    let cellImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        
        image.layer.shadowColor = UIColor.darkGray.cgColor
        image.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        image.layer.shadowRadius = 3.0
        image.layer.shadowOpacity = 1.0

        return image
    }()
    
    let headingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoDetailedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.8929251269, green: 0.8785680128, blue: 0.8556993951, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false

        
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellImageView)
        containerView.addSubview(headingLabel)
        containerView.addSubview(infoDetailedLabel)
        self.contentView.addSubview(containerView)
        
        cellImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.cellImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        headingLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        headingLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        headingLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        
        infoDetailedLabel.topAnchor.constraint(equalTo: self.headingLabel.bottomAnchor).isActive = true
        infoDetailedLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        infoDetailedLabel.topAnchor.constraint(equalTo: self.headingLabel.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
