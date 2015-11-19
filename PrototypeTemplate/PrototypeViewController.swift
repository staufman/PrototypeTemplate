//
//  PrototypeViewController.swift
//  PrototypeTemplate
//
//  Created by Salil Apte on 10/30/15.
//  Copyright © 2015 Salil Apte. All rights reserved.
//

import UIKit

class PrototypeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // remove all empty cells from the table
        self.tableView?.tableFooterView = UIView();
    }
}

