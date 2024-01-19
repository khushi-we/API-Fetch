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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        return cell
    }
    
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

