//
//  SecondViewController.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var detailed: Result?
    
    @IBOutlet weak var secondTable: UITableView!
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var firstSeenLabel: UILabel!
    
    var episodesArray: [String] = []
    var episodeName: [String] = []
    var episodeNumber: [String] = []
    
    let load = EpisodesNetworking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateview()
        load.episodeDelegate = self
        
        for i in episodesArray {
            load.loadEpisodes(url: i)
            print(i)
        }
    }
    
    func updateview() {
        
        nameLabel.text = detailed?.name
        statusLabel.text = detailed?.status.rawValue
        speciesLabel.text = "\(detailed?.species ?? "")(\(detailed?.gender ?? ""))"
        locationLabel.text = detailed?.origin.name
        characterImage.setImage(imageUrl: detailed?.image ?? "")
        
        switch detailed?.status {
        
        case .alive:
            statusImage.tintColor  = .systemGreen
        case .dead:
            statusImage.tintColor = .systemRed
        case .unknown:
            statusImage.tintColor = .systemOrange
        default: break
        }
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodeName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell") as! EpisodeCell
       
        cell.episodeLabel.text = episodeName[indexPath.row]
        cell.episodeNumberLabel.text = episodeNumber[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}


extension SecondViewController: EpisodesDelegate {
    func episodesTableUpdate(name: String, episodeNumber: String) {
        self.episodeName.append(name)
        self.episodeNumber.append(episodeNumber)
        secondTable.reloadData()
        firstSeenLabel.text = episodeName.first 
    }
}
