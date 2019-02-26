//
//  OpenScreenVC.swift
//  Music app
//
//  Created by shoaib ramjaun on 2019-02-24.
//  Copyright © 2019 shoaib ramjaun. All rights reserved.
//

import UIKit

class OpenScreenVC: UIViewController {

    @IBOutlet weak var SignUpButtonOutlet: UIButton!
    @IBOutlet weak var SignInButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
SignInButtonOutlet.layer.cornerRadius = 15
        SignUpButtonOutlet.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
