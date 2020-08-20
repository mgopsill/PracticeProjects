//
//  ProgressEditor.swift
//  BookClub
//
//  Created by Mike Gopsill on 22/07/2020.
//

import SwiftUI

struct ProgressEditor: View {
    @Binding var editorConfig: EditorConfig
    let saveHistory: (BookHistory) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel", action: {
                    withAnimation {
                        editorConfig.isEditorPresented = false
                    }
                })
                Spacer()
                Button("Save", action: {
                    withAnimation {
                        editorConfig.isEditorPresented = false
                        saveHistory(BookHistory(progress: editorConfig.progress,
                                                note: editorConfig.note,
                                                timeStamp: Date()))
                    }
                })
            }
            Divider()
            HStack(spacing: 40) {
                Slider(value: $editorConfig.progress, in: 0...100)
                Text("\(String(format: "%.2f", editorConfig.progress))%")
                    .fontWeight(.bold)
                    .frame(width: 80)
            }
            HStack {
                Text("NOTES:")
                    .font(Font.system(size: 12))
                Spacer()
            }
            TextField("", text: $editorConfig.note)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 12))
                .padding(.bottom, 40)
        }
    }
}

struct ProgressEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProgressEditor(editorConfig: .constant(EditorConfig(isEditorPresented: true, note: "", progress: 0.2)), saveHistory: { _ in })
    }
}
