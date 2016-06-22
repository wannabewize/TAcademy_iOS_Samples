//
//  ComposeViewController.swift
//  Moviest
//
//  Created by wannabewize on 2016. 6. 23..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit
import Alamofire

class ComposeViewController: UIViewController {

   @IBOutlet weak var titleField: UITextField!
   @IBOutlet weak var directorField: UITextField!
   
   @IBOutlet weak var yearField: UITextField!
   @IBOutlet weak var synopsis: UITextView!
   
   @IBAction func cancelCompose(sender: AnyObject) {
      self.dismissViewControllerAnimated(true, completion: nil)
   }
   
   @IBAction func composeMovieInfo(sender: AnyObject) {
      saveMovieInfo()
      self.dismissViewControllerAnimated(true, completion: nil)
   }
   
   func saveMovieInfo() {
      let params : [String : AnyObject] = [
         "title": titleField.text!,
         "director" : directorField.text!,
         "year" : yearField.text!
      ]
      
      Alamofire.request(.POST, ServerAddress, parameters: params, encoding: .URL, headers: nil)
         .responseJSON { (response : Response<AnyObject, NSError>) in
         print(response)
      }
   }
}
