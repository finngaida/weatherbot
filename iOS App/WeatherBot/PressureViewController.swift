//
//  PressureViewController.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class PressureViewController: UIViewController {
    
    var dataSet:DataSet!
    var chart:PressureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graph"
        
        chart = PressureView(frame: CGRectMake(5, 70, self.view.frame.width - 10, self.view.frame.height - 130))
        chart.setDataSet(dataSet.data.map({ $0.pressure }))
        self.view.addSubview(chart)
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
