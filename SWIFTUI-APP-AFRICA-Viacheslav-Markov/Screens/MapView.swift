//
//  MapView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 03.02.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: Properties
    @State private var region: MKCoordinateRegion = {
        let mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let delta = 70.0
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [LocationModel] = Bundle.main.decodeJSON("locations.json")
    
    //MARK: Body
    var body: some View {
        // MARK: Basic map
//        Map(coordinateRegion: $region)
        
        //MARK: Advance map
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            // (A) PIN: old style (always static)
//            MapPin(coordinate: location.location, tint: .accentColor)
//
            // (B) PIN: new style (always static)
//            MapMarker(coordinate: location.location, tint: .accentColor)
            
            // (C) PIN: Custom basic annotation (it could be interactive)
//            MapAnnotation(coordinate: location.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//: Annotation
            
            // (D) PIN: Custom advance annotation (it could be interactive)
            MapAnnotation(coordinate: location.location) {
                MapAnnotationView(location: location)
            }
        }//: Map
        .overlay(
            HStack(alignment: .center) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HStack
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HStack
                }//: VStack
            }//: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background {
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            }
            .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
