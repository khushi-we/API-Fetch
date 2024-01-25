//
//  MovieSections.swift
//  API Fetch
//
//  Created by Khushi Chauhan on 25/01/24.
//

import Foundation

struct MovieSections {
    var sectionType : String?
    var data : [movie]?
    
    init(sectionType: String? = nil, data: [movie]? = nil) {
        self.sectionType = sectionType
        self.data = data
    }
}
