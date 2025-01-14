//
//  ImageCacheHelper.swift
//  fetch-takehome
//
//  Created by Casey Millstein New on 1/14/25.
//

import Foundation
import UIKit

class ImageCacheHelper {
    static func loadImage(from url: URL) -> UIImage? {
        let cacheURL = getCacheURL(for: url)
        if let cachedImage = loadImageFromCache(at: cacheURL) {
            return cachedImage
        }
        
        fetchAndCacheImage(from: url, to: cacheURL)
        return nil
    }
    
    private static func getCacheURL(for url: URL) -> URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent(url.lastPathComponent)
    }
    
    private static func loadImageFromCache(at url: URL) -> UIImage? {
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: imageData)
    }
    
    private static func fetchAndCacheImage(from url: URL, to cacheURL: URL) {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    saveImageToCache(image, at: cacheURL)
                }
            } catch {
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
    
    private static func saveImageToCache(_ image: UIImage, at url: URL) {
        guard let imageData = image.pngData() else { return }
        try? imageData.write(to: url)
    }
}
