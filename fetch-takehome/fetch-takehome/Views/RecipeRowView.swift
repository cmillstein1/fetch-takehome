//
//  RecipeRowView.swift
//  fetch-takehome
//
//  Created by Casey Millstein New on 1/14/25.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            AsyncImage(url: recipe.photoURLSmall) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
