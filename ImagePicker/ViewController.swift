//
//  ViewController.swift
//  ImagePicker
//
//  Created by TomerBu on 26/10/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //gesture recognizer from ib
    //action from tap.
    //don't forget user interaction enabled.
    @IBOutlet weak var btnDone: UIButton!
    
    @IBOutlet weak var titleText: UITextField!
    @IBAction func save(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(titleText.text, forKey: "myProfileImagetitle") //save String to disk.
        guard let data = UIImageJPEGRepresentation(imageView.image!, 1) else {return}
        
        userDefaults.set(data, forKey: "userImage")
        
        
        //Any Not for custom Objects.
        //Data Binary
        //String (Json!)
        //dates
        //dictionaries and arrays.
        
    }
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            let gestureRec = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
            
            imageView.addGestureRecognizer(gestureRec)
        }
    }
    
    @objc func tapped(sender: UITapGestureRecognizer){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary //
        
        
        picker.delegate = self
        
        present(picker, animated: true)
       //camera
       //photos
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //got photo!
        
        print(info)
        
        guard let img = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = img
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
