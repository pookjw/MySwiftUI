//
//  DemoViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/21/25.
//

import UIKit

final class DemoViewController: UICollectionViewController {
    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, DemoViewController.Item> { cell, indexPath, item in
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = item.title
        cell.contentConfiguration = contentConfiguration
        cell.accessories = [.disclosureIndicator()]
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let item = DemoViewController.Item.allCases.last!
        let item = DemoViewController.Item.appStorageView
        pushToItem(item)
        
//        Task {
//            try! await Task.sleep(for: .seconds(1))
//            navigationController?.popViewController(animated: true)
//        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Item.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: Item.allCases.reversed()[indexPath.item])
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushToItem(DemoViewController.Item.allCases.reversed()[indexPath.item])
    }
    
    private func pushToItem(_ item: DemoViewController.Item) {
        let viewController = item.makeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DemoViewController {
    private enum Item: CaseIterable {
        case emptyView
        case anyEmptyView
        case colorBlackView
        case colorWhiteView
        case switchingColorsView
        case anyViewSwitchingView
        case bodyView
        case conditionalView
        case mutatingLayoutView
        case observableView
        case customLayoutView
        case tupleView
        case dynamicTupleView
        case mutatingTupleLayoutView
        case appearanceActionView
        case appearanceActionListView
        case stateView
        case bindingView
        case dynamicTypeSizeView
        case environmentView
        case observableEnvironmentView
        case appStorageView
        
        var title: String {
            switch self {
            case .emptyView:
                return _typeName(EmptyViewController.self, qualified: false)
            case .anyEmptyView:
                return _typeName(AnyEmptyViewController.self, qualified: false)
            case .colorBlackView:
                return _typeName(ColorBlackViewController.self, qualified: false)
            case .colorWhiteView:
                return _typeName(ColorWhiteViewController.self, qualified: false)
            case .switchingColorsView:
                return _typeName(SwitchingColorsViewController.self, qualified: false)
            case .anyViewSwitchingView:
                return _typeName(AnyViewSwitchingViewController.self, qualified: false)
            case .bodyView:
                return _typeName(BodyViewController.self, qualified: false)
            case .conditionalView:
                return _typeName(ConditionalViewController.self, qualified: false)
            case .mutatingLayoutView:
                return _typeName(MutatingLayoutViewController.self, qualified: false)
            case .observableView:
                return _typeName(ObservableViewController.self, qualified: false)
            case .customLayoutView:
                return _typeName(CustomLayoutViewController.self, qualified: false)
            case .tupleView:
                return _typeName(TupleViewController.self, qualified: false)
            case .dynamicTupleView:
                return _typeName(DynamicTupleViewController.self, qualified: false)
            case .mutatingTupleLayoutView:
                return _typeName(MutatingTupleLayoutViewController.self, qualified: false)
            case .appearanceActionView:
                return _typeName(AppearanceActionViewController.self, qualified: false)
            case .appearanceActionListView:
                return _typeName(AppearanceActionViewListController.self, qualified: false)
            case .stateView:
                return _typeName(StateViewController.self, qualified: false)
            case .bindingView:
                return _typeName(BindingViewController.self, qualified: false)
            case .dynamicTypeSizeView:
                return _typeName(DynamicTypeSizeViewController.self, qualified: false)
            case .environmentView:
                return _typeName(EnvironmentViewController.self, qualified: false)
            case .observableEnvironmentView:
                return _typeName(ObservableEnvironmentViewController.self, qualified: false)
            case .appStorageView:
                return _typeName(AppStorageViewController.self, qualified: false)
            }
        }
        
        func makeViewController() -> UIViewController {
            switch self {
            case .emptyView:
                return EmptyViewController()
            case .anyEmptyView:
                return AnyEmptyViewController()
            case .colorBlackView:
                return ColorBlackViewController()
            case .colorWhiteView:
                return ColorWhiteViewController()
            case .switchingColorsView:
                return SwitchingColorsViewController()
            case .anyViewSwitchingView:
                return AnyViewSwitchingViewController()
            case .bodyView:
                return BodyViewController()
            case .conditionalView:
                return ConditionalViewController()
            case .mutatingLayoutView:
                return MutatingLayoutViewController()
            case .observableView:
                return ObservableViewController()
            case .customLayoutView:
                return CustomLayoutViewController()
            case .tupleView:
                return TupleViewController()
            case .dynamicTupleView:
                return DynamicTupleViewController()
            case .mutatingTupleLayoutView:
                return MutatingTupleLayoutViewController()
            case .appearanceActionView:
                return AppearanceActionViewController()
            case .appearanceActionListView:
                return AppearanceActionViewListController()
            case .stateView:
                return StateViewController()
            case .bindingView:
                return BindingViewController()
            case .dynamicTypeSizeView:
                return DynamicTypeSizeViewController()
            case .environmentView:
                return EnvironmentViewController()
            case .observableEnvironmentView:
                return ObservableEnvironmentViewController()
            case .appStorageView:
                return AppStorageViewController()
            }
        }
    }
}
