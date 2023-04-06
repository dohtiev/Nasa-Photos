//
//  Constants.swift
//  NasaPhotosApi
//

import Foundation

struct Constants{
    static var API_KEY = "ApiKey"
    static var API_URL_CURIOSITY = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=\(Constants.API_KEY)")
    static var API_URL_OPPORTUNITY = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&api_key=\(Constants.API_KEY)")
    static var API_URL_SPIRIT = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&api_key=\(Constants.API_KEY)")
    static var API_URL_PERSEVERANCE = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos?api_key=\(Constants.API_KEY)")
}
