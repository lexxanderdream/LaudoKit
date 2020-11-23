//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

@available(iOS 13.0, *)
public extension NSCollectionLayoutSection {
    
    func spacing(_ spacing: CGFloat) -> Self {
        interGroupSpacing = spacing
        return self
    }
    
    func scrollingBehavior(_ behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> Self {
        orthogonalScrollingBehavior = behavior
        return self
    }
    
    func padding(_ padding: NSDirectionalEdgeInsets) -> Self {
        contentInsets = padding
        return self
    }
}


@available(iOS 13.0, *)
public extension NSCollectionLayoutSection {
    
    static func singleItemLayout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    
    static func listLayout(environment: NSCollectionLayoutEnvironment, height: NSCollectionLayoutDimension) -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize
        if height.isEstimated {
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: height)
        } else {
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        }
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: height)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        return NSCollectionLayoutSection(group: group)
    }
    
    static func horizontalLayout(environment: NSCollectionLayoutEnvironment, width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension) -> NSCollectionLayoutSection {
        
        let itemSize: NSCollectionLayoutSize
        
        // Make Item
        if height.isEstimated {
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: height)
        } else {
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        }
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Make Group
        let groupSize = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Make Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        //
        return section
    }

    static func gridLayout(environment: NSCollectionLayoutEnvironment, height: NSCollectionLayoutDimension,
                           compactItems: Int, regularItems: Int) -> NSCollectionLayoutSection {
        
        let itemSize: NSCollectionLayoutSize
     //   let count: Int = environment.traitCollection.horizontalSizeClass == .compact ? compactItems : regularItems
        let count: Int = environment.container.effectiveContentSize.width < 600 ? compactItems: regularItems
        if height.isEstimated {
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / CGFloat(count)),
                                              heightDimension: height)
        } else {
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / CGFloat(count)),
                                              heightDimension: .fractionalHeight(1.0))
        }
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: height)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitem: item, count: count)

        return NSCollectionLayoutSection(group: group)
    }
}


