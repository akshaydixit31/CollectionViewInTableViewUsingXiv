//
//  ViewController.swift
//  CollectionViewInTableViewUsingXiv
//
//  Created by Appinventiv Technologies on 08/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//--------------- Outlet's -------------------
    @IBOutlet weak var tableViewCollection: UITableView!
//--------------- Structure's ----------------
    struct DataCollection {
        var sectionData : String
        var cellData: [String]
        init(sectionData:String,cellData:[String]) {
            self.sectionData = sectionData
            self.cellData = cellData
        }
    }
//--------------- Variable's -----------------
    var dataObject = [DataCollection]()
    
//--------------- ViewDidLoad ----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerNib = UINib(nibName: "HeaderClass", bundle: nil)
        tableViewCollection.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderClassId")//--- Register Header
       let cellNib = UINib(nibName: "CellForTableView", bundle: nil)
        tableViewCollection.register(cellNib, forCellReuseIdentifier: "CellForTableViewId")     //------ Register Cell nib........
        tableViewCollection.dataSource = self   // ---- DataSource........
        tableViewCollection.delegate = self     //-----Delegate..........
        

// -------- Assigning data in structure ------
        dataObject = [DataCollection(sectionData: "BiCycle's",cellData: ["Atlas","Avon","Hero","TrekBicycle","Atlas","Avon","Hero","TrekBicycle"]),
                      DataCollection(sectionData:"Bike's",cellData:["CRF","F3","Fazer","Glamour","Street Triple","z1","CRF","F3","Fazer","Glamour","Street Triple","z1"]),
                      DataCollection(sectionData:"Car's",cellData:["Ford","Swift","Vitara","Ford","Swift","Vitara","Ford","Swift","Vitara"]),
                      DataCollection(sectionData:"Mobile's",cellData:["lenovo","micromax","moto","videocone","lenovo","micromax","moto","videocone"]),
                      DataCollection(sectionData: "BiCycle's",cellData: ["Atlas","Avon","Hero","TrekBicycle","Atlas","Avon","Hero","TrekBicycle"]),
            DataCollection(sectionData:"Bike's",cellData:["CRF","F3","Fazer","Glamour","Street Triple","z1","CRF","F3","Fazer","Glamour","Street Triple","z1"])]
    }
    

   
}
//================ Extension of TableViewVC class =============
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    //    --------- Number of section in tableview -----------
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataObject.count
    }
    //    --------- Title for section ----------
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderClassId") as? HeaderClass else{fatalError("Header not found::-")}
        header.contentView.backgroundColor = UIColor.orange
       
        header.headerLabel.text = dataObject[section].sectionData
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
   
    //    --------- Number of row's in tableview -------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    //    --------- CellForRow in tableView ------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForTableViewId", for: indexPath) as? CellForTableView
        else{fatalError("Cell not found")}
       
        cell.populate(with: dataObject[indexPath.section].cellData,with: [dataObject[indexPath.section].sectionData])
        return cell
    }
   
}

    
    


























