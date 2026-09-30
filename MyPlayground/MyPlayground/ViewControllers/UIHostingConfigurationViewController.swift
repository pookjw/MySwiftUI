//
//  UIHostingConfigurationViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 9/30/26.
//

import UIKit
import MySwiftUI

final class UIHostingConfigurationViewController : UICollectionViewController {
    private let cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, Int>
    
    init() {
        self.cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { cell, indexPath, itemIdentifier in
            cell.contentConfiguration = UIHostingConfiguration {
                AnyView(MyLabel(text: itemIdentifier.description))
            }
        }
        
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let collectionViewLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration, for: indexPath, item: indexPath.item)
    }
}
