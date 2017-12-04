//
//  ACButton.swift
//  ACButton
//
//  Created by ADDICE on 2017/11/4.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

import UIKit

enum ACButtonType: Int {
    case leftImgRightTitle, rightImgLeftTitle, topImgBottomTitle, bottomImgTopTitle
}

class ACButton: UIButton {
    
    init(acButtonType: ACButtonType) {
        super.init(frame: .zero)
        self.acButtonType = acButtonType
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch acButtonType {
        case .leftImgRightTitle:
            positionLeftImgRightRitle()
        case .rightImgLeftTitle:
            positionRightImgLeftTitle()
        case .topImgBottomTitle:
            positionTopImgBottomTitle()
        case .bottomImgTopTitle:
            positonBottomImgTopTitle()
        }
        
    }
    
    /// MARK: 重写 sizeThatFits. 如果使用 sizeToFit 去获得 button 的大小。那么可以自适应。
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        var newSize = super.sizeThatFits(size)
        
        let absCenterY = CGFloat(fabsf(Float(offsetToCenter.y)))
        let absCenterX = CGFloat(fabsf(Float(offsetToCenter.x)))
        
        switch acButtonType {
        case .leftImgRightTitle, .rightImgLeftTitle:
            
            newSize.height += absCenterY
            newSize.width += absCenterX + spacing
        
        case .topImgBottomTitle, .bottomImgTopTitle:
            
            let titleWidth = newSize.width - (imageView?.bounds.width)!
            
            newSize.width = max(titleWidth, (imageView?.bounds.width)!)
            newSize.height = (titleLabel?.bounds.height)! + (imageView?.bounds.height)!
            
            newSize.width += absCenterX
            newSize.height += absCenterY + spacing
            
        }
        
        layoutIfNeeded()
        
        return newSize
    }
    
    // MARK: Properties
    
    /* 坐标系，X 轴正方向向左，Y 轴正方向向下。
     如果是距离中心位置，左边5，下边10。那么则是 CGPoint(x: -5, y: 10)
     */
    /// 图文距离中心位置的偏移
    var offsetToCenter : CGPoint = .zero
    
    /// ACButtonType: leftImgRightTitle, rightImgLeftTitle, topImgBottomTitle, bottomImgTopTitle
    var acButtonType : ACButtonType = .leftImgRightTitle
    
    /// 图文间距
    var spacing : CGFloat = 0
    
    // MARK: private
    
}


// MARK: - position
extension ACButton {
    
    /// position left imageview ，right title label
    private func positionLeftImgRightRitle() {
        
        let centerY = offsetToCenter.y
        let centerX = offsetToCenter.x

        // 距离中心的位置便宜。因为是整体 UI 而言。所以需要 /2.0
        imageView?.center.x += centerX/2.0
        imageView?.center.y += centerY/2.0
        imageView?.center.x -= spacing/2.0
        
        titleLabel?.frame.origin.x = (imageView?.frame.maxX)! + spacing
        titleLabel?.center.y = (imageView?.center.y)!

    }
    
    /// positon right image , left title label
    private func positionRightImgLeftTitle() {
        
        let centerY = offsetToCenter.y
        let centerX = offsetToCenter.x
        
        // 对换位置
        titleLabel?.frame.origin.x = (imageView?.frame.origin.x)!
        imageView?.frame.origin.x = (titleLabel?.frame.maxX)!
        
        // 距离中心的位置偏移。因为是整体 UI 而言。所以需要 /2.0
        titleLabel?.center.x += centerX/2.0
        titleLabel?.center.y += centerY/2.0
        titleLabel?.center.x -= spacing/2.0
        
        imageView?.frame.origin.x = (titleLabel?.frame.maxX)! + spacing
        imageView?.center.y = (titleLabel?.center.y)!
    }
    
    /// positon top image , bottom title
    private func positionTopImgBottomTitle() {
        
        let centerY = offsetToCenter.y
        let centerX = offsetToCenter.x
        
        titleLabel?.sizeToFit()
        
        // 调整位置，top image， bottom title
        imageView?.center.x = bounds.width/2.0
        imageView?.frame.origin.y = bounds.height/2.0 - (imageView?.bounds.height)!/2.0 - (titleLabel?.bounds.height)!/2.0
        titleLabel?.frame.origin.y = (imageView?.frame.maxY)!
        
        // 距离中心的位置偏移
        imageView?.center.x += centerX/2.0
        imageView?.center.y += centerY/2.0
        titleLabel?.frame.origin.y = (imageView?.frame.maxY)!

        // 图文间距
        imageView?.frame.origin.y -= spacing/2.0
        titleLabel?.frame.origin.y += spacing/2.0

        // titleLabel 始终与 imageView 对齐
        titleLabel?.center.x = (imageView?.center.x)!
    }
    
    /// postion bottom image top title
    private func positonBottomImgTopTitle() {
        let centerY = offsetToCenter.y
        let centerX = offsetToCenter.x
        
        titleLabel?.sizeToFit()
        
        // 调整位置，top title， bottom image
        titleLabel?.center.x = bounds.width/2.0
        titleLabel?.frame.origin.y = bounds.height/2.0 - (titleLabel?.bounds.height)!/2.0 - (imageView?.bounds.height)!/2.0
        imageView?.frame.origin.y = (titleLabel?.frame.maxY)!
        
        // 距离中心的位置偏移
        titleLabel?.center.x += centerX/2.0
        titleLabel?.center.y += centerY/2.0
        imageView?.frame.origin.y = (titleLabel?.frame.maxY)!
        
        // 图文间距
        titleLabel?.frame.origin.y -= spacing/2.0
        imageView?.frame.origin.y += spacing/2.0
        
        // imageView 始终与 titleLabel 对齐
        imageView?.center.x = (titleLabel?.center.x)!
    }
    
}

