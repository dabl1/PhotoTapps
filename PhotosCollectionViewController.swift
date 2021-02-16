//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Nikolay Ustinov on 15.02.2021.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["drift1",
                  "drift2",
                  "drift3",
                  "drift4",
                  "drift5",
                  "drift6",
                  "drift7",
                  "drift8",
                  "drift9",
                  "drift10"
                  ,"drift11",
                  "drift12",
    ]
    
    
    let itemPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //        layout.itemSize = CGSize(width: 70, height: 70)
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //        layout.minimumLineSpacing = 1
        //        layout.minimumInteritemSpacing = 1
        //        layout.scrollDirection = .vertical
        //
        //        collectionView.showsVerticalScrollIndicator = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.driftImageView.image  
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.driftImageView.image = image
        
        // Configure the cell
        
        return cell
    }
    
    
}

extension PhotosCollectionViewController : UICollectionViewDelegateFlowLayout {
    //размеры коллекций
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //формулы для расчета , чтобы растояние между коллекциями были везде одинкаовыми
        let paddingWidht = sectionInserts.left * (itemPerRow + 1)
        let availableWeidht = collectionView.frame.width - paddingWidht
        let widhtPerItem = availableWeidht / itemPerRow
        return CGSize(width: widhtPerItem, height: widhtPerItem)
    }
    //отступы коллекций
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    //растояние между линиями
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
}


