//
//  TableViewCell.swift
//  Instagram2
//
//  Created by Quintin Frerichs on 3/1/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit
import Parse
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    var post: Post! {
        didSet{
            if post.imageCaption != nil{
                captionLabel.text = post.imageCaption
            }
            else{
                captionLabel.text = ""
            }
            if post.image != nil{
                pictureView.image = post.image
            }
            
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
