//
//  CharacterCell.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
//

import UIKit

class CharacterCell: UITableViewCell {

    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 6, bottom: 7, right: 6))
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 10
    }
  
    
    
}
