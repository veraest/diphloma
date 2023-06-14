//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Admin on 12.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

var model = Post.makeModel()

class ProfileViewController: UIViewController,  NewLikesDelegate {
    
    
    
     private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: .zero, style: .grouped)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.rowHeight = UITableView.automaticDimension
             tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileTableHeaderView")
             tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
             tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
            tableView.delegate = self
            tableView.dataSource = self
            return tableView
       }()

    //MARK: - Override
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupTableView()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    private func setupTableView() {
        view.addSubview(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        }
    }

extension ProfileViewController:  UITableViewDataSource, UITableViewDelegate{
    
        func numberOfSections(in tableView: UITableView) -> Int {
            2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return 1
            } else {
                return  model.count
            }
        }
            
            
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if indexPath.section == 0  {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
                return cell
                
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                cell.configure(model: model[indexPath.row])
                cell.delegate = self
                cell.setIndexPath(indexPath)
                return cell
            }
            return UITableViewCell()
        }
            
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section == 0 {
                navigationController?.pushViewController(PhotosViewController(), animated: true)
            }
            else if indexPath.section == 1 {
                model[indexPath.row].views += 1
                let modelPostViewController = ModelPostViewController()
                modelPostViewController.setupData(model: model[indexPath.row])
                tableView.reloadData()
                present(modelPostViewController, animated: true)
            }
        }
      
        

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileTableHeaderView") as! ProfileTableHeaderView
                return header
        } else {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 200
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else {
            return UITableView.automaticDimension
        }
    }
    
    
}

extension ProfileViewController {
    
    
    
    func addLikes(for model: inout[Post], indexPath: IndexPath) {
        if model[indexPath.row].isLiked == false {
            model[indexPath.row].likes += 1
            model[indexPath.row].isLiked = true
            return
        }
        if model[indexPath.row].isLiked == true {
            model[indexPath.row].likes -= 1
            model[indexPath.row].isLiked = false
            return
        }
    }
}
