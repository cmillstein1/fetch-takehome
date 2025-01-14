//
//  RecipeDetailView.swift
//  fetch-takehome
//
//  Created by Casey Millstein New on 1/14/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: recipe.photoURLLarge) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)

                Text("Cuisine: \(recipe.cuisine)")
                    .font(.subheadline)
                
//                Text("Instructions:")
//                    .font(.headline)
//                
//                Text(recipe.instructions ?? "No instructions available.")
//                    .padding(.top, 5)

                HStack {
                    Button(action: {
                        if let sourceURL = recipe.sourceURL {
                            UIApplication.shared.open(sourceURL)
                        }
                    }) {
                        Text("View Source")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.top, 10)

                    Button(action: {
                        if let youtubeURL = recipe.youtubeURL {
                            UIApplication.shared.open(youtubeURL)
                        }
                    }) {
                        Text("Watch on YouTube")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    .padding(.top, 10)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
