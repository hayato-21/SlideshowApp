//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by 大山隼人 on 2019/12/12.
//  Copyright © 2019 大山隼人. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {

    @IBOutlet weak var expandView: UIImageView!
    var x: String=""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        expandView.image = UIImage(named: x)
    }
    

}
