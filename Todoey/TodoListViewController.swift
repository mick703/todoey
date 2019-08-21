//
//  ViewController.swift
//  Todoey
//
//  Created by Ming Yan on 21/8/19.
//  Copyright © 2019 Ming Yan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath);
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        let cellRow = tableView.cellForRow(at: indexPath)
        if cellRow?.accessoryType == .checkmark {
            cellRow?.accessoryType = .none
        } else {
            cellRow?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

