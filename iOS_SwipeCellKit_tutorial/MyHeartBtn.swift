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
    
    let activatedImage = UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)).withRenderingMode(.alwaysOriginal)
    let normalImage = UIImage(systemName: "heart")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).withRenderingMode(.alwaysOriginal)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyHeartBtn - awakeFromNib() called")
        configureAction()
    }
    
    func setState(_ newValue: Bool) {
        print("MyHeartBtn - setState() called / newValue: \(newValue)")
        
        // 1. 현재 버튼의 상태 변경
        self.isActivated = newValue
        
        // 2. 변경된 상태에 따른 이미지 변경
        self.setImage(self.isActivated ? activatedImage : normalImage, for: .normal)
        
    }
    
    fileprivate func configureAction() {
        print("MyHeartBtn - configureAction() called")
        self.addTarget(self, action: #selector(onBtnClicked(_:)), for: .touchUpInside)
    }
    
    @objc fileprivate func onBtnClicked(_ sender: UIButton){
        print("MyHeartBtn - onBtnClicked() called")
        self.isActivated.toggle()
        // 애니메이션 처리 하기
        animate()
    }
    
    fileprivate func animate(){
        print("MyHeartBtn - animate() called")
        
        //1. 클릭 시 크기가 작아지기 - 스케일 즉 크기 변경 (50퍼센트로 0.1초동안)
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            guard let self = self else { return }
            let newImage = self.isActivated ? self.activatedImage : self.normalImage
            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)
            self.setImage(newImage, for: .normal)
        }, completion: { _ in
            //2. 원래 크기로 돌리기 (0.1초동안)
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
        
    }
    
}
