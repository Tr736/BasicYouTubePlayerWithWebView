//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Thomas Richardson on 8/22/16.
//  Copyright © 2016 Thomas Richardson. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var partyRocks = [PartyRock]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://s.mxmcdn.net/images-storage/albums8/0/0/9/1/7/1/32171900_500_500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "http://s.mxmcdn.net/images-storage/albums8/0/0/9/1/7/1/32171900_500_500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out 1")
        
        let p3 = PartyRock(imageURL: "http://s.mxmcdn.net/images-storage/albums8/0/0/9/1/7/1/32171900_500_500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out 2")
        
        let p4 = PartyRock(imageURL: "http://s.mxmcdn.net/images-storage/albums8/0/0/9/1/7/1/32171900_500_500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out 3")
        
        let p5 = PartyRock(imageURL: "http://s.mxmcdn.net/images-storage/albums8/0/0/9/1/7/1/32171900_500_500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out 4")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
          
            cell.updateUI(partyRock: partyRock)
            
            return cell

        }
        else
        {
            return UITableViewCell()

        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                
                destination.partyRock = party
                
            }
        }
    }
}

