//
//  ScrollController.swift
//  Native Avatar
//
//  Created by Sergei Semko on 5/24/23.
//

import UIKit

class ScrollController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Avatar"
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = .init(width: view.frame.width, height: 2000)

        view.addSubview(scrollView)
        view = scrollView
//        NSLayoutConstraint.activate([
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
    }
    
}
