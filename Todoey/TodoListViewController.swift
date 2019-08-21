//
//  ViewController.swift
//  Todoey
//
//  Created by Ming Yan on 21/8/19.
//  Copyright © 2019 Ming Yan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["One", "Two", "Three"]
    
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
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

    @IBAction func addTodoButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (uiTextField) in
            uiTextField.placeholder = "Create a new item"
            textField = uiTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true) 
    }
}

