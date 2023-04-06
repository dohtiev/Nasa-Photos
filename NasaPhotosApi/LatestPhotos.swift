//
//  LatestPhotos.swift
//  NasaPhotosApi
//

import UIKit

struct PhotoResponseLatest: Codable {
    let latest_photos: [PhotoLatest]
}

struct PhotoLatest: Codable {
    let id: Int
//    let sol: Int
    let camera: Camera
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct CameraLatest: Codable {
    let full_name: String
}

struct RoverLatest: Codable {
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}

func fetchPhotosLatest(completion: @escaping ([PhotoLatest]?, Error?) -> Void) {
    let task = URLSession.shared.dataTask(with: Constants.API_URL_PERSEVERANCE!) { data, response, error in
        guard let data = data else {
            completion(nil, error)
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let photoResponse = try decoder.decode(PhotoResponseLatest.self, from: data)
            let latest_photos = photoResponse.latest_photos
            completion(photoResponse.latest_photos, nil)
            print("Response: \(latest_photos[0])")
        } catch {
            print("Error: \(error)")
            completion(nil, error)
        }
    }
    task.resume()
}


