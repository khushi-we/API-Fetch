//
//  movieData.swift
//  API Fetch
//
//  Created by Khushi Chauhan on 22/01/24.
//

import Foundation

struct allmovies : Codable {
    var page : Int
    var results : [movie]
    var total_pages : Int
    var total_results : Int
}
struct movie : Codable {
    let adult : Bool?
    let backdrop_path : String?
    let id : Int?
    let title : String?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let poster_path : String?
    let media_type : String?
    let genre_ids : [Int]?
    let popularity : Double?
    let release_date : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?
    
}

/*
 "adult": false,
  "backdrop_path": "/yOm993lsJyPmBodlYjgpPwBjXP9.jpg",
  "id": 787699,
  "title": "Wonka",
  "original_language": "en",
  "original_title": "Wonka",
  "overview": "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
  "poster_path": "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
  "media_type": "movie",
  "genre_ids": [
    35,
    10751,
    14
  ],
  "popularity": 1174.095,
  "release_date": "2023-12-06",
  "video": false,
  "vote_average": 7.17,
  "vote_count": 1206
 */
