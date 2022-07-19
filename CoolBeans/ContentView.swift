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
    @State private var showingAddScreen = false
    
    var totalCaffeine: Int {
        history.servings.map(\.caffeine).reduce(0, +)
    }
    
    var totalCalories: Int{
        history.servings.map(\.calories).reduce(0, +)
    }
    
    
    var body: some View { //removed MenuView()
        NavigationView{
            List{
                if history.servings.isEmpty{
                    Button("Add your first drink"){
                        showingAddScreen = true
                    }
                } else{
                    Section("Summary"){
                        Text("Caffeine: \(totalCaffeine)mg")
                        Text("Calories: \(totalCalories)s")
                    }
                    
                    ForEach(history.servings){serving in
                        HStack{
                            VStack(alignment: .leading){
                                Text(serving.name)
                                    .font(.headline)
                                
                                Text(serving.description)
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text("\(serving.caffeine)mg")
                        }
                        .swipeActions{
                            Button(role: .destructive){
                                withAnimation{
                                    history.delete(serving)
                                }
                            }label:{
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button{
                                withAnimation{
                                    history.reorder(serving)
                                }
                            } label:{
                                Label("Repeat", systemImage:  "repeat")
                            }
                            .tint(.blue)
                        }
                    }
                }
            }
            
            .sheet(isPresented: $showingAddScreen, content: MenuView.init) //create and show  menu view inside the sheet
            .navigationTitle("Cool Beans")
            
            .toolbar{
                Button{
                    showingAddScreen =  true
                } label: {
                    Label("Add New Drink", systemImage: "plus")
                }
            }
        }
        .environmentObject(menu)
        .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() //struct only appearing here, showing the preview
    }
}
