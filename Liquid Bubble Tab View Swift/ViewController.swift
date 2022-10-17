//
//  ViewController.swift
//  Liquid Bubble Tab View Swift
//
//  Created by Cedan Misquith on 17/10/22.
//

import UIKit

class ViewController: UIViewController {
    var tabs:[UIViewController] = []
    let numberOfTabs = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        print("App Started")
        self.view.backgroundColor = UIColor(netHex: 0x364756)
        setUpTabs()
        setUpViewPager()
    }
    func setUpTabs(){
        for _ in 1...numberOfTabs {
            let vc = UIViewController()
            vc.view.backgroundColor = .random
            tabs.append(vc)
        }
    }
    func setUpViewPager(){
        let frame =  CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: self.view.frame.size.height - 40)
        let viewPager:WormTabStrip = WormTabStrip(frame: frame)
        self.view.addSubview(viewPager)
        viewPager.delegate = self
        viewPager.eyStyle.wormStyel = .bubble
        viewPager.eyStyle.isWormEnable = true
        viewPager.eyStyle.spacingBetweenTabs = 15
        viewPager.eyStyle.dividerBackgroundColor = .white
        viewPager.eyStyle.tabItemSelectedColor = .black
        viewPager.currentTabIndex = 3
        viewPager.buildUI()
    }
}
extension ViewController: WormTabStripDelegate {
    func wtsNumberOfTabs() -> Int {
        return numberOfTabs
    }
    func wtsTitleForTab(index: Int) -> String {
        return "Tab Number \(index)"
    }
    func wtsViewOfTab(index: Int) -> UIView {
        let view = tabs[index]
        return view.view
    }
    func wtsReachedLeftEdge(panParam: UIPanGestureRecognizer) {
        
    }
    func wtsReachedRightEdge(panParam: UIPanGestureRecognizer) {
        
    }
    func wtsDidSelectTab(index: Int) {
        print("selected index:\(index)")
    }
}
extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
