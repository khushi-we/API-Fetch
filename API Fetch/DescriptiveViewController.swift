//
//  DescriptiveViewController.swift
//  API Fetch
//
//  Created by Khushi Chauhan on 24/01/24.
//

import UIKit

class DescriptiveViewController: UIViewController {

    @IBOutlet var imgDvc : UIImageView!
    @IBOutlet var titleDvc : UILabel!
    @IBOutlet var descDvc : UILabel!
    @IBOutlet var releaseDateDvc : UILabel!
    @IBOutlet var voteCountDvc : UILabel!
    @IBOutlet var voteAvgDvc : UILabel!
    @IBOutlet var releaseDate : UILabel!
    @IBOutlet var voteCount : UILabel!
    @IBOutlet var voteAvg : UILabel!
    
    var movieRecieved = movie()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = "https://image.tmdb.org/t/p/original"
        imgDvc.downloadImage(from: URL(string : url + (movieRecieved.backdrop_path ?? "/yOm993lsJyPmBodlYjgpPwBjXP9.jpg"))! as URL)
        titleDvc.text = movieRecieved.original_title
        descDvc.text = movieRecieved.overview
        releaseDateDvc.text = "Release Date:"
        voteAvgDvc.text = "Vote Average :"
        voteCountDvc.text = "Vote Counts :"
        releaseDate.text = movieRecieved.release_date
        voteAvg.text = String(movieRecieved.vote_average ?? 0.00) as String
        voteCount.text = String(movieRecieved.vote_count ?? 0) as String
        
        
    }
    

}

