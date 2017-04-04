//
//  ViewController.swift
//  TeamFitnessApp
//
//  Created by Patrick O'Leary on 4/3/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let store = HealthKidManager.sharedInstance


    override func viewDidLoad() {


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resorces that can be recreated.
    }

  override func viewWillAppear(_ animated: Bool) {
    if store.requestHealthKitAuth() {
      print("good")
    } else {
      print("bad")
    }
  }
}

