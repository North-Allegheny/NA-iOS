//
//  GradeFilterView.swift
//  NA
//
//  Created by Alex on 3/17/16.
//  Copyright © 2016 NA App. All rights reserved.
//

import UIKit
import AKPickerView_Swift

class GradeFilterView: UIView, AKPickerViewDataSource, AKPickerViewDelegate {
    
    @IBOutlet var picker: AKPickerView!
    
    let pickerItems = ["test", "test2", "test3"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.picker.delegate = self
        self.picker.dataSource = self
        picker.textColor = UIColor.blackColor()
        self.picker.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfItemsInPickerView(pickerView: AKPickerView) -> Int {
        return pickerItems.count
    }
    
    func pickerView(pickerView: AKPickerView, titleForItem item: Int) -> String {
        return pickerItems[item]
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
