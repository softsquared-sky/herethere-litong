//
//  FeedTableTableViewCell.swift
//  ios
//
//  Created by 이동연 on 28/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class FeedTableTableViewCell: UITableViewCell {

   
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNickname: UILabel!
    @IBOutlet weak var feedText: UILabel!
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var joayo: UILabel!
    @IBOutlet weak var bookmark: UILabel!
    @IBOutlet weak var daetGuel: UILabel!
    
    
    func updateUI(_ feed : Feed){
        
        self.profileImage.image = feed.profileImage
//        self.feedImage.image = feed.feedImage
        
        self.userNickname.text = feed.userNickname
        self.place.text = feed.place
        
        self.joayo.text = feed.joayo
        self.bookmark.text = feed.feedText
        self.daetGuel.text = feed.daetGuel
        
    }
}
