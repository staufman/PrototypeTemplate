//
//  PrototypeTableView.swift
//  PrototypeTemplate
//
//  Created by Salil Apte on 11/1/15.
//  Copyright © 2015 Salil Apte. All rights reserved.
//

import UIKit

class PrototypeTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var tableRows = Array<Array<String>>()
    var tableRow : String = "" {
        didSet {
            let components = self.tableRow.componentsSeparatedByString(":")
            assert(components.count == 3, "You have improperly defined a tableRow property in IB. The format should be <section>:<row>:cellIdentifier")
            if let section = Int(components[0]), row = Int(components[1]) {
                let cellId = components[2]
                if (tableRows.count <= section) {
                    tableRows.insert(Array<String>(), atIndex: section)
                }
                tableRows[section].insert(cellId, atIndex: row)
            }
        }
    }

    override func awakeFromNib() {
        // make our rows self-sizing
        //self.estimatedRowHeight = 44.0
        //self.rowHeight = UITableViewAutomaticDimension
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
    
    // pragma mark UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.tableRows.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableRows[section].count
    }
    
    // pragma mark UITableViewDelegate
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.tableRows[indexPath.section][indexPath.row], forIndexPath: indexPath)
        return cell
        
    }
    
}
