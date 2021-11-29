//
//  MyHeartBtn.swift
//  iOS_SwipeCellKit_tutorial
//
//  Created by 장민석 on 2021/11/29.
//  Copyright © 2021 장민석. All rights reserved.
//

import Foundation
import UIKit

class MyHeartBtn: UIButton {
    
    var isActivated : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyHeartBtn - awakeFromNib() called")
    }
    
    func setState(_ newValue: Bool) {
        print("MyHeartBtn - setState() called / newValue: \(newValue)")
        
        // 1. 현재 버튼의 상태 변경
        self.isActivated = newValue
        
        // 2. 변경된 상태에 따른 이미지 변경
        
        let activatedImage = UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)).withRenderingMode(.alwaysOriginal)
        let normalImage = UIImage(systemName: "heart")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).withRenderingMode(.alwaysOriginal)
        self.setImage(self.isActivated ? activatedImage : normalImage, for: .normal)
        
    }
    
    
}
