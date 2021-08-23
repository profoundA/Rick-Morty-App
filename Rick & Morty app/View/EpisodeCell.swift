//
//  EpisodeCell.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 18.08.2021.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 1, right: 10))
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 12
    }
}
