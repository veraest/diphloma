//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Admin on 03.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

protocol NewLikesDelegate: AnyObject {
    func addLikes(for model: inout[Post], indexPath: IndexPath)
}
class PostTableViewCell: UITableViewCell {
    
    weak var delegate: NewLikesDelegate?
    private var indexPathCell = IndexPath()
    static let identifier: String = "PostTableViewCell"
    
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 17)
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .blue
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.isUserInteractionEnabled = true
        return label
    }()
    
    //MARK: - Override
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        tapToAddLikes()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        authorLabel.text = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    private func setupUI() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(likesLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            viewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func configure(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "♥ : \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func tapToAddLikes() {
        let tapForLikes = UITapGestureRecognizer(target: self, action: #selector(tapLikes))
        likesLabel.addGestureRecognizer(tapForLikes)
        
        
    }
    
    @objc func tapLikes()   {
        
        delegate?.addLikes(for: &model, indexPath: indexPathCell)
        likesLabel.text = "♥ : " + String(model[indexPathCell.row].likes)
        
        if model[indexPathCell.row].isLiked == true {
            likesLabel.textColor = .red
        }
        if model[indexPathCell.row].isLiked == false {
            likesLabel.textColor = .gray
        }
    }
    
}
