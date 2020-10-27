//
//  ViewController.swift
//  LifecycleApp
//
//  Created by 山崎定知 on 2020/10/25.
//  Copyright © 2020 山崎定知. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var moveBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height

        moveBtn.frame = CGRect(x:screenWidth/4, y:screenHeight/2,
        width:screenWidth/2, height:50)
        print("viewDidLoad_1")
        print("初期viewのロード後に呼び出される")
        print("")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear_1")
        print("初期view表示前に呼び出される")
        print("")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear_1")
        print("初期view表示後に呼び出される")
        print("")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear_1")
        print("初期viewが表示されなくなる前に呼び出される")
        print("")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear_1")
        print("初期viewが表示されなくなった後に呼び出される")
        print("")
    }

}

