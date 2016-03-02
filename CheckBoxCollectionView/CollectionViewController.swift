//
//  ViewController.swift
//  CheckBoxCollectionView
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var myCollectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.bounds.width
        
        // CollectionViewのレイアウトを生成.
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(width * 0.5 - 25, width * 0.5 - 25)
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)
        layout.headerReferenceSize = CGSizeMake(100,30)
        
        // CollectionViewを生成.
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.backgroundColor = UIColor.whiteColor()
        
        myCollectionView.allowsMultipleSelection = true
        
        self.view.addSubview(myCollectionView)
    }
    
    //MARK:- UICollectionViewDataSorce
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        //ここでcell.testViewなどcellのbackgroundViewにあるViewになにか必要な要素を配置する
        return cell
    }
    
    //MARK:UICollectionViewDelegate
    //選択された時に呼ばれる.
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        print(cell.selected)
        
        //選択された時に選択されているCellのindexPathを表示
        let selecteditems = self.myCollectionView.indexPathsForSelectedItems()
        print(selecteditems)
    }
    //選択状態から非選択状態になった時に呼ばれる.
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        print(cell.selected)
    }
}