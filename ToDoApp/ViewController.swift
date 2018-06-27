//
//  ViewController.swift
//  ToDoApp
//
//  Created by mac on 21/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask,changeChecked{
    
    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []
    var currentTask:Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks.append(Task(_name: "Testowy todo",_description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."))
        tasks.append(Task(_name: "Testowy todo1",_description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."))
        tasks.append(Task(_name: "Testowy todo2",_description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TackCell
        cell.taskName.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].checked
        {
            cell.checBox.setBackgroundImage(#imageLiteral(resourceName: "checked-box"), for: UIControlState.normal)
        } else{
            cell.checBox.setBackgroundImage(#imageLiteral(resourceName: "blank-check-box"), for: UIControlState.normal)
        }
        cell.delegate=self
        cell.indexT = indexPath.row
        cell.taska = tasks
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentTask=tasks[indexPath.row]
        performSegue(withIdentifier: "extensionData", sender: self)
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddTaskController
        {
            let vc = segue.destination as! AddTaskController
            vc.delegate = self
        }
        if segue.destination is TaskDataController
        {
            let vc = segue.destination as? TaskDataController
            vc?.currentTask = currentTask
        }
    }
    
    
    
    func addTask(_name: String,_description:String) {
        tasks.append(Task(_name: _name,_description: _description))
        tableView.reloadData()
    }
    
    func changeButtonChecked(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }
    
    func deleteTask(index: Int) {
        tasks.remove(at: index)
        tableView.reloadData()
    }
    
    @IBAction func checkAllTaska(_ sender: Any) {
        for i in 0 ..< tasks.count
        {
            if !tasks[i].checked
            {
                tasks[i].checked=true
            }
        }
        tableView.reloadData()
    }

    @IBAction func uncheckAllTasks(_ sender: Any) {
        for i in 0 ..< tasks.count
        {
            if tasks[i].checked
            {
                tasks[i].checked=false
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func removeAllCheckedTasks(_ sender: Any) {
        var i=0;
        for t in tasks
        {
            if t.checked
            {
                tasks.remove(at: i)
                i-=1
            }
            i+=1;
        }
        tableView.reloadData()
    }


}

