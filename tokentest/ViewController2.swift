//
//  ViewController2.swift
//  tokentest
//
//  Created by Christopher Dorick on 3/3/15.
//  Copyright (c) 2015 Christopher Dorick. All rights reserved.
//

import UIKit


class ViewController2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //these will eventually be stored in the server and sent as needed
    var tableData : [String] = []
    var tableImages: [String] = []
    
    @IBOutlet var collV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collV.dataSource = self
        collV.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ColViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as ColViewCell
        cell.imgCell.image = UIImage(named: tableImages[indexPath.row])
        cell.btnCell.setTitle("Press to install the " + tableData[indexPath.row] + " app" , forState: UIControlState.Normal)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell: ColViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as ColViewCell
        
        if cell.switchCell.on {
            cell.switchCell.setOn(false, animated: true)
        }
        else {
            cell.switchCell.setOn(true, animated: true)
        }
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
