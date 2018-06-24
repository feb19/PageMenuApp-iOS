//
//  ListViewController.swift
//  PageMenuApp
//
//  Created by Nobuhiro Takahashi on 2018/06/24.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "hgoehoge"
        return cell!
    }
    
}
