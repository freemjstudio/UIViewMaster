//
//  BlueViewController.swift
//  UIViewMaster
//
//  Created by CAUAD14 on 2018/09/03.
//  Copyright © 2018年 wooo000ooo000ooo. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var touchBox: UIButton!
    
    @IBAction func touchAction(_ sender: Any) {
     dismiss(animated: true, completion: nil)
    }
    
    
    //버튼 터치되면 BlueVC 사라짐 ViewController가 나옴. (이전 view)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
