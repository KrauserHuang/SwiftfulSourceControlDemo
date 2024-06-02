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
        imageView.image = UIImage(systemName: "globe")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Swiftful Thinking!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var clickMeButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe!"
        config.image = UIImage(systemName: "globe")
        config.imagePadding = 5
        config.imagePlacement = .leading
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var vStackView = UIStackView(arrangedSubviews: [titleLabel, clickMeButton])
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Int>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Int>
    private lazy var dataSource = makeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        vStackView.axis = .vertical
        vStackView.spacing = 5
        
        // home_analytics
        updateSnapshot()
    }
    
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UICollectionViewListCell
            var content = cell.defaultContentConfiguration()
            content.text = "Item \(itemIdentifier)"
            cell.contentConfiguration = content
            return cell
        }
        
        return dataSource
    }
    
    private func updateSnapshot() {
        var snapshot = Snapshot()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0...20), toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ViewController {
    enum Section {
        case main
    }
}
