//
//  ViewController.swift
//  Todoey
//
//  Created by Ming Yan on 21/8/19.
//  Copyright © 2019 Ming Yan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray: Array<TodoItem> = Array()
    
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for n in 1...10 {
            let newItem = TodoItem()
            newItem.title = "Send Henry to school \(n)"
            itemArray.append(newItem)
        }

        
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [TodoItem] {
//            itemArray = items
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath);
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.isDone == true ? .checkmark: .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addTodoButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newTodoItem = TodoItem(title: textField.text!, isDone: false)
//            newTodoItem.title = textField.text!
//            newTodoItem.isDone = false
            
            self.itemArray.append(newTodoItem)
//            self.defaults.set(self.itemArray, forKey: "TodoListArray")
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

