//
//  RaceTrackDetailView.swift
//  RaceTracks
//
//  Created by Mike Gopsill on 23/07/2020.
//

import MapKit
import SwiftUI

struct RaceTrackDetailView: View {
    @EnvironmentObject var userData: UserData
    var raceTrack: RaceTrack
    
    var raceTrackIndex: Int {
        userData.raceTracks.firstIndex(where: { $0.id == raceTrack.id })!
    }
    
    var body: some View {
        NavigationView {
            VStack {
                MapView(center: raceTrack.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                
                CircleImage(image: raceTrack.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                    .frame(maxWidth: 230)
                
                VStack(alignment: .leading) {
                    Text(raceTrack.track)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.raceTracks[self.raceTrackIndex].isFavorite.toggle()
                    }) {
                        if self.userData.raceTracks[self.raceTrackIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                    HStack(alignment: .top) {
                        Text(raceTrack.city)
                            .font(.subheadline)
                        Spacer()
                        Text(raceTrack.country)
                            .font(.subheadline)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(raceTrack.track), displayMode: .inline)
    }
}

struct RaceTrackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RaceTrackDetailView(raceTrack: racetrackData[0])
            .environmentObject(UserData())
    }
}
