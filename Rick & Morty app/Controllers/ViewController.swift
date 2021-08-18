//
//  ViewController.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    
    
    var charecters: [Result] = []
    
    var results: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Networking().loadCharacters { charecters in
            self.charecters = charecters
            self.tableView.reloadData()
        }
      
    }

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charecters.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as! CharacterCell
        let model = charecters[indexPath.row]
        
        
        cell.nameLabel.text = model.name
        cell.characterImage.setImage(imageUrl: model.image)
        cell.locationLabel.text = model.location.name
        cell.statusLabel.text = model.status.rawValue
        
        
        switch model.status {
        
        case .alive:
            cell.statusImage.tintColor  = .systemGreen
        case .dead:
            cell.statusImage.tintColor = .systemRed
        case .unknown:
            cell.statusImage.tintColor = .systemOrange
        }
        
            return cell
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(identifier: "DetailedCharacter") as! SecondViewController
        secondViewController.detailed = charecters[indexPath.row]
        self.present(secondViewController, animated: true, completion: nil)
    }
}

