//
//  ViewController.swift
//  Moviest
//
//  Created by wannabewize on 2016. 6. 23..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit
import Alamofire

struct MovieInfo {
   var movieId : Int!
   var title : String!
}

let ServerAddress = "http://192.168.0.30:3000/movies"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   @IBOutlet weak var tableView: UITableView!
   
   
   
   var movies = [MovieInfo]()
   
   @IBAction func resolveMovieList(sender: AnyObject) {
      movies.removeAll()
      
      Alamofire.request(.GET, ServerAddress).responseJSON { (response : Response<AnyObject, NSError>) in
         print(response)
         if let root = response.result.value as? NSDictionary,
            let movieList = root["data"] as? NSArray {
            for item in movieList {
               let id = item["id"] as! Int
               let title = item["title"] as! String
               let movie = MovieInfo(movieId: id, title: title)
               self.movies.append(movie)
            }
            self.tableView.reloadData()
         }
      }
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return movies.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath)
      let movie = movies[indexPath.row]
      cell.textLabel?.text = movie.title
      return cell
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

