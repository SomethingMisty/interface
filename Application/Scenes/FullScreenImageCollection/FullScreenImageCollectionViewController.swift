//
//  FullScreenImageCollectionViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//
import Foundation
import UIKit


class FullScreenImageCollectionViewController: UICollectionViewController {
    
    var currentPhoto: UIImage!
   
   
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//       
//    }
//    
    
    
    private var reuseID = "FullScreenImageCollectionViewCell"
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as? FullScreenImageCollectionViewCell else {
            fatalError("{Message: Error in dequeue FriendTableViewCell}")
        }
        
        cell.likeButtonOutlet.setImage(UIImage(systemName: "heart"), for: .normal)
        cell.likeButtonOutlet.setTitle("0", for: .normal)
        cell.likeButtonOutlet.addTarget(self, action: #selector(tapLikeChanger(_:)), for: .touchUpInside)
        
      
        cell.imageFull.image = currentPhoto
        return cell
    }
    
    @objc func tapLikeChanger(_ sender: UIButton){
        if sender.image(for: .normal) == UIImage(systemName: "heart") {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            sender.setTitle("1", for: .normal)
        }else if sender.image(for: .normal) == UIImage(systemName: "heart.fill")  {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            sender.setTitle("0", for: .normal)
        }
    }
}

