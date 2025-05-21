//
//  ContentView.swift
//  Digital Scrapbook
//
//  Created by Anna Galeano on 5/21/25.
//  Current template by XCode

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: String? = "Scrapbook"
    @State private var showingPopup = false
    
    var body: some View {
        NavigationSplitView {
            // Left sidebar : Library categories -----------------
            List(selection: $selectedCategory) {
                Label("Scrapbook", systemImage: "book").tag("Scrapbook")
                Label("Photos", systemImage: "photo").tag("Photos")
                Label("Stickers", systemImage: "star").tag("Stickers")
                Label("Backgrounds", systemImage: "rectangle.fill").tag("Backgrounds")
                Label("Quotes", systemImage: "text.quote").tag("Quotes")
            }
            .listStyle(.sidebar)
            
        } detail: {
            // Right side : Book ---------------------------------
            ZStack(alignment: .topLeading) {
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
                
                // Plus button in upper left corner
                Button {
                    showingPopup.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(.top, 60)
                .padding(.leading, 20)
                .popover(isPresented: $showingPopup, arrowEdge: .leading) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Add Elements")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        Button(action: {
                            // Add text action
                            showingPopup = false
                        }) {
                            Label("Add Text", systemImage: "text.quote")
                                .frame(width: 150, alignment: .leading)
                        }
                        .buttonStyle(.plain)
                        
                        Button(action: {
                            // Add photo action
                            showingPopup = false
                        }) {
                            Label("Add Photo", systemImage: "photo")
                                .frame(width: 150, alignment: .leading)
                        }
                        .buttonStyle(.plain)
                        
                        Button(action: {
                            // Add sticker action
                            showingPopup = false
                        }) {
                            Label("Add Sticker", systemImage: "star")
                                .frame(width: 150, alignment: .leading)
                        }
                        .buttonStyle(.plain)
                        
                        Button(action: {
                            // Add shape action
                            showingPopup = false
                        }) {
                            Label("Add Shape", systemImage: "square.fill")
                                .frame(width: 150, alignment: .leading)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Digital Scrapbook")
    }
}

#Preview {
    ContentView()
}
