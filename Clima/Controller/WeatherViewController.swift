//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//MARK: - Starting project properties and methods
class WeatherViewController: UIViewController, WeatherDataReciever {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    // Variable, which allows to make API requests
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        searchTextField.delegate = self
        weatherManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
 
    }

    
}
//MARK: - Textfield delegate
extension WeatherViewController: UITextFieldDelegate {

//Triggers, when user tap return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        //Dismiss keyboard
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    

//Don't dismiss keyboard if user didn't tapped anything (used to check something before keyboard disappear)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "type something here"
            return false
        }
    }
    
    //Triggered, when user pressed "return" or search button tapped (after user endEditing)
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            // Imports inputted city name in url in weather manager url function
            if let city = searchTextField.text {
                weatherManager.fetchWeather(cityName: city)
            }
           
            //Use searchfield.text
            searchTextField.text = ""
        }
        
    // method proceeding incoming weather data
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        //Inserts process of recieving data in main thread
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperaratureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    // Errors catching method
    func didFailWithError(error: Error) {
        print(error)
    }
}
