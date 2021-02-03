//
//  CallsCell.swift
//  Demo2
//
//  Created by PCQ196 on 02/02/21.
//

import UIKit

class CallsCell: UITableViewCell {
    
    @IBOutlet weak var lblPhNum: UILabel!
    @IBOutlet weak var lblTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
