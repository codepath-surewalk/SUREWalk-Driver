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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var request: PFObject!
    {
        didSet
        {
            //set name
            let rider = request["rider"] as! PFUser
            let firstName = rider["firstName"] as? String
            let lastName = rider["lastName"] as? String
            self.nameLabel.text = firstName! + " " + lastName!
            // set date
            let date = request["date"] as? String
            self.dateLabel.text = date
            //set time
            let time = request["time"] as? String
            self.timeLabel.text = time
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
