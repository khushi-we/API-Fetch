//
//  ViewController.swift
//  API Fetch
//
//  Created by Khushi Chauhan on 19/01/24.
//

import UIKit
var controller = UIViewController()

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataManager.shared.mData.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DataManager.shared.mData[section].sectionType
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"tableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.collectionView.tag = indexPath.section
        print("table cell")
        return cell
        
    }
    
    
    func fetchData(sectionURL: String, sectionTypename : String, completion: @escaping () -> Void) {
        let headers = ["accept" : "application/json", "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTc3ZTA3MGYyZTk4ZTZmMjQ2ZDU0MzliMTU2ZGE5ZCIsInN1YiI6IjY1YTYzZTRkODU3MDJlMDBjN2MzODE3NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.04w1KK1EKQP9eVC5bF8X4dk0YxCQf9FTTQ9FlcjggEU"]
        var request = URLRequest(url: URL(string: sectionURL)! as URL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                print("error: \(String(describing: error))")
                return
            }
            do {
                let movieData = try JSONDecoder().decode(allmovies.self, from: data)
                let sectionData = movieData.results
                DataManager.shared.mData.append(MovieSections(sectionType: sectionTypename, data: sectionData))
                
                // Reload UI on the main thread
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
                // Call the completion handler
                completion()
                
            } catch {
                print("Error occurred when decoding JSON Data \(error)")
            }
            
        }
        task.resume()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData(sectionURL: "https://api.themoviedb.org/3/trending/movie/day?language=en-US",sectionTypename: "Trending") {
            //this will be executed only when completion handler is invoked
            print("data fetched\n")
            //   print("count of movie is \(DataManager.shared.section1data.count)")
            
        }
        fetchData(sectionURL: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1", sectionTypename: "Popular") {
            //this will be executed only when completion handler is invoked
            print("data fetched\n")
            //     print("count of movie is \(DataManager.shared.section2data.count)")
            
        }
        controller = self
    }
    
}


