//
//  TackCell.swift
//  ToDoApp
//
//  Created by mac on 21/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

protocol changeChecked {
    func changeButtonChecked(checked: Bool, index: Int)
    func deleteTask(index: Int)
}

class TackCell: UITableViewCell {
    
    var delegate: changeChecked?
    var indexT: Int?
    var taska :[Task]?

    @IBOutlet weak var checBox: UIButton!
    @IBOutlet weak var taskName: UILabel!
    
    @IBAction func deleteTask(_ sender: Any) {
        delegate?.deleteTask(index: indexT!)
    }
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if taska![indexT!].checked{
            delegate?.changeButtonChecked(checked: false, index:indexT!)
        }
        else{
            delegate?.changeButtonChecked(checked: true, index:indexT!)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
