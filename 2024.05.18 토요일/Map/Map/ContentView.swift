//
//  ContentView.swift
//  Map
//
//  Created by Woody on 5/18/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    // 선택된 Segment index
    @State var selectedMapType = 0
    
    @State var map1 = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.57244171, longitude: 126.9595412), // center가 어딘지 위치 설정
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))) // span Zoom의 크기
    
    @State var map2 = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.65243153, longitude: 127.0276397),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    
    
    @StateObject var manager = LocationManager()
    @State var lat: Double = 0
    @State var lng: Double = 0
    
    var body: some View {
        VStack {
            Text("Map")
                .bold()
            
            // Use for segment
            Picker(selection: $selectedMapType, label: Text("Map Type")) {
                // content 부분
                Text("서대문 형무소 역사관").tag(0)
                Text("둘리뮤지엄").tag(1)
                Text("현재 위치").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer()
            
            
            switch selectedMapType{
            case 0:
                Map(position: $map1){
                    Marker("서대문 형무소 역사관", systemImage: "signpost.left.fill", coordinate: .marker1)
                }
            case 1:
                Map(position: $map2){
                    Marker("둘리 뮤지엄", systemImage: "signpost.left.fill", coordinate: .marker2)
                }
            default:
                let currentLocation = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                
                Map(position: $manager.region){
                    Marker("현재 위치", systemImage: "signpost.left.fill", coordinate: currentLocation)
                }
                .onAppear(perform: {
                    findLocation()
                })
            }
            
        }
        
    } // body
    // ---- Function ----
    func findLocation() {
        // 인공위성을 통해서 데이터를 받는 것이기 때문에
        // 가끔 nil이 들어올 수 있다.
        guard let tempLat = Double(manager.latitude1) else {return}
        guard let tempLng = Double(manager.longitude1) else {return}
        
        lat = tempLat
        lng = tempLng
        
    }
    
} // ContentView

// CLLocationCoordinate2D에 static에 marker1이라고 만들어주기 그러면 사용할 때는
// CLLocationCoordinate2D를 사용하는 곳에서 .을 찍고 marker1을 사용할 수 있음
extension CLLocationCoordinate2D{
    static let marker1 = CLLocationCoordinate2D(latitude: 37.57244171, longitude: 126.9595412)
    static let marker2 = CLLocationCoordinate2D(latitude: 37.65243153, longitude: 127.0276397)
}

#Preview {
    ContentView()
}
