//
//  ViewController.swift
//  NasaPhotosApi
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var launchDate: UILabel!
    
    @IBOutlet weak var roverName: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var dateOfPhoto: UILabel!
    
    @IBOutlet weak var imageOfMars: UIImageView!
    
    @IBOutlet weak var generateButton: UIButton!
    
    @IBAction func latestTapped(_ sender: UIButton) {
        fetchPhotosLatest { photos, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let photos = photos else {
                print("No data")
                return
            }
            
            DispatchQueue.main.async {
                let index = Int.random(in: 0..<photos.count)
                let urlForPhoto = URL(string: photos[index].img_src)
                let request = URLRequest(url: urlForPhoto!)
                let session = URLSession.shared
                let task = session.dataTask(with: request){data, response, error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                    if let data = data, let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            self.imageOfMars.image = image
                        }
                    }else{
                        print("error: creating UIImage from recieved data")
                    }
                }
                task.resume()

                self.launchDate.text = photos[index].rover.launch_date
                self.roverName.text = photos[index].rover.name
                self.dateOfPhoto.text = photos[index].earth_date
                
                if photos[index].rover.status == "active"{
                    self.status.textColor = UIColor(red: 0.0, green: 0.7, blue: 0.0, alpha: 1.0)
                } else {
                    self.status.textColor = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0)
                }
                
                self.status.text = photos[index].rover.status
            }
        }
    }
    
    @IBAction func generateTapped(_ sender: UIButton) {
        
        fetchPhotos { photos, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let photos = photos else {
                print("No data")
                return
            }
            
            DispatchQueue.main.async {
                let index = Int.random(in: 0..<photos.count)
                let urlForPhoto = URL(string: photos[index].img_src)
                let request = URLRequest(url: urlForPhoto!)
                let session = URLSession.shared
                let task = session.dataTask(with: request){data, response, error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                    if let data = data, let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            self.imageOfMars.image = image
                        }
                    }else{
                        print("error: creating UIImage from recieved data")
                    }
                }
                task.resume()

                self.launchDate.text = photos[index].rover.launch_date
                self.roverName.text = photos[index].rover.name
                self.dateOfPhoto.text = photos[index].earth_date
                
                if photos[index].rover.status == "active"{
                    self.status.textColor = UIColor(red: 0.0, green: 0.7, blue: 0.0, alpha: 1.0)
                } else {
                    self.status.textColor = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0)
                }
                
                self.status.text = photos[index].rover.status
            }
        }
    }
}

