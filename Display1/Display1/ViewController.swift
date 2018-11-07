//
//  ViewController.swift
//  Display1
//
//  Created by Dung Tran on 03/11/2018.
//  Copyright © 2018 Dung Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //@IBOutlet weak var drawN: UITextField!
    @IBOutlet weak var InputNum: UITextField!
    @IBOutlet weak var tblList:UITableView!
    
    // Some data
    let drawNumbers = ["Num0", "Num1", "Num2", "Num3", "Num4", "Num5", "Num6", "Num7", "Num8", "Num9", "Num10", "Num11", "Num12", "Num13", "Num14", "Num15", "Num16", "Num17", "Num18", "Num19", "Num20", "Num21", "Num22", "Num23", "Num24", "Num25", "Num26", "Num27", "Num28", "Num29", "Num30", "Num31", "Num32", "Num33", "Num34", "Num35", "Num36"]
    let drawMark = ["Cross", ""]
    var numberOfDraws = 0
    var drawNumbersArray = [Int]()      // initialisation the draw numbers array
    var test1:Int = 99
    var test2:String = ""
    // end of data
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // just
        return drawNumbersArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // cell object
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! tryTableViewCell
        //        if drawNumbersArray.count > 0 {
        print("check inide cell count=",  drawNumbersArray.count)
        print("check inide cell indexPath=", indexPath.row)
        if let pic = cell.contentView.viewWithTag(101) as? UIImageView {
            pic.image = UIImage(named: drawNumbers[drawNumbersArray[indexPath.row]] + ".png")
            
            test1 = drawNumbersArray[indexPath.row]
            print("check inside cell , member of drawNumbersArray= ", test1)
            test2 = drawNumbers[drawNumbersArray[indexPath.row]] + ".png"
            print("check inside cell , should display ", test2)
            
            //            cell.drawNumber.image = UIImage(named: drawNumbers[drawNumbersArray[indexPath.row]] + ".png")
        }
        return (cell)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initialise so that no footer line in table view
        tblList.tableFooterView = UIView.init(frame: .zero)
        
        tblList.dataSource = self
        tblList.delegate = self
        
    }
    
    @IBAction func AddBtn(sender: UIButton) {
        // adding new row
        if InputNum.text != ""{
            numberOfDraws += 1
            print(" draw  \(numberOfDraws)")
            print("draw number = ", InputNum.text)
            drawNumbersArray.insert(Int(InputNum.text!)!, atIndex: 0)
            // check indexPath
            let myIndex = NSIndexPath(forRow: 0, inSection: 0)
            print(" checking path \(myIndex)")
            
            
            tblList.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Top)
            print(" just pass insertRows!")
        }
        else{
            print (" Error no input!")
        }
        
    }
    
}

