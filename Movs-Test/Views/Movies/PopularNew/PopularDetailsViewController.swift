//
//  PopularDetailsViewController.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 06-08-24.
//  Copyright © 2024 Jose David Bustos H. All rights reserved.
//

import UIKit

class PopularDetailsViewController: UIViewController {
    var movies: Movie?
    let pathWebpicture = "http://image.tmdb.org/t/p/w500"
    let viewModel = MovFavoritesViewModel()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10.0
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var descripLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var langLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save to Favorites", for: .normal)
        button.addTarget(self, action: #selector(saveToFavorites), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details Popular"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        configureDetailView()
    }

    func configureDetailView() {
        guard let movies = movies else { return }
        titleLabel.text = "Title: " + movies.originalTitle
        descripLabel.text = "Description: " + movies.overview
   
        if let imageUrl = URL(string: pathWebpicture + movies.backdropPath) {
            downloadImage(from: imageUrl) { [weak self] image in
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        }
    }

    private func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }
        task.resume()
    }

    @objc func saveToFavorites() {
        guard let movies = movies else { return }
        
        viewModel.addMovie(adult: movies.adult,
                           backdropPath: movies.backdropPath,
                           genreIDS: movies.genreIDS.first ?? 0,
                           id: movies.id,
                           originalLanguage: movies.originalLanguage,
                           originalTitle: movies.originalTitle,
                           overview: movies.overview,
                           popularity: movies.popularity,
                           posterPath: movies.posterPath,
                           releaseDate: movies.releaseDate,
                           title: movies.title,
                           video: movies.video,
                           voteAverage: movies.voteAverage,
                           voteCount: movies.voteCount)
        
        let alert = UIAlertController(title: "Saved", message: "Movie added to favorites!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descripLabel)
        contentView.addSubview(langLabel)
        contentView.addSubview(saveButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descripLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descripLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descripLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            langLabel.topAnchor.constraint(equalTo: descripLabel.bottomAnchor, constant: 20),
            langLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            langLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            saveButton.topAnchor.constraint(equalTo: langLabel.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
