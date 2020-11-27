//
//  CollectionViewController.swift
//  Context Menus
//
//  Created by Denis Minnetdinov on 11/06/2019.
//  Copyright © 2019 Apphud. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: -UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //Just generating some random color
        cell.contentView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        
        return cell
    }

    // MARK: -UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
            let action = UIAction(title: "Archive", image: UIImage(systemName: "archivebox.fill"), identifier: UIAction.Identifier(rawValue: "archive")) { action in
                let alert = UIAlertController(title: action.title, message: nil, preferredStyle: .alert)
                alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            return UIMenu(title: "Menu", children: [action])
        }
        return configuration
    }

}



