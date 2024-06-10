//
//  MyDaylistApp.swift
//  MyDaylist
//
//  Created by Andrew Wijaya on 07/05/2024.
//

import SwiftUI
import SwiftData

@main
struct MyDaylistApp: App {
    var body: some Scene {
        WindowGroup {
            DaylistTabView()
        }
        .modelContainer(for: [Event.self])
    }
}
