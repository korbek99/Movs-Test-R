//
//  MovFavoritesViewModel.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 06-08-24.
//  Copyright © 2024 Jose David Bustos H. All rights reserved.
//

import CoreData
import UIKit

class MovFavoritesViewModel {

    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext) {
        self.context = context
    }

    
    func addMovie(adult: Bool, backdropPath: String, genreIDS: Int, id: Int, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
        let newMovie = MovFavorites(context: context)
        newMovie.adult = adult
        newMovie.backdropPath = backdropPath
        newMovie.genreIDS = Int32(genreIDS)
        newMovie.id = Int32(Int64(id))
        newMovie.originalLanguage = originalLanguage
        newMovie.originalTitle = originalTitle
        newMovie.overview = overview
        newMovie.popularity = popularity
        newMovie.posterPath = posterPath
        newMovie.releaseDate = releaseDate
        newMovie.title = title
        newMovie.video = video
        newMovie.voteAverage = voteAverage
        newMovie.voteCount = Int32(Int64(voteCount))
        
        saveContext()
    }
    
    
    func fetchAllMovies() -> [MovFavorites] {
        let fetchRequest: NSFetchRequest<MovFavorites> = MovFavorites.fetchRequest()
        
        do {
            let movies = try context.fetch(fetchRequest)
            return movies
        } catch {
            print("Failed to fetch movies: \(error)")
            return []
        }
    }
    
    
    func updateMovie(movie: MovFavorites, withUpdatedData updatedData: MovFavorites) {
        movie.adult = updatedData.adult
        movie.backdropPath = updatedData.backdropPath
        movie.genreIDS = updatedData.genreIDS
        movie.id = updatedData.id
        movie.originalLanguage = updatedData.originalLanguage
        movie.originalTitle = updatedData.originalTitle
        movie.overview = updatedData.overview
        movie.popularity = updatedData.popularity
        movie.posterPath = updatedData.posterPath
        movie.releaseDate = updatedData.releaseDate
        movie.title = updatedData.title
        movie.video = updatedData.video
        movie.voteAverage = updatedData.voteAverage
        movie.voteCount = updatedData.voteCount
        
        saveContext()
    }
    
    
    func deleteMovie(movie: MovFavorites) {
        context.delete(movie)
        saveContext()
    }
    
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}

