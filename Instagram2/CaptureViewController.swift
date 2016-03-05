//
//  CaptureViewController.swift
//  Instagram2
//
//  Created by Quintin Frerichs on 3/1/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit
import Parse
import ParseUI 
class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var captionLabel: UITextField!
    var caption: String?
    var pickedImage: UIImage?
    var originalImage: UIImage?
    var editedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSubmit(sender: AnyObject) {
        caption = captionLabel.text 
        Post.postUserImage(editedImage, withCaption: caption) { (boolean: Bool, error: NSError?) -> Void in
            
        }
        
    }

    @IBAction func onPick(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }
   func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
            if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
                pictureView.contentMode = .ScaleAspectFit
                pictureView.image = pickedImage
               
            }
            
            dismissViewControllerAnimated(true, completion: nil)
    }
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
