//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Nikolay Ustinov on 16.02.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    @IBAction func shareAction(_ sender: Any) {
        let sharedController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        sharedController.completionWithItemsHandler = {
            _, bool, _, _ in
            if bool {
                print("yspex")
            }
        }
       
        present(sharedController, animated: true, completion: nil)
    }
    
    
    var image: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = image
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
