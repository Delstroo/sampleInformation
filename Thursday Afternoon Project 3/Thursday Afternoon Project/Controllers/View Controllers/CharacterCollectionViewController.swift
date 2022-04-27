//
//  CharacterCollectionViewController.swift
//  Thursday Afternoon Project
//
//  Created by Delstun McCray on 7/22/21.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {

    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

      updateViews()

    }

    func updateViews() {
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CharacterController.character.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell() }
      
        let character = CharacterController.character[indexPath.row]
        
        cell.character = character
        cell.backgroundColor = .red
        
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            guard let cell = sender as? CharacterCollectionViewCell,
                  let indexPath = collectionView.indexPath(for: cell),
                  let destinationVC = segue.destination as?
                    DetailViewController else { return }
            let characterToSend = CharacterController.character[indexPath.row]
            destinationVC.character = characterToSend
        

            
        }
        
    }
        
        }
    
    // MARK: UICollectionViewDelegate
extension CharacterCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width * 0.90
        
        return CGSize(width: width, height: width * 3 / 5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let oneCellWidth = view.frame.width * 0.90
        
        let cellsTotalWidth = oneCellWidth * 1
        
        let leftOverWidth = view.frame.width - cellsTotalWidth
        
        let inset = leftOverWidth / 3
        
        return UIEdgeInsets(top: inset, left: inset, bottom: 0, right: inset)
    }
}
    

