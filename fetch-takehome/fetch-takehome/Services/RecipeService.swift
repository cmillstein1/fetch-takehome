//
//  RecipeService.swift
//  fetch-takehome
//
//  Created by Casey Millstein New on 1/14/25.
//

import Foundation
import UIKit

class RecipeService {
    private let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)
        return recipeResponse.recipes
    }
    
    func loadImage(from url: URL) -> UIImage? {
        return ImageCacheHelper.loadImage(from: url)
    }
}

