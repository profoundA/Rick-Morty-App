//
//  SecondViewController.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var detailed: Result?

    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var firstSeenLabel: UILabel!
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = detailed?.name
        statusLabel.text = detailed?.status.rawValue
        speciesLabel.text = "\(detailed?.species.rawValue ?? "")(\(detailed?.gender.rawValue ?? ""))"
        locationLabel.text = detailed?.location.name
        characterImage.setImage(imageUrl: detailed?.image ?? "")
        
        switch detailed?.status {
        
        case .alive:
            statusImage.tintColor  = .systemGreen
        case .dead:
            statusImage.tintColor = .systemRed
        case .unknown:
            statusImage.tintColor = .systemOrange
        case .none:
            break
        }
    }
    
    
    
    
    
}
