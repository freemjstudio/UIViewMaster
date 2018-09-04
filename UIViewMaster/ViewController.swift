//
//  ViewController.swift
//  UIViewMaster
//
//  Created by CAUAD14 on 2018/09/03.
//  Copyright © 2018年 wooo000ooo000ooo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nextButton: UIButton!
    
    /// Gives the blueButton its design
    func designButton() {
        // Make the button a circle
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        // Give the button a shadow to make it seem like its floating on top of the screen
        nextButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        nextButton.layer.shadowColor = UIColor.black.cgColor
        nextButton.layer.shadowRadius = 4
        nextButton.layer.shadowOpacity = 1
    }
    
    func makeButtonPop() {
        // Animate the Button growing to 1 1/4 its size
        UIView.animate(withDuration: 0.25, delay: 0.5, options: [.curveEaseIn, .allowUserInteraction], animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }) { (_) in
            // Animate the Button shrinking back to its original size
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                self.nextButton.transform = .identity
            }, completion: nil)
        }
    }
    
    /// Animates the blueButton onto the screen from above the view
    func animateButtonOnScreen() {
        // Set the blueButton's y position above the view
        let yPosition = -(view.frame.height / 2) - (nextButton.frame.height)
        self.nextButton.transform = CGAffineTransform(translationX: 0, y: yPosition)
        // Animate the blueButton moving back to its orginal y position
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.nextButton.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    /// Animates the blueButton moving up and off the screen
    func animateButtonOffScreen() {
        // Set the transform to above the top of the view
        let transform = CGAffineTransform(translationX: 0, y: -(view.frame.height / 2) - (nextButton.frame.height))
        // Animate the blueButton moving up to the transform above
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.nextButton.transform = transform
        }, completion: nil)
    }
    
    /// Keeps track of what color the backgroundColor should be
    var colorIndex = 0
    
    /// Changes the backgroundColor of the view
    func changeBackgroundColor() {
        let backgroundColors: [UIColor] = [.yellow, .red, .purple, .white]
        // Reset the colorIndex when it reaches the end of the backgroundColors array
        if colorIndex == backgroundColors.count {
            colorIndex = 0
        }
        let color = backgroundColors[colorIndex]
        
        view.backgroundColor = color
        // Increment colorIndex
        colorIndex += 1
    }
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designButton()
        
        // Do any additional setup after loading the view, typically from a nib.
        // Called when you create the class and load from xib. Great for initial setup and one-time-only work.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animateButtonOnScreen()
        // Called right before your view appears, good for hiding/showing fields or any operations that you want to happen every time before the view is visible. Because you might be going back and forth between views, this will be called every time your view is about to appear on the screen.
        
        // 보기가 나타나기 바로 전에 호출되며, 보기가 표시되기 전에 항상 수행하려는 필드 또는 작업에 적합합니다. 보기 간에 앞뒤로 이동할 수 있으므로 화면에 보기가 나타날 때마다 이 내용이 호출됩니다.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        makeButtonPop()
        // Called after the view appears - great place to start an animations or the loading of external data from an API.
    }
    
    
    //  뷰가 사라질 때
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animateButtonOffScreen()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeBackgroundColor()
    }
    
    //ios8에서는 모든 회전 방법이 더 이상 사용되지 않는다.
    
    //rotation code
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print(UIDevice.current.orientation.isLandscape)
    }
    
    
/*    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
     }
*/
    
  //  override var supportedInterfaceOrientations: UIInterfaceOrientationMask // ios 6 7 에서는 이걸 사용함
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

