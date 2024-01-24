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
    
    init(adult: Bool? = nil,
             backdrop_path: String? = nil,
             id: Int? = nil,
             title: String? = nil,
             original_language: String? = nil,
             original_title: String? = nil,
             overview: String? = nil,
             poster_path: String? = nil,
             media_type: String? = nil,
             genre_ids: [Int]? = nil,
             popularity: Double? = nil,
             release_date: String? = nil,
             video: Bool? = nil,
             vote_average: Double? = nil,
             vote_count: Int? = nil) {
            
            self.adult = adult
            self.backdrop_path = backdrop_path
            self.id = id
            self.title = title
            self.original_language = original_language
            self.original_title = original_title
            self.overview = overview
            self.poster_path = poster_path
            self.media_type = media_type
            self.genre_ids = genre_ids
            self.popularity = popularity
            self.release_date = release_date
            self.video = video
            self.vote_average = vote_average
            self.vote_count = vote_count
        }
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
