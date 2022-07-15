//
//  ContentView.swift
//  CoolBeans
//
//  Created by Livia Soare on 15.07.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu() //object create and kept alive by these view
    @StateObject var history = History()
    
    var body: some View {
        MenuView()
            .environmentObject(menu)
            .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() //struct only appearing here, showing the preview
    }
}
