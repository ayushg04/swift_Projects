//
//  TableViewCell.swift
//  TableApp
//
//  Created by daffolapmac-179 on 26/10/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var txtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
