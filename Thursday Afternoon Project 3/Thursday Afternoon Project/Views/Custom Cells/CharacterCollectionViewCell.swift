//
//  CharacterCollectionViewCell.swift
//  Thursday Afternoon Project
//
//  Created by Delstun McCray on 7/22/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    var character: Character? {
        didSet {
            displayImageFor()
        }
    }
    
    func displayImageFor() {
        guard let character = character else { return }
        characterImageView.image = UIImage(named: character.photo)
        characterImageView.contentMode = .scaleAspectFill
    }


}
