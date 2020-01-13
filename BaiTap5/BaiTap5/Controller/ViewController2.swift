//
//  ViewController2.swift
//  BaiTap5
//
//  Created by iMac_VTCA on 1/10/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

protocol crudDelegate: class {
    func saveItem(note: Note)
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    @IBOutlet weak var mapKit: MKMapView!
    
    let locationManager = CLLocationManager()
    weak var delegate: crudDelegate?
    var selectedNoteToEdit: Note?
    var lat2D: Double = 0.0
    var long2D: Double = 0.0
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        selectedNoteToEdit = nil
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapKit.delegate = self
        
        
        if let note = selectedNoteToEdit {
            tfTitle.text = note.title
            tfDescription.text = note.description
            self.lat2D = note.latitude
            self.long2D = note.longitude
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(note.latitude), longitude: CLLocationDegrees(note.longitude))
            showCurrentLocation(location2D: location)
        } else {
            getCurrentLocation()
        }
        self.perform(#selector(addPinsToMap), with: nil, afterDelay: 3) // cách này chưa hay lắm
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
        let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(self.lat2D), longitude: CLLocationDegrees(self.long2D))
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = "You are here"
        mapKit.addAnnotation(pin)
    }
    
    @IBAction func saveButton_Clicked(_ sender: UIButton) {
        if let note = selectedNoteToEdit {
            let title = tfTitle.text ?? ""
            let description = tfDescription.text ?? ""
            
            
            
            let lat: Double = self.lat2D
            let long: Double = self.long2D
            
            let editNote = Note(id: note.id, title: title, description: description, latitude: lat, longitude: long, dateCreated: note.dateCreated)
            delegate?.saveItem(note: editNote)
            self.dismiss(animated: true, completion: nil)
        } else {
            let currentDate = Date()
            
            // 1) Create a DateFormatter() object.
            let format = DateFormatter()
            
            // 2) Set the current timezone to .current, or America/Chicago.
            format.timeZone = .current
            
            // 3) Set the format of the altered date.
            format.dateFormat = "dd-MM-yyyy HH:mm:ss"
            
            // 4) Set the current date, altered by timezone.
            let dateString = format.string(from: currentDate)
            
            let id = UUID().uuidString
            let title = tfTitle.text ?? ""
            let description = tfDescription.text ?? ""
            
            let lat: Double = self.lat2D
            let long: Double = self.long2D
            
            let newNote = Note(id: id, title: title, description: description, latitude: lat, longitude: long, dateCreated: dateString)
            delegate?.saveItem(note: newNote)
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController2: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("CLLocationManagerDelegate")
        guard let userLocation = locations.first else {
            return
        }
        
        showCurrentLocation(location2D: userLocation.coordinate)
        self.lat2D = Double(userLocation.coordinate.latitude)
        self.long2D = Double(userLocation.coordinate.longitude)
        
        print("user longitude = \(userLocation.coordinate.longitude)")
        print("user latitude = \(userLocation.coordinate.latitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

extension ViewController2: MKMapViewDelegate {
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
            self.lat2D = Double(newLocation.latitude)
            self.long2D = Double(newLocation.longitude)
            
        }
    }
    
    
}
