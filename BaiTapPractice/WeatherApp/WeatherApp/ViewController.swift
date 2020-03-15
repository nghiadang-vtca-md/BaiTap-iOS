//
//  ViewController.swift
//  WeatherApp
//
//  Created by nghiadang1205 on 3/6/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //fileprivate let darkSkyApiKey = "31ff34d5b74b1e34b3b876f4db636f30"
    //let forecastUrl = URL(string: "https://api.darksky.net/forecast/31ff34d5b74b1e34b3b876f4db636f30/37.8267,-122.4233")
    
    let client = DarkSkyAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: - Nhaps
//        let base = URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")
//        guard let forecastUrl = URL(string: "37.8267,-122.4233", relativeTo: base) else { return }
//
//        let request = URLRequest(url: forecastUrl)
//        let session = URLSession(configuration: .default)
//
//        // background thread
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//            print(data)
//        }
//        dataTask.resume()
//        // Plan of action
//        // Initiate a network connection
//        // Request data from a URL a download JSON
//        // Parse the JSON
//        // Populate the model
//
////        let weatherData = try! Data(contentsOf: forecastUrl)
////        print(weatherData)
////        let jsonData = try! JSONSerialization.jsonObject(with: weatherData, options: [])
////        print(jsonData)
//
//        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, precipProbability: 0.1, summary: "Hot!", icon: "clear-day")
//        let viewModel = CurrentWeatherViewModel(model: currentWeather)
//
//        displayWeather(using: viewModel)
        // MARK: - End Nhasp
        activityIndicator.isHidden = true
        getCurrentWeather()
    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
    
    @IBAction func getCurrentWeather() {
        toggleRefreshAnimation(on: true)
        client.getCurrentWeather(at: Coordinate.alcatrazIsland) { [unowned self] (currentWeather, error) in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                print(viewModel)
                self.displayWeather(using: viewModel)
                self.toggleRefreshAnimation(on: false)
            }
        }
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton.isHidden = on
        // check box "Hides when stopped"
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    

}

