//
//  TableViewController.swift
//  Context Menus
//
//  Created by Denis Minnetdinov on 11/06/2019.
//  Copyright © 2019 Apphud. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    static func controller() -> PreviewViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        return controller
    }
}

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row " + String(indexPath.row)
        return cell
    }
    
    // MARK: -UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: { () -> UIViewController? in
            return PreviewViewController.controller()
        }) { _ -> UIMenu? in
            let action = UIAction(title: "Custom action", image: nil, identifier: UIAction.Identifier(rawValue: "custom identifier")) { action in
                self.showAlert(title: action.title)
            }
            return UIMenu(title: "Menu", children: [action])
        }
        return configuration
    }
    
}


