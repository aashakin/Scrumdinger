//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Aleksandr on 15.07.2023.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let scrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return scrums
        }
        
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let fileURL = try Self.fileURL()
            try data.write(to: fileURL)
        }
        
        _ = try await task.value
    }
}
