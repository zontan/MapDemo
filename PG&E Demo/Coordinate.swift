//
//  Coordinate.swift
//  PG&E Demo
//
//  Created by Jonathan  Fotland on 8/11/22.
//

import Foundation

class Coordinate: CustomStringConvertible {
    static let latitudeBounds = (upper: 90.0, lower: -90.0)
    static let longitudeBounds = (upper: 180.0, lower: -180.0)
    
    private var _latitude: Double
    var latitude: Double {
        get {
            return _latitude
        }
        set {
            if newValue > Coordinate.latitudeBounds.upper {
                _latitude = Coordinate.latitudeBounds.upper
            } else if newValue < Coordinate.latitudeBounds.lower {
                _latitude = Coordinate.latitudeBounds.lower
            } else {
                _latitude = newValue
            }
        }
    }
    
    private var _longitude: Double
    var longitude: Double {
        get {
            return _longitude
        }
        set {
            if newValue > Coordinate.longitudeBounds.upper {
                _longitude = Coordinate.longitudeBounds.upper
            } else if newValue < Coordinate.longitudeBounds.lower {
                _longitude = Coordinate.longitudeBounds.lower
            } else {
                _longitude = newValue
            }
        }
    }
    
    
    public var description: String {
        return String.init(format: "%.6f, %.6f", _latitude, _longitude)
    }
    
    init() {
        _latitude = 0
        _longitude = 0
    }
    
    init(latitude: Double, longitude: Double) {
        _latitude = latitude
        _longitude = longitude
    }
    
    convenience init(_ coordinates: (lat: Double, long: Double)) {
        self.init(latitude: coordinates.lat, longitude: coordinates.long)
    }
    
    static func randomCoordinate() -> Coordinate {
        let returnVal = Coordinate()
        returnVal.longitude = Double.random(in: Coordinate.longitudeBounds.lower...Coordinate.longitudeBounds.upper)
        returnVal.latitude = Double.random(in: Coordinate.latitudeBounds.lower...Coordinate.latitudeBounds.upper)
        
        return returnVal
    }
}
