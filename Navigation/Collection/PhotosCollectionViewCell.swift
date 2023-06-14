//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Admin on 27.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

protocol CellConfigDelegate: AnyObject {
    func  creatingFrameForCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var indexPathForCell = IndexPath()
    weak var delegating: CellConfigDelegate?
    
    
    private let imagesForPostView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        custmizeCell()
        addSubviews()
        setupConstraints()
        addGesture()
    }
    
    private func addSubviews(){
        contentView.addSubview(imagesForPostView)
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private func custmizeCell() {
           contentView.backgroundColor = .white
    }
    
    func setupCell(model: ImagesForPost) {
        imagesForPostView.image = UIImage(named: model.pictures)
       }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathForCell = indexPath
    }
    
       
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImageinCell))
        imagesForPostView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapImageinCell() {
        
        
        delegating?.creatingFrameForCell(imagesForPostView.image, frameImage: imagesForPostView.frame, indexPath: indexPathForCell)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imagesForPostView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagesForPostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagesForPostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imagesForPostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
    }
    
    
}
