//
//  TodoListApp.swift
//  TodoList
//
//  Created by Роман Пшеничников on 02.02.2025.
//

import SwiftUI
/*
    MVVM Architecture
    
    Model - data point
    View - UI
    ViewModel - manages Models for View

*/
@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                LaunchScreenView()
            }
            .environmentObject(listViewModel)
        }
    }
}
