//
//  ContentView.swift
//  BucketList
//
//  Created by Alonso Acosta on 23/02/26.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var locations: [Location] = []
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Marker(
                        location.name,
                        coordinate: CLLocationCoordinate2D(
                            latitude: location.latitude,
                            longitude: location.longitude
                        )
                    )
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local ) {
                    locations.append(
                        Location(
                            id: UUID(),
                            name: "New Location",
                            description: "",
                            latitude: coordinate.latitude,
                            longitude: coordinate.longitude
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
