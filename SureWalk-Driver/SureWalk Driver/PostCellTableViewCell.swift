//
//  PostCellTableViewCell.swift
//  SureWalk Driver
//
//  Created by Rohan Trivedi on 4/3/17.
//  Copyright © 2017 Rohan Trivedi. All rights reserved.
//

import UIKit
import ParseUI

class PostCellTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    var request: PFObject!
    {
        didSet
        {
            let rider = request["rider"] as! PFUser
            let firstName = rider["firstName"] as? String
            let lastName = rider["lastName"] as? String
            self.nameLabel.text = firstName! + " " + lastName!
            
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
