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
    
    let load = Networking()
    
    var fetchingMore = false
    
    var charecters: [Result] = []
    
    var info: Info?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Networking().loadCharacters { charecters,info  in
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.charecters = charecters
            self.info = info
            self.tableView.reloadData()
        }
    }
    
    
    private func showActivity() -> UIView {
        
        let indicator = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        
        spinner.center = indicator.center
        indicator.addSubview(spinner)
        spinner.startAnimating()
        
        return indicator
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    func beginBatch() {
        self.fetchingMore = true
        self.tableView.tableFooterView = self.showActivity()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.load.infiniteScroll(url: self.info?.next ?? "") { charecters, info in
                self.charecters.append(contentsOf: charecters)
                self.info = info
                self.fetchingMore = false
                self.tableView.reloadData()
            }
           if self.info?.next == nil {self.tableView.tableFooterView = nil}
        }
    }
}





extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charecters.count
    }
     
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as! CharacterCell
        let model = charecters[indexPath.row]
        
        cell.nameLabel.text = model.name
        cell.characterImage.setImage(imageUrl: model.image)
        cell.locationLabel.text = model.location.name
        cell.statusLabel.text = "\(model.status.rawValue) - \(model.species)"
        
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
        let selectedCharacter = charecters[indexPath.row]
        
        
        if let secondViewController = self.storyboard?.instantiateViewController(identifier: "DetailedCharacter") as? SecondViewController {
            
            secondViewController.detailed = selectedCharacter
            secondViewController.episodesArray = selectedCharacter.episode
            present(secondViewController, animated: true, completion: nil)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height {

            if !fetchingMore {
                beginBatch()
            }
        }
    }
}

