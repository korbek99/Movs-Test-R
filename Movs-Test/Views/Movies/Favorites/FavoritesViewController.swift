//
//  FavoritesViewController.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 06-08-24.
//  Copyright © 2024 Jose David Bustos H. All rights reserved.
//
import UIKit
import CoreData

class FavoritesViewController: UIViewController {

    let viewModel = MovFavoritesViewModel()
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.identifier)
        table.rowHeight = 120.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var movies: [MovFavorites] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        view.backgroundColor = .white
        setupTableView()
        fetchAndReloadData()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func fetchAndReloadData() {
        movies = viewModel.fetchAllMovies()
        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        let movieModel = FavoritesTableModel(originalTitle: movie.originalTitle ?? "",
                                             overview: movie.overview ?? "",
                                             backdropPath: movie.posterPath ?? "",
                                             language: movie.originalLanguage ?? "")
        cell.configureView(movies: movieModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let detailVC = FavoritesDetailsViewController()
        //detailVC.movies = selectedMovie
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let movieToDelete = movies[indexPath.row]
            viewModel.deleteMovie(movie: movieToDelete)
            fetchAndReloadData() 
        }
    }
}
