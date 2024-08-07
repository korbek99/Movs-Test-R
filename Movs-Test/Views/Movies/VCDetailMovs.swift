//
//  VCDetailMovs.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 04-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
//
//class VCDetailMovs: UIViewController {
//    
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var LblTitle: UILabel!
//    @IBOutlet weak var LblYear: UILabel!
//    @IBOutlet weak var LblGenero: UILabel!
//    @IBOutlet weak var LblDescrip: UILabel!
//    @IBOutlet weak var stateSwitch: UISwitch!
//    var imageString:String!
//    
//    var nameString:String!
//    var yearString:String!
//    var generoString:String!
//    var decripString:String!
//    var generoArrayString:[String] = []
//    var generoArrayInt:[Int] = []
//    
//    var  votecount: Int32!
//    var  id: Int!
//    var  video: Bool!
//    var  voteaverage: Double!
//    var  popularity: Double!
//    var  posterpath: String!
//    var  originallanguage: String!
//    var  originaltitle: String!
//    var  backdroppath: String!
//    var  adult: Bool!
//    var  overview: String!
//    var  releasedate: String!
//    
//    private var GeneroList = [Generos]()
//    final let urlGenero = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=34738023d27013e6d1b995443764da44&language=en-US")
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        stateSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
//        downloadJsonGeneros()
//        updateUI()
//    }
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    
//    @IBAction func BtnStateFavorites(_ sender: Any) {
//        
//        if stateSwitch.isOn {
//            print("The Switch Favorites is Off")
//           // goDeteleItem(id: id)
//            //stateSwitch.setOn(false, animated:true)
//        } else {
//            print("The Switch Favorites is On")
//           // GoToActionFavorite()
//            //stateSwitch.setOn(true, animated:true)
//        }
//    }
//    @objc func stateChanged(switchState: UISwitch) {
//        if switchState.isOn {
//            //textLabel.text = "The Switch is On"
//        } else {
//            //textLabel.text = "The Switch is Off"
//        }
//    }
//    
//    func downloadJsonGeneros()
//    {
//        self.GeneroList.removeAll()
//        guard let downloadURLs = urlGenero else { return }
//        URLSession.shared.dataTask(with: downloadURLs) { data, urlResponse, error in
//            guard let data = data, error == nil, urlResponse != nil else {
//                print("algo fallo generos")
//                return
//            }
//            print("descargado generos")
//            do
//            {
//                let decoder = JSONDecoder()
//                let downloadedgeneros = try decoder.decode(Generos.self, from: data)
//                self.GeneroList = [downloadedgeneros]
//                print(self.GeneroList)
//                /*DispatchQueue.main.async {
//                 self.myCollectionView.reloadData()
//                 }*/
//            } catch {
//                print("ocurrio un error despues de descarga generos")
//            }
//            }.resume()
//    }
//    func updateUI() {
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy"
//        let date = dateFormatter.date(from: yearString)
//        
//        self.LblTitle.text = nameString
//        self.LblYear.text = yearString // String(describing: date)
//        self.LblGenero.text = generoString
//        self.LblDescrip.text = decripString
//        self.LblDescrip.numberOfLines = 12
//        self.LblDescrip.lineBreakMode = .byWordWrapping
//        let imgURL = URL(string:imageString)
//        let data = NSData(contentsOf: (imgURL)!)
//        self.imageView.image = UIImage(data: data as! Data)
//    }
//    func GoToActionFavorite()
//    {
////        if ( MovFavoriteCore().saveDataToCoreData(
////            votecount: Int(Int32(votecount)),
////            id: Int(id),
////            video: video,
////            voteaverage: voteaverage,
////            title: nameString,
////            popularity: popularity,
////            posterpath: posterpath,
////            originallanguage: originallanguage,
////            originaltitle: originaltitle,
////            backdroppath: backdroppath,
////            adult: adult,
////            overview: overview,
////            releasedate: releasedate) == true )
////        {}else{
////            
////        }
//    }
//    func goDeteleItem(id: Int)
//    {
//        //CoreDataManager.deleteItemCore(withID: Int32(id))
//    }
//    
//    @IBAction func BtnBackMovies(_ sender: Any) {
//        goToMovies()
//    }
//    func goToMovies()
//    {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
//        self.present(controller, animated: true, completion: nil)
//    }
//    
//}
