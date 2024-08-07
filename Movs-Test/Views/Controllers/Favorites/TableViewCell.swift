//
//  TableViewCell.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 05-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textDate: UILabel!
    @IBOutlet weak var textDescp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
