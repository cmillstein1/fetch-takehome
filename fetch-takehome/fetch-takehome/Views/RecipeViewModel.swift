//
//  RecipeViewModel.swift
//  fetch-takehome
//
//  Created by Casey Millstein New on 1/14/25.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let service = RecipeService()

    func loadRecipes() async {
        isLoading = true
        errorMessage = nil

        do {
            recipes = try await service.fetchRecipes()
        } catch {
            errorMessage = "Failed to load recipes: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
