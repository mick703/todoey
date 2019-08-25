//
//  TodoItem.swift
//  Todoey
//
//  Created by Ming on 25/8/19.
//  Copyright © 2019 Ming Yan. All rights reserved.
//

import Foundation

class TodoItem {
    var title: String = ""
    var isDone: Bool = false
    
    init(title: String = "", isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
    
    
}
