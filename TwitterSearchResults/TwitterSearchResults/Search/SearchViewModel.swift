//
//  SearchViewModel.swift
//  TwitterSearchResults
//
//  Created by Michael on 20/05/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit
import TwitterSearch

class SearchViewModel {
    
    struct TwitterTokens {
        static let consumerKey = "V6qVv1JMT13wY7NWtxLPjtQPM"
        static let consumerSecret = "F4V5sIyP4iwiGOkSY0DAdKKHlBa7034YxxGh2nWKHznEWdJLEU"
        static let userAccessToken = "793382406409650176-RIoO28OnGxNhy5wIb09H9xgn5i7EQfy"
        static let userAccessTokenSecret = "RKTM6psHXerPxe8rBaXAqqXvqwqzVINHglE7YlzNRXy6J"
    }
    
    private var twittes: [TwitterStatus] = []
    var numberOfTweets: Int {
        return self.twittes.count
    }

    init() {
        TwitterSearch.shared.setTwitterTokens(consumerKey: TwitterTokens.consumerKey, consumerSecret: TwitterTokens.consumerSecret, userAccessToken: TwitterTokens.userAccessToken, userAccessTokenSecret: TwitterTokens.userAccessTokenSecret)
    }
    
    
    func search(forKeyword keyword: String, complition: @escaping (Bool,Error?) -> Void) {
        TwitterSearch.shared.search(hashTag: keyword) { [weak self] (result) in
            guard let me = self else {
                return
            }
            switch result {
                case let .success(response):
                    me.twittes = response.statuses ?? []
                    complition(true,nil)
            case let .failure(error):
                    complition(false,error)
            }
        }
    }
    

    func twit(forIndexPath indexPath: IndexPath) -> TwitterStatus? {
        guard indexPath.row < twittes.count  else {
            return nil
        }
        return twittes[indexPath.row]
    }
    

}
