//
//  ResultTableViewCell.swift
//  TwitterSearchResults
//
//  Created by Michael on 20/05/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit
import TwitterSearch
import Kingfisher

class ResultTableViewCell: UITableViewCell {
    
    static let cellIdent = "SearchResultCell"
    static let cellNib = "ResultTableViewCell"
    static let rowHight = CGFloat(134)

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var twitterText: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func register(forTableView tableView: UITableView) {
        tableView.register(UINib(nibName: cellNib, bundle: nil), forCellReuseIdentifier: cellIdent)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userName.text = ""
        twitterText.text = ""
        userIcon.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(forTwitter twitt: TwitterStatus) {
        userName.text = twitt.user?.username
        twitterText.text = twitt.text
        if let url = twitt.user?.userIconURL {
            userIcon.kf.setImage(with: url)
        }
    }
    
}
