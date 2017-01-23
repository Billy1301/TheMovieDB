//
//  Movie.swift
//  My Favorite Movies
//
//  Created by Billy on 1/22/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit

struct Movie {
    
    let title: String
    let id: Int
    let posterPath: String?
    let overview: String?
    
    init(dictionary: [String:AnyObject]) {
        title = dictionary[Constants.TMDBResponseKeys.Title] as! String
        id = dictionary[Constants.TMDBResponseKeys.ID] as! Int
        posterPath = dictionary[Constants.TMDBResponseKeys.PosterPath] as? String
        overview = dictionary[Constants.TMDBResponseKeys.Overview] as? String
    }
    
    static func moviesFromResults(_ results: [[String:AnyObject]]) -> [Movie] {
        
        var movies = [Movie]()
        
        for result in results {
            movies.append(Movie(dictionary: result))
        }
        return movies
    }
}


extension Movie: Equatable {}

func ==(lhs: Movie, rhs: Movie) -> Bool {
    return lhs.id == rhs.id
}
