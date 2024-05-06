//
//  ContentView.swift
//  AlertActionSheet
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    
    // 처음에 안보이니까 false
    @State var isAlert = false
    @State var isActionSheet = false
    
    var body: some View {
        VStack {
            Text("Alert와 Action Sheet")
                .font(.system(.title))
                .padding()
            
            HStack(spacing: 50, content: {
                Button("Alert", action: {
                    isAlert = true
                }) // Button
                .alert("Title", isPresented: $isAlert, actions: {
                    
                    // role = Default, Destructive, Cancel 등
                    Button("Action Default", role: .none, action: {
                        print("Action Default")
                    })
                    
                    Button("Action Default", role: .destructive, action: {
                        print("Action Destructive")
                    })
                    
                    Button("Action Cancel", role: .cancel, action: {
                        print("Action Cancel")
                    })
                    
                }, // actions
                message: {Text("Message")}) // alert
                
                
                Button("Action Sheet", action: {
                    isActionSheet = true
                }) // Button
                .confirmationDialog("Title", isPresented: $isActionSheet, titleVisibility: .visible, actions: {
                    
                    Button("Action Default", role: .none, action: {
                        print("Action Default")
                    })
                    
                    Button("Action Default", role: .destructive, action: {
                        print("Action Destructive")
                    })
                    
                    Button("Action Cancel", role: .cancel, action: {
                        print("Action Cancel")
                    })
                }, // actions
                message: {Text("Action Sheet")}) // confirmationDialog
                

            }) // HStack
            Spacer()
            
        } // VStack
        .padding()
    } // body
} // ContenView

#Preview {
    ContentView()
}
