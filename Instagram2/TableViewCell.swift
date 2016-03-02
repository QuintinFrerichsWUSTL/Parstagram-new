//
//  TableViewCell.swift
//  Instagram2
//
//  Created by Quintin Frerichs on 3/1/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
