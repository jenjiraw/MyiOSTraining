//
//  ContentTableViewCell.swift
//  BasicNavApp
//
//  Created by Jenjira on 4/26/2559 BE.
//  Copyright © 2559 Jenjira. All rights reserved.
//

import UIKit
import APAvatarImageView
import DynamicColor

class ContentTableViewCell: UITableViewCell {
    @IBOutlet weak var mTitle:UILabel!
    @IBOutlet weak var mSubTitle:UILabel!
    @IBOutlet weak var mYouTubeImg:UIImageView!
    @IBOutlet weak var mAvatarImg:APAvatarImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Initialization code to set up colors and look and feel of the cell
        mTitle.layer.shadowColor = UIColor.whiteColor().CGColor
        mTitle.layer.shadowOffset = CGSize(width: 3, height: 3)
        mTitle.layer.shadowOpacity = 0.9
        mTitle.layer.shadowRadius = 3
        
        mSubTitle.layer.shadowColor = UIColor.whiteColor().CGColor
        mSubTitle.layer.shadowOffset = CGSize(width: 3, height: 3)
        mSubTitle.layer.shadowOpacity = 0.9
        mSubTitle.layer.shadowRadius = 3
        
        
        mYouTubeImg.layer.cornerRadius = 5
        mYouTubeImg.layer.masksToBounds = true
        
        mYouTubeImg.layer.shadowColor = UIColor.blackColor().CGColor
        mYouTubeImg.layer.shadowOpacity = 1
        mYouTubeImg.layer.shadowOffset = CGSizeZero
        mYouTubeImg.layer.shadowRadius = 10
        mYouTubeImg.layer.shadowPath = UIBezierPath(rect: mYouTubeImg.bounds).CGPath
        mYouTubeImg.layer.shouldRasterize = true
        
        mAvatarImg.borderColor = UIColor(hex: 0x101010)
        mAvatarImg.borderWidth = 0
        
        //Create blur effect when scrolled
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light) //UIBlurEffectStyle.Light= Light translucent, .Dark = dark blur
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRectMake(13,0,293,50)
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
        self.sendSubviewToBack(blurEffectView)

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
