//
//  Task.swift
//  ToDoApp
//
//  Created by mac on 21/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class Task{
    
    var name = ""
    var description=""
    var checked = false
    
    convenience init(_name: String,_description:String)
    {
        self.init()
        self.name = _name
        self.description = _description
    }
}
