//
//  SecondViewController.swift
//  LifecycleApp
//
//  Created by 山崎定知 on 2020/10/25.
//  Copyright © 2020 山崎定知. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            print("viewDidLoad_2")
            print("遷移後viewのロード後に呼び出される")
            print("")
            
        }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear_2")
        print("遷移後view表示前に呼び出される")
        print("")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear_2")
        print("遷移後view表示後に呼び出される")
        print("")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear_2")
        print("遷移後viewが表示されなくなる前に呼び出される")
        print("")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear_2")
        print("遷移後viewが表示されなくなった後に呼び出される")
        print("")
    }

}
