//
//  CellForTableView.swift
//  CollectionViewInTableViewUsingXiv
//
//  Created by Appinventiv Technologies on 08/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class CellForTableView: UITableViewCell {
    @IBOutlet weak var collectionViewOnTable: UICollectionView!
    var dataCell = [String]()
    var sectionData = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        let headerNib = UINib(nibName: "HeaderClass", bundle: nil)
        collectionViewOnTable.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderClassId")//---- Register header.....
        let cellNib = UINib(nibName: "CellForCollectionView", bundle: nil)
        collectionViewOnTable.register(cellNib, forCellWithReuseIdentifier: "CellForCollectionViewId")//----- Register cell...
        collectionViewOnTable.dataSource = self
        collectionViewOnTable.delegate = self
        
    }
    //------------- Method to get data from tableviewvc ------------
    func populate(with data : [String], with secData: [String]) {
        self.dataCell = data
        self.sectionData = secData
        self.collectionViewOnTable.reloadData()
    }
   
}
//============== Extension for TableCellData Class ==============

extension CellForTableView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    //------------ Number of item in collection view ------------
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionData.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as? CollectionViewHeader else{fatalError("header not found")}
        
        header.headerLabelInCollection.text = sectionData[indexPath.row]
        return header
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return dataCell.count
    }
    
    //----------- Cell for ItemAt IndexPath ------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForCollectionViewId", for: indexPath) as? CellForCollectionView else{fatalError()}
        
        cell.cellImage.image = UIImage(named: dataCell[indexPath.row])
        cell.cellDataLabel.text = dataCell[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
