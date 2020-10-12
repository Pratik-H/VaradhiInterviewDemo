//
//  AppointmentMapViewController.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit
import MapKit

class AppointmentMapViewController: UIViewController {
    
    // MARK: - Parameters
    var coordinates: CLLocationCoordinate2D? = CLLocationCoordinate2D(latitude: 25.551629, longitude: 85.120104)
    
    var monthlyAppointmentsData: MonthlyAppointmentsData?
    
    // MARK: - IBOutlet
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.isZoomEnabled = true
            guard let latitude = coordinates?.latitude,
            let longitude = coordinates?.longitude  else { return}
            let latDelta: CLLocationDegrees = 0.05
            let lonDelta: CLLocationDegrees = 0.05
            let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
            let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
            self.mapView.setRegion(region, animated: true)
        }
    }

    @IBOutlet weak var addressTextView: UITextView!
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextView.text = "#\(monthlyAppointmentsData?.addressLine1 ?? "") \(monthlyAppointmentsData?.addressLine2 ?? "")"
    }
    
}
