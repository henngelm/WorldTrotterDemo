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
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
//        contraints
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)

//        layoutMargins
        let margins = view.layoutMarginsGuide
        
        
//        activare the constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
}
