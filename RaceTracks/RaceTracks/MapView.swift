//
//  MapView.swift
//  Journeys
//
//  Created by dludlow7 on 13/07/2020.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion

    init(center: CLLocationCoordinate2D) {
        _region = State(wrappedValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: center.latitude,
                                                                                        longitude: center.longitude),
                                                         span: MKCoordinateSpan(latitudeDelta: 1,
                                                                                longitudeDelta: 1)))

    }

    var body: some View {
        Map(coordinateRegion: $region)
            .navigationBarHidden(true)
    }
}

//struct AnimatingView: View {
//    @State private var animation = 0.0
//    
//    private let location: Location
//
//    init(for location: Location){
//        self.location = location
//    }
//    
//    var body: some View {
//        NavigationLink(destination: DiscoverView(location: location)) {
//            ZStack {
//                Circle()
//                    .stroke(Color.red, lineWidth: 2)
//                    .frame(width: 40, height: 40)
//                    .scaleEffect(1 + CGFloat(animation))
//                    .opacity(1 - animation)
//                
//                Image(systemName: "sun.min  ")
//                    .imageScale(.large)
//                    .foregroundColor(.red)
//            }
//            .onAppear {
//                withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false)) {
//                    animation = 1
//                }
//            }
//        }
//    }
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(center: CLLocationCoordinate2D())
    }
}
