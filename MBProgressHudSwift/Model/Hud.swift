//
//  Hud.swift
//  MBProgressHudSwift
//
//  Created by Ahmed Eid on 6/7/20.
//  Copyright © 2020 Ahmed Eid. All rights reserved.
//

import UIKit
import MBProgressHUD

class Hud {
    
    let title: String
    let action: HudAction
    
    
    enum HudAction {
        case indeterminatedExample,
        labelExample,
        detailLabelExample,
        determinatedExample,
        annularDeterminatedExample,
        barDeterminatedExample,
        textExample,
        customView,
        cancelationExample,
        modeSwitchingExample,
        windowExample,
        networkingExample,
        dimBackgroundExample,
        coloredExample
    }
    
    
    init(title: String, action: HudAction) {
        self.title = title
        self.action = action
    }
    
    static func runHud(_ action: HudAction, onView: UIView, onWindow: UIWindow) {
        switch action {
            case .indeterminatedExample:      indeterminatedExample(view: onView)
            case .labelExample:               labelExample(view: onView)
            case .detailLabelExample:         detailLabelExample(view: onView)
            case .determinatedExample:        determinatedExample(view: onView)
            case .annularDeterminatedExample: annularDeterminatedExample(view: onView)
            case .barDeterminatedExample:     barDeterminatedExample(view: onView)
            case .textExample:                textExample(view: onView)
            case .customView:                 customView(view: onView)
            case .cancelationExample:         cancelationExample(view: onView)
            case .modeSwitchingExample:       modeSwitchingExample(view: onView)
            case .windowExample:              windowExample(window: onWindow)
            case .networkingExample:          networkingExample(view: onView)
            case .dimBackgroundExample:       dimBackgroundExample(view: onView)
            case .coloredExample:             colorExample(view: onView)
        }
    }
    
    fileprivate static func indeterminatedExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        stopProgress(forHud: hud)
    }
    
    fileprivate static func labelExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Loading..."
        stopProgress(forHud: hud)
    }
    
    fileprivate static func detailLabelExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Loading..."
        hud.detailsLabel.text = "Progess in (20/20)"
        stopProgress(forHud: hud)
    }
    
    fileprivate static func determinatedExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .determinate
        hud.label.text = "Loading..."
        stopDeterminedProgress(forHud: hud)
    }
    
    fileprivate static func annularDeterminatedExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .determinate
        hud.label.text = "Loading..."
        stopDeterminedProgress(forHud: hud)
    }
    
    fileprivate static func barDeterminatedExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .determinateHorizontalBar
        hud.label.text = "Loading..."
        stopDeterminedProgress(forHud: hud)
    }
    
    fileprivate static func textExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = "Money send succussfully."
        hud.offset = CGPoint(x: 0.0, y: MBProgressMaxOffset)
        hud.hide(animated: true, afterDelay: 3)
    }
    
    fileprivate static func customView(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        hud.label.text = "Verified"
        hud.customView = UIImageView(image: UIImage(named: "verified"))
        hud.hide(animated: true, afterDelay: 3)
    }
    
    fileprivate static func cancelationExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .determinate
        hud.label.text = "Loading..."
        hud.button.setTitle("Cancel", for: .normal)
        hud.button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        stopDeterminedProgress(forHud: hud)
    }
    
    fileprivate static func modeSwitchingExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = "Prepaing..."
        DispatchQueue.global(qos: .background).async {
            doSomethingWithMixedProgress(on: hud)
            DispatchQueue.main.async {
                hud.hide(animated: true)
            }
        }
    }
    
    fileprivate static func windowExample(window: UIWindow) {
        let hud = MBProgressHUD.showAdded(to: window, animated: true)
        hud.mode = .indeterminate
        stopProgress(forHud: hud)
    }
    
    fileprivate static func networkingExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Downloading..."
        doNetworkingTaskWithProgress(on: hud)
        
    }
    
    fileprivate static func dimBackgroundExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.backgroundView.style = .solidColor
        hud.backgroundView.color = UIColor(white: 0.0, alpha: 0.1)
        stopProgress(forHud: hud)
    }
    
    fileprivate static func colorExample(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.contentColor = .green
        hud.label.text = "Green..."
        stopProgress(forHud: hud)
    }
    
    
    
    //MARK:- Assets Methods
    
    fileprivate static func stopProgress(forHud hud: MBProgressHUD) {
        DispatchQueue.global(qos: .background).async {
            doSomething()
            DispatchQueue.main.async {
                hud.hide(animated: true)
            }
        }
    }
    
    fileprivate static func stopDeterminedProgress(forHud hud: MBProgressHUD) {
        DispatchQueue.global(qos: .background).async {
            doSomethignWithProgress(on: hud)
            DispatchQueue.main.async {
                hud.hide(animated: true)
            }
        }
    }
    
    fileprivate static func doSomethingWithMixedProgress(on hud: MBProgressHUD) {
        sleep(2)
        DispatchQueue.main.async {
            hud.mode = .determinate
            hud.label.text = "Loading..."
        }
        var progress: Float = 0.0
        while progress < 1.0 {
            progress += 0.1
            DispatchQueue.main.async {
                hud.progress = progress
            }
            usleep(50000)
        }
        
        DispatchQueue.main.async {
            hud.mode = .indeterminate
            hud.label.text = "Verifying..."
        }
        sleep(3)
        DispatchQueue.main.async {
            hud.mode = .customView
            hud.label.text = "Verified"
            hud.isSquare = true
            hud.customView = UIImageView(image: UIImage(named: "verified"))
        }
        sleep(2)
        
    }
    
    fileprivate static func doSomething() {
        sleep(5)
    }
    
    fileprivate static var isCancled = false
    
    fileprivate static func doSomethignWithProgress(on hud: MBProgressHUD) {
        isCancled = false
        var progress: Float = 0.0
        while progress < 1.0 {
            if isCancled { return }
            progress += 0.1
            DispatchQueue.main.async {
                hud.progress = progress
            }
            usleep(50000)
        }
    }
    @objc fileprivate static func cancelAction() {
        isCancled = true
    }
    
    fileprivate static func doNetworkingTaskWithProgress(on hud: MBProgressHUD) {
        guard let url = URL(string: "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/HT1425/sample_iPod.m4v.zip") else {
            hud.mode = .text
            hud.label.text = "Networking Error"
            hud.detailsLabel.text = "Please, check you internet connection, and try again later"
            hud.hide(animated: true, afterDelay: 3)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    hud.mode = .text
                    hud.label.text = "Networking Error"
                    hud.detailsLabel.text = "Please, check you internet connection, and try again later"
                    hud.hide(animated: true, afterDelay: 3)
                }
            }
            if let _ = data {
                DispatchQueue.main.async {
                    hud.mode = .customView
                    hud.label.text = "Done"
                    hud.customView = UIImageView(image: UIImage(named: "verified"))
                    hud.hide(animated: true, afterDelay: 3)
                }
            }
        }
        task.resume()

    }
    
}
