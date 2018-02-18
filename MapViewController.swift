//
//  MapViewController.swift
//  WorldTrotterDemo
//
//  Created by Henngel Mojica on 2/16/18.
//  Copyright © 2018 Henngel Mojica. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        super.loadView()
        
//        create a map view
        mapView = MKMapView()
        
//        set it as *the* view of this view controller
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
//        implement the action method in MapViewController that the event will trigger.
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
