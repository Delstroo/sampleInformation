//
//  DetailViewController.swift
//  Thursday Afternoon Project
//
//  Created by Delstun McCray on 7/22/21.
//

import UIKit

protocol detailViewControllerDelegate: AnyObject {
    
}

class DetailViewController: UIViewController {
 
    weak var delegate: detailViewControllerDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    var character: Character?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        guard let character = character else {
            print ("No champ")
            return }
        
        let underlineAttriString = NSAttributedString(string: character.name,
                                                  attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
            nameLabel.attributedText = underlineAttriString
        bioLabel.text = "\(character.bio)"
        characterImage.image = UIImage(named: character.photo)
        }
    }
    

