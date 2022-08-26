//
//  TaskTableViewCell.swift
//  ToDo
//
//  Created by 윤승현 on 2022/08/25.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet var lblTodo: UILabel!
    @IBOutlet var btnCheckDone: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
