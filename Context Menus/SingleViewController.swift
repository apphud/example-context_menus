//
//  SingleViewController.swift
//  Context Menus
//
//  Created by Denis Minnetdinov on 11/06/2019.
//  Copyright © 2019 Apphud. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let interaction = UIContextMenuInteraction(delegate: self)
        imageView.addInteraction(interaction)
    }
    
    func saveButtonTapped() {
        print("Save tapped")
    }
    
    func rotateButtonTapped() {
        
    }
    
    func deleteButtonTapped() {
        
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SingleViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
            // Creating Save button
            let save = UIAction(title: "Save", image: UIImage(systemName: "tray.and.arrow.down.fill"), identifier: .init("save")) { action in
                // Just showing some alert
                self.showAlert(title: action.title)
            }

            // Creating Rotate button
            let rotate = UIAction(title: "Rotate", image: UIImage(systemName: "arrow.counterclockwise"), identifier: UIAction.Identifier(rawValue: "rotate")) { action in
                self.showAlert(title: action.title)
            }
            // Creating Delete button
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash.fill"), identifier: UIAction.Identifier(rawValue: "delete")) { action in
                self.showAlert(title: action.title)
            }
            // Creating Edit, which will open Submenu
            let edit = UIMenu(title: "Edit...", children: [rotate, delete])
            
            // Creating main context menu
            return UIMenu(title: "Menu", children: [save, edit])
        }
        return configuration
    }
}
