//
//  MapViewController.swift
//  PG&E Demo
//
//  Created by Jonathan  Fotland on 8/11/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var coordinateLabel: UILabel!
    
    var coordinate: Coordinate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let coordinate = coordinate {
            let CLCoord = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
            mapView.setRegion(MKCoordinateRegion(center: CLCoord, span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)), animated: false)
            let pin = MKPointAnnotation()
            pin.coordinate = CLCoord
            mapView.addAnnotation(pin)
            
            coordinateLabel.text = "\(coordinate)"
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
