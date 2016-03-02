//
//  CustomCollectionViewCell.swift
//  CheckBoxCollectionView
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var testView : UIView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        testView = UIView()
        testView!.backgroundColor = UIColor.brownColor()
        self.backgroundView = testView
        
        let boxSize = frame.width * 0.3
        
        let falseBox = CheckBoxView(frame: CGRectMake(0, 0, boxSize, boxSize), selected: false)
        self.addSubview(falseBox)
        
        let trueBox = CheckBoxView(frame: CGRectMake(0, 0, boxSize, boxSize), selected: true)
        let backView = UIView(frame: frame)
        backView.backgroundColor = UIColor.clearColor()
        backView.addSubview(trueBox)
        self.selectedBackgroundView = backView
    }
}