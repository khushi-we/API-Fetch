//
//  MyTableViewCell.swift
//  API Fetch
//
//  Created by Khushi Chauhan on 24/01/24.
//

import UIKit
//var controller = ViewController()
class MyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var collectionView : UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("im here 1")
        print("count is \(String(describing: DataManager.shared.mData[collectionView.tag].data?.count))")
        return DataManager.shared.mData[collectionView.tag].data!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("im here 2")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.title.text = DataManager.shared.mData[collectionView.tag].data?[indexPath.row].original_title
        cell.desc.text = DataManager.shared.mData[collectionView.tag].data?[indexPath.row].overview
        let url = "https://image.tmdb.org/t/p/original"
        
   
        cell.imgview.downloadImage(from: URL(string : url + (DataManager.shared.mData[collectionView.tag].data?[indexPath.row].backdrop_path ?? "/yOm993lsJyPmBodlYjgpPwBjXP9.jpg"))! as URL)
        print("cell returning")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //if let parentViewController = s
        let srcViewController = UIStoryboard(name: "Main", bundle: nil)
        let destViewController = srcViewController.instantiateViewController(withIdentifier: "DescriptiveViewController") as! DescriptiveViewController
        destViewController.movieRecieved = (DataManager.shared.mData[collectionView.tag].data?[indexPath.row])!
       controller.navigationController?.pushViewController(destViewController, animated: true)
    }
    
    
   
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
