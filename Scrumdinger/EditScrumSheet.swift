//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Aleksandr on 14.07.2023.
//

import SwiftUI

struct EditScrumSheet: View {
    @State private var editingScrum = DailyScrum.empty
    @Binding var scrum: DailyScrum
    @Binding var isPresentingEditView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditView = false
                            scrum = editingScrum
                        }
                    }
                }
                .onAppear {
                    editingScrum = scrum
                }
        }
    }
}

struct EditScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]),
                       isPresentingEditView: .constant(true))
    }
}
