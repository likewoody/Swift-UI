//
//  LocationManager.swift
//  Map
//
//  Created by Woody on 5/18/24.
//

import MapKit
import SwiftUI


final class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    // 기본 값으로 설정 해두었다.
    @Published var region = MapCameraPosition.region(MKCoordinateRegion(
        center: .init(latitude: 37.334_900, longitude: -122.009_020),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2))
    )
        
    @Published var latitude1 = ""
    @Published var longitude1 = ""
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        // GPS 성능 - 최성능을 통해서 받겠다.
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.setup()
    }
    
    func setup() {
        // Permission check
        switch locationManager.authorizationStatus {
        //If we are authorized then we request location just once, to center the map
        case .authorizedWhenInUse:
            locationManager.requestLocation()
//            print("Latitude : \(String(describing: locationManager.location!.coordinate.latitude))")
//            print("Longitude : \(String(describing: locationManager.location!.coordinate.longitude))")
        //If we don´t, we request authorization
        case .notDetermined:
            locationManager.startUpdatingLocation()
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
}


// Location Auth Permission
extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard .authorizedWhenInUse == manager.authorizationStatus else { return }
        locationManager.requestLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        locations.last.map {
            region = MapCameraPosition.region(MKCoordinateRegion(
                center: $0.coordinate,
                span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
            )
            
            latitude1 = String(describing: locationManager.location!.coordinate.latitude)
            longitude1 = String(describing: locationManager.location!.coordinate.longitude)
            print(">>>", latitude1, longitude1)
        }
    }
}

