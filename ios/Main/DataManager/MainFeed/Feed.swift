//
//  Feed.swift
//  ios
//
//  Created by 이동연 on 30/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import Foundation
import UIKit

class Feed{
    
    var userNickname : String?
    var feedText : String?
    var place : String?
    
    var joayo : String?
    var bookmark : String?
    var daetGuel : String?
    
    var profileImage : UIImage?{
        return UIImage(named: "\(userNickname!).png")!
    }
    
    init(_ userNickname : String, _ feedText : String,_ place : String,_ joayo : String,_ bookmark : String,_ daetGuel : String)
    {
        self.userNickname = userNickname
        self.feedText = feedText
        self.place = place
        
        self.joayo = joayo
        self.bookmark = bookmark
        self.daetGuel = daetGuel
    }
    
}

