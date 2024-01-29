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
    @IBOutlet var shareBtn : UIButton!
    @IBOutlet var saveBtn : UIButton!
    
    var movieRecieved = movie()
    
    let url = "https://image.tmdb.org/t/p/original"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        imgDvc.downloadImage(from: URL(string : url + (movieRecieved.backdrop_path ?? "/yOm993lsJyPmBodlYjgpPwBjXP9.jpg"))! as URL)
        titleDvc.text = movieRecieved.original_title
        descDvc.text = movieRecieved.overview
        releaseDateDvc.text = "Release Date:"
        voteAvgDvc.text = "Vote Average :"
        voteCountDvc.text = "Vote Counts :"
        releaseDate.text = movieRecieved.release_date
        voteAvg.text = String(movieRecieved.vote_average ?? 0.00) as String
        voteCount.text = String(movieRecieved.vote_count ?? 0) as String
        shareBtn.addTarget(self, action: #selector(tapaction), for: .touchUpInside)
        saveBtn.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
    }
    
    @objc func tapaction(){
        
        let Imageurl = URL(string : url + (movieRecieved.backdrop_path ?? "/yOm993lsJyPmBodlYjgpPwBjXP9.jpg"))! as URL
        var imgToShare : UIImage = UIImage()
        
        //synchronously
     /*   if let data = try? Data(contentsOf: Imageurl){
            imgToShare = UIImage(data: data)!
        } */
        
        //asynchronously
        let imageTask = URLSession.shared.dataTask(with: Imageurl, completionHandler: {
            (data,response,error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil, let downloadedImage = UIImage(data: data)
            else
            {
                print("Unable to download Image")
                return
            }
            //completion block
            imgToShare = downloadedImage
            
            //UI updates MUST happen on the main thread
            DispatchQueue.main.async {
                
                let textToShare = self.movieRecieved.overview
                let shareBtnActivityController = UIActivityViewController(activityItems: [imgToShare,textToShare as Any] as [Any], applicationActivities: nil)
                
                self.present(shareBtnActivityController, animated: true, completion: nil)
            }
        })
        imageTask.resume()
       
    }
    
    @objc func saveAction() {
        
        Defaults.save(movie : movieRecieved.original_title!)
        let savedData = Defaults.getSavedData()
        
        print(savedData)
        
    }
}

