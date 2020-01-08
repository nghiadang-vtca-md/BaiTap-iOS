//
//  ViewController.swift
//  DemoMapLocation
//
//  Created by iMac_VTCA on 1/8/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mapKit: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var location2Ds = [
        CLLocationCoordinate2D(latitude: 10.765908, longitude: 106.654319),
        CLLocationCoordinate2D(latitude: 10.767157, longitude: 106.653037),
        CLLocationCoordinate2D(latitude: 10.763020, longitude: 106.656894),
        CLLocationCoordinate2D(latitude: 10.762635, longitude: 106.654523)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapKit.delegate = self
        
        getCurrentLocation()
        
        self.perform(#selector(addPinsToMap), with: nil, afterDelay: 3) // cách này chưa hay lắm
        
        //getLocationFromString(with: "HaNoi")
    }
    func getCurrentLocation() {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // chính xác
        locationManager.distanceFilter = 20 // sau khi vị trí di chuyển 20m thì sẽ update location lại
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()  // ???
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            
        }
        
    }
    
    func showCurrentLocation(location2D: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion.init(center: location2D, span: MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapKit.setRegion(region, animated: true)
        
        mapKit.showsUserLocation = true
    }
    
    @objc func addPinsToMap() {
        for location in self.location2Ds {
            print("addPinsToMap")
            let pin = MKPointAnnotation()
            pin.coordinate = location
            pin.title = "Food restaurant"
            mapKit.addAnnotation(pin)
        }
    }
    
    func getLocationFromString(with: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(with) { ( placeMarks, error) in
            guard let placeMarkFirst = placeMarks?.first else {
                return
            }
            
            print(placeMarkFirst.location?.coordinate)
        }
    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("CLLocationManagerDelegate")
        guard let userLocation = locations.first else {
            return
        }
        
        showCurrentLocation(location2D: userLocation.coordinate)
        
        
        
//        print("user longitude = \(userLocation.coordinate.longitude)")
//        print("user latitude = \(userLocation.coordinate.latitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("MKMapViewDelegate")
        if let annotation = annotation as? MKPointAnnotation {
            let hintAnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
            
            hintAnotationView.animatesDrop = true
//            hintAnotationView.image =
            
            hintAnotationView.isDraggable = true
            
            
            hintAnotationView.pinTintColor = .green
            return hintAnotationView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        if newState == .ending {
            let newLocation = mapView.convert(view.center, toCoordinateFrom: view.superview)
            print(newLocation)
        }
    }
    
    
}

/*
Phải add library CoreLocation và MapKit
Thiết lập 2 key này cho info.plist
 This app has attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain both “NSLocationAlwaysAndWhenInUseUsageDescription” and “NSLocationWhenInUseUsageDescription” keys with string values explaining to the user how the app uses this data
 
 
 10.765908, 106.654319
 10.767157, 106.653037
 10.763020, 106.656894
 10.762635, 106.654523
*/

