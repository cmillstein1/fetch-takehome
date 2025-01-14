//
//  ContentView.swift
//  fetch-takehome
//
//  Created by Casey Millstein New on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
                    Group {
                        if viewModel.isLoading {
                            ProgressView("Loading...")
                        } else if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        } else if viewModel.recipes.isEmpty {
                            Text("No recipes available.")
                                .multilineTextAlignment(.center)
                        } else {
                            List(viewModel.recipes) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    RecipeRowView(recipe: recipe)
                                }
                            }
                        }
                    }
                    .navigationTitle("Recipes")
                    .onAppear {
                        Task {
                            await viewModel.loadRecipes()
                        }
                    }
                }
    }
}

#Preview {
    ContentView()
}
