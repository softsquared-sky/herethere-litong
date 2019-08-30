//
//  FeedViewController.swift
//  ios
//
//  Created by 이동연 on 28/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class FeedViewController: BaseViewController{

    
    @IBOutlet weak var FeedTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.FeedTableView.delegate = self
        self.FeedTableView.dataSource = self

        let FeedTableView = UINib(nibName: "FeedTableTableViewCell", bundle: nil)
        self.FeedTableView.register(FeedTableView, forCellReuseIdentifier: "feedTableTableViewCell")


    }

}
extension FeedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "feedTableTableViewCell", for : indexPath)as?
            FeedTableTableViewCell
            else{return UITableViewCell()}
        //        tableViewCell.updateUI(FeedList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //        return api에서 받아오는 피드갯수
        return 1
    }
}

