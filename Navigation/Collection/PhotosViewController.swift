//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Admin on 26.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class PhotosViewController:  UIViewController {
    
    private var imageRect: CGRect = .zero
        
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical


        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray2
        
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let imagesForPost = ImagesForPost.postModel()
    
    private let halfTransparentCollectionView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.alpha = 0
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 42, y: 115, width: 35, height: 35))
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
     
        return button
    }()
    
    private let animatedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Photo Gallary"
            view.backgroundColor = .white
            navigationController?.navigationBar.isHidden = false

        collectionView.reloadData()
        addSubviews()
        setupConstrains()
            
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
        
        
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
        ])
    }
    
    private func createAnimationForImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(closeButton)
        view.addSubview(halfTransparentCollectionView)
        view.addSubview(animatedImageView)
        animatedImageView.image = image
        animatedImageView.frame = CGRect(x: imageFrame.origin.x,
                                         y: imageFrame.origin.y,
                                         width: imageFrame.width,
                                         height: imageFrame.height)
        
       
        animatedImageView.alpha = 1.0
        
        
        halfTransparentCollectionView.addSubview(closeButton)
        
        UIView.animate(withDuration: 0.5) {
            self.halfTransparentCollectionView.alpha = 1
            self.animatedImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatedImageView.center = self.view.center
            self.animatedImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
            
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.closeButton.alpha = 1
                self.animatedImageView.layer.cornerRadius = 0
            }
        }
    }
    
    private func removeAnimation(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.halfTransparentCollectionView.alpha = 0
            self.animatedImageView.frame = rect
            
        } completion: { _ in
            self.animatedImageView.removeFromSuperview()
            self.closeButton.alpha = 0
            self.halfTransparentCollectionView.removeFromSuperview()
        }
    }
    
    @objc private func tapCloseButton() {
        removeAnimation(rect: imageRect)
        closeButton.removeFromSuperview()
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesForPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        
        cell.setupCell(model: imagesForPost[indexPath.row])
        cell.delegating = self
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
private var inset: CGFloat { return 8}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let width = (collectionView.bounds.width - inset * 4) / 3
         return CGSize(width: width, height: width)
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         inset
     }
    
    
    
}

extension PhotosViewController: CellConfigDelegate {
    func creatingFrameForCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        let attributesSuperView = collectionView.convert(attributes?.frame ?? .zero, to: collectionView.superview)
        imageRect = CGRect(x: frameImage.origin.x + attributesSuperView.origin.x,
                                         y: frameImage.origin.y + attributesSuperView.origin.y,
                            width: frameImage.width,
                            height: frameImage.height)
               
        createAnimationForImage(image, imageFrame: imageRect)
        
        
        print("Done")
        
        
    }
    
}
