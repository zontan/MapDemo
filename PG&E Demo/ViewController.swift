//
//  ViewController.swift
//  PG&E Demo
//
//  Created by Jonathan  Fotland on 8/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var coordinateList: [Coordinate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Test data
        coordinateList.append(Coordinate((37.789994, -122.412537)))
        coordinateList.append(Coordinate((37.773713, -122.257012)))
        
        for _ in 2...10 {
            coordinateList.append(Coordinate.randomCoordinate())
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coordinateList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coordinateCell", for: indexPath)
        
        if let coordCell = cell as? CoordinateTableViewCell {
            let coordinate = coordinateList[indexPath.row]
            coordCell.coordinateLabel.text = "\(coordinate)"
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinate = coordinateList[indexPath.row]
        
        performSegue(withIdentifier: "showCoordinate", sender: coordinate)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCoordinate" {
            if let coordinate = sender as? Coordinate,
                let destination = segue.destination as? MapViewController {
                
                destination.coordinate = coordinate
            }
        }
    }

}

