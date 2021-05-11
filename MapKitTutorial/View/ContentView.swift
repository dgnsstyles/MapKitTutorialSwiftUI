//
//  ContentView.swift
//  MapKitTutorial
//
//  Created by usuario on 11-05-21.
//

import SwiftUI
import MapKit


struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var cities: [City] = [
            City(coordinate: .init(latitude: 40.7128, longitude: 74.0060)),
            City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
            City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
        ]
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -33.448890,
            longitude: -70.669265
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.015,
            longitudeDelta: 0.015
        )
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: cities){
            city in MapAnnotation(
                coordinate: city.coordinate,
                anchorPoint: CGPoint(x: 0.5, y: 0.5)
            ) {
                Circle()
                    .stroke(Color.green)
                    .frame(width: 44, height: 44)
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
