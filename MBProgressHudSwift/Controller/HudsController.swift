//
//  HudsController.swift
//  MBProgressHudSwift
//
//  Created by Ahmed Eid on 6/7/20.
//  Copyright © 2020 Ahmed Eid. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HudsController: UICollectionViewController {

    let hud00 = Hud(title: "Indeterminated mode", action: .indeterminatedExample)
    let hud01 = Hud(title: "With label", action: .labelExample)
    let hud02 = Hud(title: "With details", action: .detailLabelExample)
    
    let hud10 = Hud(title: "Determinated mode", action: .determinatedExample)
    let hud11 = Hud(title: "Annular Determinated mode", action: .annularDeterminatedExample)
    let hud12 = Hud(title: "Bar Determinated mode", action: .barDeterminatedExample)
    
    let hud20 = Hud(title: "Text only", action: .textExample)
    let hud21 = Hud(title: "Custom view", action: .customView)
    let hud22 = Hud(title: "Determine With Action", action: .cancelationExample)
    let hud23 = Hud(title: "Mode Switching", action: .modeSwitchingExample)
    
    let hud30 = Hud(title: "On window", action: .windowExample)
    let hud31 = Hud(title: "Networking task", action: .networkingExample)
    let hud32 = Hud(title: "Dim Background", action: .dimBackgroundExample)
    let hud33 = Hud(title: "Color", action: .coloredExample)
    lazy var huds: [[Hud]] = [[hud00, hud01, hud02],
                              [hud10, hud11, hud12],
                              [hud20, hud21, hud22, hud23],
                              [hud30, hud31, hud32, hud33]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        navigationItem.title = "MBProgressHudSwift"
        // Register cell classes
        self.collectionView!.register(CollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return huds.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return huds[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
    
        cell.title.text = huds[indexPath.section][indexPath.row].title
        return cell
    }
    

}
extension HudsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 45.0)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let navView = navigationController?.view else { return }
        guard let window = view.window else { return }
        Hud.runHud(huds[indexPath.section][indexPath.row].action, onView: navView, onWindow: window)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
