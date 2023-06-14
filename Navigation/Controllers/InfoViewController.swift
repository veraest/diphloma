//
//  InfoViewController.swift
//  Navigation
//
//  Created by Admin on 13.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "Info"
        
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        
                    
        let button = UIButton(type: .system)
        button.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 60, height: 30))
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(alertAppear), for: .touchUpInside)
       
        
    }
    
      
    @objc func alertAppear(controller: UIViewController) {
                
        let alert = UIAlertController(title: "Alert", message: "Please Select an Option", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Approve", style: .default, handler: { (_) in
                    print("User click Approve button")
            }))

            alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (_) in
                    print("User click Edit button")
            }))

            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
                    print("User click Delete button")
            }))

            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
                    print("User click Dismiss button")
            }))

        self.present(alert, animated: true, completion: {
                print("completion block")
            })
    }
}
