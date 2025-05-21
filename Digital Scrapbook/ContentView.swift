//
//  ContentView.swift
//  Digital Scrapbook
//
//  Created by Anna Galeano on 5/21/25.
//  Current template by XCode

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategory: String? = "Photos"
    
    var body: some View {
        
        NavigationSplitView {
            // Left sidebar : Library categories -----------------
            List(selection: $selectedCategory) {
                Label("Photos", systemImage: "photo").tag("Photos")
                Label("Stickers", systemImage: "star").tag("Stickers")
                Label("Backgrounds", systemImage: "rectangle.fill").tag("Backgrounds")
                Label("Text", systemImage: "text.quote").tag("Text")
            }
            .listStyle(.sidebar)
            
        } detail: {
            
            // Right side : Book ---------------------------------
            VStack {
                Text("My Scrapbook")
                    .font(.largeTitle)
                    .padding(.top)
                
                // Book with two pages
                HStack(spacing: 0) {
                    // Left page
                    Rectangle()
                        .fill(Color.white)
                        .frame(minWidth: 300, minHeight: 400)
                        .shadow(radius: 2)
                        .overlay(
                            Text("Left Page")
                                .foregroundColor(.gray)
                        )
                        .padding(.leading)
                    
                    // Book binding/spine
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 10)
                    
                    // Right page
                    Rectangle()
                        .fill(Color.white)
                        .frame(minWidth: 300, minHeight: 400)
                        .shadow(radius: 2)
                        .overlay(
                            Text("Right Page")
                                .foregroundColor(.gray)
                        )
                        .padding(.trailing)
                }
                .padding(.vertical)
                
                Spacer()
            }
            .background(Color.gray.opacity(0.1))
        }
        .navigationTitle("Digital Scrapbook")
    }
}

#Preview {
    ContentView()
}
