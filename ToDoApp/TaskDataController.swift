//
//  TaskDataController.swift
//  ToDoApp
//
//  Created by mac on 21/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit



class TaskDataController: UIViewController{

    

    @IBOutlet weak var taskeChecked: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskIndex: UILabel!
    @IBOutlet weak var descriptionText: UITextView!

    
    var _name:String?
    var currentTask:Task?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text=currentTask?.name
        descriptionText.text=currentTask?.description
        if (currentTask?.checked)!
        {
            taskeChecked.text="Wykonano"
            button.setBackgroundImage(#imageLiteral(resourceName: "checked-box"), for: UIControlState.normal)
        }
        else{
            taskeChecked.text = "Czeka na wykonanie"
            button.setBackgroundImage(#imageLiteral(resourceName: "blank-check-box"), for: UIControlState.normal)
        }


    }

}
