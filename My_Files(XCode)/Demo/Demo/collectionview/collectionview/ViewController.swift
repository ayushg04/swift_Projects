//
//  ViewController.swift
//  collectionview
//
//  Created by daffolapmac-179 on 26/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You have tapped me")
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: UIImage(named: "image")!)
        return cell
    }
}

