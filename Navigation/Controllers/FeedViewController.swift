//
//  FeedViewController.swift
//  Navigation
//
//  Created by Admin on 12.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
        override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        
                    
        let button = UIButton(type: .system)
        button.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 320, height: 30))
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
       
        
    }
    
    

    @objc func buttonAction () {
        
        let postViewController = PostViewController()
               
        self.navigationController?.pushViewController(postViewController, animated: true)
        
        //postViewController.titlePost = post.title
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
