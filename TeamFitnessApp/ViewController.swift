//
//  ViewController.swift
//  TeamFitnessApp
//
//  Created by Patrick O'Leary on 4/3/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

<<<<<<< HEAD
//import UIKit
//
//class ViewController: UIViewController {
//
//    let store = HealthKidManager.sharedInstance
//
//
//    override func viewDidLoad() {
//       
//    }
//
//
//  override func viewWillAppear(_ animated: Bool) {
//    if store.requestHealthKitAuth() {
//      print("good")
//    } else {
//      print("bad")
//    }
//  }
//
//}
=======
import UIKit

class ViewController: UIViewController {

    let store = HealthKidManager.sharedInstance


    override func viewDidLoad() {
       FirebaseManager.generateTestData()

    }

  override func viewWillAppear(_ animated: Bool) {
    if store.requestHealthKitAuth() {
      print("good")
    } else {
      print("bad")
    }
  }

}
>>>>>>> master


