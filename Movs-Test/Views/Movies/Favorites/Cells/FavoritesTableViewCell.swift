//
//  FavoritesTableViewCell.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 06-08-24.
//  Copyright © 2024 Jose David Bustos H. All rights reserved.
//
import UIKit

struct FavoritesTableModel {
    let originalTitle: String
    let overview: String
    let backdropPath: String
    let language: String
}
class FavoritesTableViewCell: UITableViewCell {
    let pathWebpicture = "http://image.tmdb.org/t/p/w500"
    static let identifier = "FavoritesTableViewCell"
 
    lazy var ImageView: UIImageView = {
        let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
           imageView.layer.cornerRadius = 10.0
           imageView.layer.masksToBounds = true
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.image = UIImage(named: "task")
           return imageView
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageCache = NSCache<NSString, UIImage>()

    func configureView(movies: FavoritesTableModel) {
        titleLabel.text = "\(movies.originalTitle)"
        langLabel.text = "Language: \(movies.language)"
        
        let imageUrlString = pathWebpicture + movies.backdropPath
        
        if let cachedImage = imageCache.object(forKey: imageUrlString as NSString) {
            imageView!.image = cachedImage
        } else if let imageUrl = URL(string: imageUrlString) {
            downloadImage(from: imageUrl) { [weak self] image in
                DispatchQueue.main.async {
                    if let image = image {
                        self?.imageCache.setObject(image, forKey: imageUrlString as NSString)
                        self?.imageView?.image = image
                    }
                }
            }
        }
    }

    private func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

    
    func setupUI() {
        contentView.addSubview(ImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descripLabel)
        contentView.addSubview(langLabel)
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            ImageView.widthAnchor.constraint(equalToConstant: 100),
            ImageView.heightAnchor.constraint(equalToConstant: 100),
       
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: ImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            descripLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descripLabel.leadingAnchor.constraint(equalTo: ImageView.trailingAnchor, constant: 10),
            descripLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            langLabel.topAnchor.constraint(equalTo: descripLabel.bottomAnchor, constant: 5),
            langLabel.leadingAnchor.constraint(equalTo: ImageView.trailingAnchor, constant: 10),
            langLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
