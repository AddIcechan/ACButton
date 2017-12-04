//
//  ViewController.swift
//  ACButton
//
//  Created by ADDICE on 2017/11/4.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var leftImgRightTitleBtn: ACButton = {
        let btn = ACButton(acButtonType: .leftImgRightTitle)
        btn.setImage(#imageLiteral(resourceName: "test"), for: .normal)
        btn.setTitle("left image right title", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        btn.spacing = 10
        btn.offsetToCenter = CGPoint(x: 10, y: -5)
        return btn
    }()
    
    lazy var rightImgLeftTitleBtn: ACButton = {
        let btn = ACButton(acButtonType: .rightImgLeftTitle)
        btn.setImage(#imageLiteral(resourceName: "test"), for: .normal)
        btn.setTitle("right image left title", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        btn.offsetToCenter = CGPoint(x: -5, y: -10)
        btn.spacing = 10
        return btn
    }()
    
    lazy var topImgBottomTitleBtn: ACButton = {
        let btn = ACButton(acButtonType: .topImgBottomTitle)
        btn.setImage(#imageLiteral(resourceName: "test"), for: .normal)
        btn.setTitle("top image bottom title", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        btn.offsetToCenter = CGPoint(x: -5, y: -10)
        btn.spacing = 10
        return btn
    }()
    
    lazy var bottomImgTopTitleBtn: ACButton = {
        let btn = ACButton(acButtonType: .topImgBottomTitle)
        btn.setImage(#imageLiteral(resourceName: "test"), for: .normal)
        btn.setTitle("bottom image top title", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        btn.offsetToCenter = CGPoint(x: -5, y: -10)
        btn.spacing = 10
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftImgRightTitleBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        leftImgRightTitleBtn.sizeToFit()
        view.addSubview(leftImgRightTitleBtn)
        
        rightImgLeftTitleBtn.frame = CGRect(x: 100, y: leftImgRightTitleBtn.frame.maxY + 10, width: 100, height: 100)
        rightImgLeftTitleBtn.sizeToFit()
        view.addSubview(rightImgLeftTitleBtn)
        
        topImgBottomTitleBtn.frame = CGRect(x: 100, y: rightImgLeftTitleBtn.frame.maxY + 10, width: 100, height: 100)
        topImgBottomTitleBtn.sizeToFit()
        view.addSubview(topImgBottomTitleBtn)
        
        bottomImgTopTitleBtn.frame = CGRect(x: 100, y: topImgBottomTitleBtn.frame.maxY + 10, width: 100, height: 100)
        bottomImgTopTitleBtn.sizeToFit()
        view.addSubview(bottomImgTopTitleBtn)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

