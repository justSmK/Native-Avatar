//
//  ViewController.swift
//  Native Avatar
//
//  Created by Sergei Semko on 5/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let sizeOfImage: CGFloat = 36
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray5
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(systemName: "person.crop.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGray
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Avatar"
        
        view.addSubview(scrollView)
        scrollView.contentSize = .init(width: view.frame.width, height: 2000)
        scrollView.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view = scrollView
    
        imageView.contentMode = .scaleAspectFill
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let subviews = navigationController?.navigationBar.subviews else {
            return
        }
        
        for subview in subviews {
            if let label = subview.subviews.first(where: { $0 is UILabel }) {
                subview.addSubview(imageView)
                
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: sizeOfImage),
                    imageView.widthAnchor.constraint(equalToConstant: sizeOfImage),
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16),
                    imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor)
                ])
            }
        }
    }

}


extension ViewController: UIScrollViewDelegate {
    
}
