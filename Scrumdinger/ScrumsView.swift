//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Aleksandr on 13.07.2023.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
                .listRowSeparator(.hidden)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var scrums = DailyScrum.sampleData
    static var previews: some View {
        ScrumsView(scrums: scrums)
    }
}
