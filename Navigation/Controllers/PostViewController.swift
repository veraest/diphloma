//
//  PostViewController.swift
//  Navigation
//
//  Created by Admin on 13.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta

        barButtonItem()
        title = "Мой пост"
    }
    private func barButtonItem() {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapBarButton))
        navigationItem.rightBarButtonItem = barButtonItem
    }
        
    @objc private func tapBarButton() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


