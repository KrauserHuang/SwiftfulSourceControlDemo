//
//  ViewController.swift
//  SwiftfulSourceControlDemo
//
//  Created by Tai Chin Huang on 2024/5/19.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Swiftful Thinking!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Click me!"
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var vStackView = UIStackView(arrangedSubviews: [contentImageView, titleLabel, button])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        vStackView.axis = .vertical
        vStackView.spacing = 5
    }
}

