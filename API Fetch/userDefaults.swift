//
//  userDefaults.swift
//  API Fetch
//
//  Created by Khushi Chauhan on 29/01/24.
//

import Foundation

struct Defaults {

    static let movieSessionKey = "com.save.movies"

    static func save(movie: String) {
        // Retrieve the existing movie data or create an empty dictionary
        var movieData = UserDefaults.standard.dictionary(forKey: movieSessionKey) as? [String: Int] ?? [:]

        // Increment the count for the given movie
        movieData[movie, default: 0] += 1

        // Save the updated movie data
        UserDefaults.standard.set(movieData, forKey: movieSessionKey)
    }

    static func getSavedData() -> [String: Int] {
        // Retrieve the stored movie data
        let movieData = UserDefaults.standard.dictionary(forKey: movieSessionKey) as? [String: Int] ?? [:]
        return movieData
    }
}
