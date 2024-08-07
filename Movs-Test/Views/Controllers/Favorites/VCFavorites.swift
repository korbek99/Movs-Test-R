//
//  VCFavorites.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 04-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
import CoreData
//class VCFavorites: UIViewController,UITableViewDataSource ,UITableViewDelegate {
//
//    let pathWebpicture = "http://image.tmdb.org/t/p/w500"
//    @IBOutlet weak var tableView: UITableView!
//    private var favoritos = [itemsCore]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // SaveData()
//        updateData()
//        print(" favoritos " + String(favoritos.count))
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    func updateData() {
//        favoritos = CoreDataManager.fetchObj()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favoritos.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else { return UITableViewCell() }
//
//        let calendar = Calendar.current
//
//        cell.textTitle.text = favoritos[indexPath.row].title
//        cell.textDescp.text =   favoritos[indexPath.row].overview
//        cell.textDate.text =  favoritos[indexPath.row].releasedate
//
//        let paths = String(self.pathWebpicture) + favoritos[indexPath.row].posterpath!
//        if let imageURL = URL(string:paths) {
//            print(imageURL)
//                let data = try? Data(contentsOf: imageURL)
//                if let data = data {
//                    let image = UIImage(data: data)
//                        cell.imageViewCell.image = image
//                }
//        }
//
//        return cell
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
//    {
//        if editingStyle == UITableViewCellEditingStyle.delete
//        {
//            favoritos.remove(at: indexPath.row)
//            //CoreDataManager.deleteItemCore(withID: favoritos[indexPath.row].id!)
//            updateData()
//            tableView.reloadData()
//        }
//    }
//    func SaveData()
//    {
//        if ( MovFavoriteCore().saveDataToCoreData(
//            votecount: 659,
//            id: 458723,
//            video: false,
//            voteaverage: 6.8,
//            title: "Us",
//            popularity: 257.98,
//            posterpath: "/ux2dU1jQ2ACIMShzB3yP93Udpzc.jpg",
//            originallanguage: "en",
//            originaltitle: "Us",
//            // genreids: [28,12,878],
//            backdroppath: "/ADJ6V8W96It4KElY2SPZvkKPBR.jpg",
//            adult: false,
//            overview: "Husband and wife Gabe and Adelaide Wilson take their kids to their beach house expecting to unplug and unwind with friends. But as night descends, their serenity turns to tension and chaos when some shocking visitors arrive uninvited.",
//            releasedate: "2019-03-27") == true )
//        {
//
//        }else{
//
//        }
//    }
//    @IBAction func BtnRemover(_ sender: Any) {
//       // CoreDataManager.cleanCoreDataAll()
//    }
//
//   func GoToRemover()
//   {
//
//        updateData()
//   }
    
//}
