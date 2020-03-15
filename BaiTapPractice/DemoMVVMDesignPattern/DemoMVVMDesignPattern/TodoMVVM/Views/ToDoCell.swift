//
//  ToDoCell.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var nameTask: UILabel!
    @IBOutlet weak var notesTask: UILabel!
    
    var todo: ToDo? {
        didSet {
            if let todo = todo {
                nameTask.text = todo.task
                notesTask.text = todo.notes
                if todo.completed {
                    accessoryType = .checkmark
                    nameTask.attributedText = strikeThrough(text: todo.task)
                    notesTask.attributedText = strikeThrough(text: todo.notes)
                } else {
                    accessoryType = .none
                }
            }
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
    
    private func strikeThrough(text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    

}
