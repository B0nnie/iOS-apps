//
//  ViewController.swift
//  Maps
//
//  Created by Ebony Nyenya on 2/2/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//
/* Homework 2/2/15

- make the map view show your current location (not as an annotation, but as the blue dot) - done
- make the "annotation view" show using "title" on an annotation (make the title be the name of the venue) - done
- make the mapview zoom to the annotations (maybe look for a way to make a region based on the annotations)
- change the pin color - done

*/

import UIKit
import MapKit
import CoreLocation

var onceToken: dispatch_once_t = 0

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {
    
    var lManager = CLLocationManager()
    var mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.frame = view.frame
        
        self.mapView.delegate = self
        
        view.addSubview(mapView)
        
        lManager.requestWhenInUseAuthorization()
        
        lManager.delegate = self
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest
        
        lManager.distanceFilter = kCLDistanceFilterNone
        
        lManager.startUpdatingLocation()
    
        
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        
        dispatch_once(&onceToken) { () -> Void in
            
            println(locations.last)
            
            if let location = locations.last as CLLocation? {
                
              //self.mapView.centerCoordinate = location.coordinate
                
                let span = MKCoordinateSpanMake(0.1, 0.1)
                
                let region = MKCoordinateRegion (center: location.coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
                
                let venues = FourSquareRequest.requestVenuesWithLocation (location)
                
                println(venues)
                
                self.createAnnotationsWithVenues(venues)
                
                //request to FourSquare for venues with location
            }
        }
        
        lManager.stopUpdatingLocation()
    }
    
    
    func createAnnotationsWithVenues (venues: [AnyObject]) {
        
        for venue in venues as [[String: AnyObject]] {
            
            let locationName = venue["name"] as String
            let locationInfo = venue["location"] as [String:AnyObject]
            
            let lat = locationInfo["lat"] as CLLocationDegrees
            let lng = locationInfo["lng"] as CLLocationDegrees
            
            let coordinate = CLLocationCoordinate2DMake(lat, lng)
            
            let annotation = MKPointAnnotation()
            annotation.setCoordinate(coordinate)
            
            annotation.title = locationName
            
            mapView.addAnnotation(annotation)
            mapView.showsUserLocation = true
            
           
        }
        
    }
    
    func mapView(mapView: MKMapView!,
        viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
            
            if annotation is MKUserLocation {
                //return nil so map view draws "blue dot" for standard user location
                return nil
            }
            
            let reuseId = "pin"
            
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = .Purple
            }
            else {
                pinView!.annotation = annotation
            }
            
            return pinView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

