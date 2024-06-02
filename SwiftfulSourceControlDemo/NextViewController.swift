//
//  NextViewController.swift
//  SwiftfulSourceControlDemo
//
//  Created by Tai Chin Huang on 2024/5/19.
//


/*
 Clone = Copying the repo locally
 Commit = Save ("checkpoint") on our current branch
 Stage = Prepare changes to a commit
 Stash = Save changes for later
 Push = Send local commits to remote repo
 Pull = Fetch remote commits to local repo
 
 COMMIT MESSAGES
 
 NEW FEATURE:
 [Feature] Description of the feature
 
 BUG IN PRODUCTION:
 [Patch] Description of patch
 
 RELEASE:
 [Release] Description of release
 
 BUG NOT IN PRODUCTION:
 [Bug] Fix this bug(Description of the bug)
 
 MUNDANE TASKS:
 [Clean] Description of changes
 
 */

import UIKit

class NextViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!!!!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var clickMeButton: UIButton = {
        var config = UIButton.Configuration.tinted()
        config.title = "Click Me!"
        config.image = UIImage(systemName: "pencil")
        config.buttonSize = .medium
        config.imagePadding = 5
        config.imagePlacement = .leading
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var vStackView = UIStackView(arrangedSubviews: [clickMeButton])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        view.addSubview(vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        vStackView.axis = .vertical
        vStackView.spacing = 5
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
