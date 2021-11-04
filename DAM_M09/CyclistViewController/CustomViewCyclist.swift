//
//  CustomViewCyclist.swift
//  DAM_M09
//
//  Created by Artur Viader Mataix on 10/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit

class CustomViewCyclist: UITableViewCell {
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var lnombre: UILabel!
    @IBOutlet weak var llider: UILabel!
    @IBOutlet weak var lpopularidad: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
