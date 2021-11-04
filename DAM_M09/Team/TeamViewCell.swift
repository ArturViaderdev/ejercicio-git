//
//  TeamViewCell.swift
//  
//
//  Created by dam on 04/02/2020.
//

import UIKit

class TeamViewCell: UITableViewCell {
    @IBOutlet var manager: UILabel!
    @IBOutlet var pais: UILabel!
    @IBOutlet var nombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   //io
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
