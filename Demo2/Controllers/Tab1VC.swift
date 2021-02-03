//
//  Tab1.swift
//  Demo2
//
//  Created by PCQ196 on 02/02/21.
//

import UIKit

class Tab1VC: UIViewController {

    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    @IBOutlet weak var viewMaster: UIView!
    
    var tblvwCalls = UITableView()
    var collvwContacts : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupTableView()
        
        viewMaster.clipsToBounds = true
    
    }
    
    func setupTableView(){
        
        tblvwCalls.delegate = self
        tblvwCalls.dataSource = self

        tblvwCalls.frame = viewMaster.bounds
        tblvwCalls.bounces = false
        tblvwCalls.register(UINib(nibName: "CallsCell", bundle: .main), forCellReuseIdentifier: "CallsCell")
        
        self.viewMaster.addSubview(tblvwCalls)
        
    }
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (viewMaster.frame.size.width - 30) / 2, height: (viewMaster.frame.size.width - 30) / 2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collvwContacts = UICollectionView(frame: viewMaster.bounds, collectionViewLayout: layout)
        collvwContacts.delegate = self
        collvwContacts.dataSource = self
        collvwContacts.bounces = false
        collvwContacts.backgroundColor = .white
        collvwContacts.register(UINib(nibName: "ContactCell", bundle: .main), forCellWithReuseIdentifier: "ContactCell")
        
        self.viewMaster.addSubview(collvwContacts)
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl){
        
        if sender.selectedSegmentIndex == 0 {
            viewMaster.bringSubviewToFront(tblvwCalls)
        } else if sender.selectedSegmentIndex == 1 {
            viewMaster.bringSubviewToFront(collvwContacts)
        }
    }

}

// MARK: calls table view configurations
extension Tab1VC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCalls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CallsCell", for: indexPath) as! CallsCell
        cell.selectionStyle = .none

        let call = arrCalls[indexPath.row]
        if let phNum = call["phNum"] as? String{
            cell.lblPhNum.text = phNum
        }
        if let time = call["time"] as? String{
            cell.lblTime.text = time
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: contacts collection view configuration
extension Tab1VC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrContact.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.cornerRadius = 10
        cell.clipsToBounds = true
        
        let call = arrContact[indexPath.row]
        if let name = call["name"] as? String{
            cell.lblName.text = name
        }
        return cell
        
    }

}
