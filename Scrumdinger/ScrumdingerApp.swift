//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Aleksandr on 13.07.2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
