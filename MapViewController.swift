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
//       Create a map view
        mapView = MKMapView()
//       Set it as *the* view of this view controller
        view = mapView
        
//        add (programmatically) segmented control to the interface
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
//        add a target-action pair to the segmented control and associate it with the .valueChanged event.
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
//        contraints
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)

//        layoutMargins, (segmented Control, inset from the view's margins)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
//        activare the constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
//    implement the action method that the event will trigger. This method
//    will check which segment was selected and update the map accordingly
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
}
