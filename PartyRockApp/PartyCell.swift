//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Thomas Richardson on 8/22/16.
//  Copyright © 2016 Thomas Richardson. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock : PartyRock){
        
        videoTitle.text = partyRock.videoTitle
        
        //TODO: set image from URL
        
        let url = URL(string:partyRock.imageURL)!
        
        DispatchQueue.global().async {
            
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
                
            } catch {
                //handle error
            }
        }
    }

}
