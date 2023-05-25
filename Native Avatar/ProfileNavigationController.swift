//
//  ProfileNavigationController.swift
//  Native Avatar
//
//  Created by Sergei Semko on 5/22/23.
//

import UIKit

open class ProfileNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    let avatarImage = UIImageView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        avatarImage.image = .init(systemName: "person.crop.circle.fill")
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.tintColor = .systemGray3

        delegate = self
    }

    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        let navBar = navigationBar
        navBar.subviews.forEach { subview in
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            guard stringFromClass.contains("UINavigationBarLargeTitleView") else { return }
            
            if avatarImage.superview != subview {
                avatarImage.removeFromSuperview()
                subview.addSubview(avatarImage)
            }
            
            avatarImage.translatesAutoresizingMaskIntoConstraints = false
            avatarImage.removeConstraints(avatarImage.constraints)
            
            avatarImage.widthAnchor.constraint(equalToConstant: 36).isActive = true
            avatarImage.heightAnchor.constraint(equalToConstant: 36).isActive = true
            avatarImage.bottomAnchor.constraint(equalTo: avatarImage.superview!.bottomAnchor, constant: -10).isActive = true
            avatarImage.trailingAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
            
        }
    }
}

