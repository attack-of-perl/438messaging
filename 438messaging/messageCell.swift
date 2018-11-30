//
//  messageTableViewCell.swift
//  438messaging
//
//  Created by Zachary Perlman on 11/30/18.
//  Copyright © 2018 Zachary Perlman. All rights reserved.
//

import UIKit

class messageCell: UITableViewCell {
    @IBOutlet var messageName: UILabel!
    @IBOutlet var messageContent: UILabel!
    
    var name:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        print(detailTextLabel?.text)
//        messageName.text = self.detailTextLabel?.text
//        messageContent.text = self.textLabel?.text
//        textLabel?.isHidden = true
    }

}
