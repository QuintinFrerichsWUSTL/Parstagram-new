//
//  Post.swift
//  Instagram2
//
//  Created by Quintin Frerichs on 3/2/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit
import Parse
class Post: NSObject {
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        let post = PFObject(className: "Post")
        post["media"] = getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        post["caption"] = caption
        post["likesCount"] = 0
        post["commentsCount"] = 0
        post.saveInBackgroundWithBlock(completion)
    }
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
}
