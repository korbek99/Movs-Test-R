//
//  ViewController.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 03-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit
import CoreData
import Foundation

//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//    @IBOutlet weak var searchBar: UISearchBar!
//    @IBOutlet weak var myCollectionView: UICollectionView!
//    
//    let arrayGeneros:[String] = []
//    let array:[String] = []
//    //let array:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
//    
//    final let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44")
//    
//    let pathWebpicture = "http://image.tmdb.org/t/p/w500"
//    
//    private var peliculas = [Result]()
//    
//    private var peliculasArray = [Result]()
//    
//    var imgURLArray = [String]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        downloadJsonPopular()
//        //downloadJsonGeneros()
//        self.myCollectionView.dataSource = self
//        self.myCollectionView.delegate = self
//   
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//    }
//    
//    func downloadJsonPopular() {
//        self.peliculas.removeAll()
//        guard let downloadURL = url else { return }
//        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
//            guard let data = data, error == nil, urlResponse != nil else {
//                print("algo fallo")
//                return
//            }
//            print("descargado")
//            do
//            {
//                let decoder = JSONDecoder()
//                let downloadedMovies = try decoder.decode(Movies.self, from: data)
//                self.peliculas = downloadedMovies.results
//                DispatchQueue.main.async {
//                    self.myCollectionView.reloadData()
//                }
//            } catch {
//                print("ocurrio un error despues de descarga")
//            }
//            }.resume()
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    //Number of views
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return peliculas.count
//    }
//    
//    //Movies view
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//    {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
//        cell.titleMov.text = peliculas[indexPath.row].title
//        var paths = String(self.pathWebpicture) + String(peliculas[indexPath.row].poster_path)
//        if let imageURL = URL(string:paths) {
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: imageURL)
//                if let data = data {
//                    let image = UIImage(data: data)
//                    DispatchQueue.main.async {
//                        cell.imageViewMov.image = image
//                    }
//                }
//            }
//        }
//        return cell
//    }
//
//     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       print("action de collectionView")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "VCDetailMovs") as! VCDetailMovs
//        controller.id  = Int(peliculas[indexPath.row].id)
//        controller.nameString = String(peliculas[indexPath.row].title)
//        controller.decripString = peliculas[indexPath.row].overview
//        controller.yearString = String(peliculas[indexPath.row].release_date)
//        
//        controller.votecount  = Int32(peliculas[indexPath.row].vote_count)
//        controller.video  = peliculas[indexPath.row].video
//        controller.voteaverage  = peliculas[indexPath.row].vote_average
//        controller.popularity  = peliculas[indexPath.row].popularity
//        controller.posterpath  = peliculas[indexPath.row].poster_path
//        controller.originallanguage  = peliculas[indexPath.row].original_language
//        controller.originaltitle  = peliculas[indexPath.row].original_title
//        controller.backdroppath  = peliculas[indexPath.row].backdrop_path
//        controller.adult  = peliculas[indexPath.row].adult
//        controller.overview  = peliculas[indexPath.row].overview
//
//        
//        
//        print("Generos Peliculas  = \(peliculas[indexPath.row].genre_ids)")
//        
//       controller.generoArrayInt =  peliculas[indexPath.row].genre_ids
//        
//        peliculas[indexPath.row].genre_ids.forEach {
//            print($0)
//        }
//        
//        controller.imageString = String(self.pathWebpicture) + String(peliculas[indexPath.row].poster_path)
//        
//        self.present(controller, animated: true, completion: nil)
//    }
//
//    func SaveData()
//     {
//       if ( MovFavoriteCore().saveDataToCoreData(
//          votecount: 474,
//          id: 329996,
//          video: false,
//          voteaverage: 6.8,
//          title: "Dumbo",
//          popularity: 257.98,
//          posterpath: "/ttN0czDnCpr64aj3ANGEf3DKE1L.jpg",
//          originallanguage: "en",
//          originaltitle: "Dumbo",
//         // genreids: [28,12,878],
//          backdroppath: "/tz27bm8LAqK0SlX8TwXrtS9OiBB.jpg",
//          adult: false,
//          overview: "A young elephant, whose oversized ears enable him to fly, helps save a struggling circus, but when the circus plans a new venture, Dumbo and his friends discover dark secrets beneath its shiny veneer.",
//          releasedate: "2019-03-27") == true )
//       {
//        
//        }else{
//        
//        }
//    }
//}

