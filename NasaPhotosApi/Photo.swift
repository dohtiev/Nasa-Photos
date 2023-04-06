//
//  Photo.swift
//  NasaPhotosApi
//

import UIKit

struct PhotoResponse: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
//    let sol: Int
    let camera: Camera
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct Camera: Codable {
    let full_name: String
}

struct Rover: Codable {
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}

func fetchPhotos(completion: @escaping ([Photo]?, Error?) -> Void) {
    
    let randRover = Int.random(in: 0..<10)
    var urlForApi = URL(string: "")
    switch randRover{
    case 1...8:
        urlForApi = Constants.API_URL_CURIOSITY
    case 9:
        urlForApi = Constants.API_URL_OPPORTUNITY
    case 10:
        urlForApi = Constants.API_URL_SPIRIT
    default:
        return
    }
    
    let task = URLSession.shared.dataTask(with: urlForApi!) { data, response, error in
        guard let data = data else {
            completion(nil, error)
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let photoResponse = try decoder.decode(PhotoResponse.self, from: data)
            let photos = photoResponse.photos
            completion(photoResponse.photos, nil)
            print("Response: \(photos[0])")
        } catch {
            print("Error: \(error)")
            completion(nil, error)
        }
    }
    task.resume()
}


