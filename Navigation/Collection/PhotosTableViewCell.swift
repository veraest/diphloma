//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Admin on 26.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    let newView: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Photos"
        return label
    }()
    
    let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var firstImage: UIImageView!
    var secondImage: UIImageView!
    var thirdImage: UIImageView!
    var fourthImage: UIImageView!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstains()
        
        
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
}
    
    let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "3")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "4")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private func addSubviews() {
        contentView.addSubview(newView)
        contentView.addSubview(topLabel)
        contentView.addSubview(arrowImage)
        contentView.addSubview(firstImageView)
        contentView.addSubview(secondImageView)
        contentView.addSubview(thirdImageView)
        contentView.addSubview(fourthImageView)
    }
    
    let photosViewController = {
        PhotosViewController()
    }
    
    
    private func setupConstains() {
        
        NSLayoutConstraint.activate([
            
            newView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            topLabel.topAnchor.constraint(equalTo: newView.topAnchor, constant: Metric.labelInset),
            topLabel.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: Metric.labelInset),
            
            arrowImage.widthAnchor.constraint(equalToConstant: Metric.arrowImageInsert),
            arrowImage.centerYAnchor.constraint(equalTo: topLabel.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -12),
            
            firstImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            firstImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            firstImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: Metric.imageInset),
            firstImageView.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -Metric.imageInset),
            firstImageView.leadingAnchor.constraint(equalTo:newView.leadingAnchor,constant: Metric.imageInset),
            
            secondImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            secondImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            secondImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: Metric.imageInset),
            secondImageView.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -Metric.imageInset),
            secondImageView.leadingAnchor.constraint(equalTo: firstImageView.trailingAnchor,constant: Metric.imageInset),
            
                      
            thirdImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            thirdImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            thirdImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: Metric.imageInset),
            thirdImageView.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -Metric.imageInset),
            thirdImageView.leadingAnchor.constraint(equalTo: secondImageView.trailingAnchor,constant: Metric.imageInset),
            
            fourthImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            fourthImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            fourthImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: Metric.imageInset),
            fourthImageView.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -Metric.imageInset),
            fourthImageView.leadingAnchor.constraint(equalTo: thirdImageView.trailingAnchor,constant: Metric.imageInset),
        
            ])
    }
    
  enum Metric {
      static let labelInset: CGFloat = 12
      static let imageInset: CGFloat = 12
      static let imageLeftInset: CGFloat = 8
      static let arrowImageInsert: CGFloat = 30
      
  }
  
}

            

