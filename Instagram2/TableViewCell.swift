//
//  TableViewCell.swift
//  Instagram2
//
//  Created by Quintin Frerichs on 3/1/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit
import Parse
import ParseUI
class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var pictureView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
        var post: PFObject! {
        didSet {
        self.pictureView.file = post["image"] as? PFFile
        self.pictureView.loadInBackground()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
