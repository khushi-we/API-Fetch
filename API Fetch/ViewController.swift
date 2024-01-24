//
//  ViewController.swift
//  API Fetch
//
//  Created by Khushi Chauhan on 19/01/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var collectionView : UICollectionView!
    
   // var movieData : allmovies
    var moviesinfo = [movie]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesinfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.title.text = moviesinfo[indexPath.row].original_title
        cell.desc.text = moviesinfo[indexPath.row].overview
        var url = "https://image.tmdb.org/t/p/original"
        
   
        cell.imgview.downloadImage(from: URL(string : url + (moviesinfo[indexPath.row].backdrop_path ?? "/yOm993lsJyPmBodlYjgpPwBjXP9.jpg"))! as URL)
        
        return cell
    }
    
    func fetchData () {

        let headers = ["accept" : "application/json", "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTc3ZTA3MGYyZTk4ZTZmMjQ2ZDU0MzliMTU2ZGE5ZCIsInN1YiI6IjY1YTYzZTRkODU3MDJlMDBjN2MzODE3NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.04w1KK1EKQP9eVC5bF8X4dk0YxCQf9FTTQ9FlcjggEU"]
                
                 var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/trending/movie/day?language=en-US")! as URL)
                
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers
        let task = URLSession.shared.dataTask(with: request, completionHandler:{
            (data,response, error) in
            guard let data = data, error == nil else {
                print("error : \(String(describing: error))")
                return
            }
            do {
                let movieData = try JSONDecoder().decode(allmovies.self, from: data)
                self.moviesinfo = movieData.results
            }
            catch {
                print("Error occurred when decoding JSON Data \(error)")
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } )
        task.resume()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        
        AVCaptureDevice.requestAccess(for: .audio) { granted in
            if granted
            {
                print("Audio Permission Granted")
            }
            else
            {
                print("Permission not granted")
            }
        }
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted
            {
                print("Video Permission Granted")
            }
            else
            {
                print("Permission not granted")
            }
        }
    }


}


extension UIImageView {
    
    func downloadImage(from url : URL)
    {
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
            (data,response,error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else
            {
                print("Not a valid response")
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        })
        dataTask.resume()
    }
    
    
}
