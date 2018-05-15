//
//  VideoCell.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/15.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import UIKit
import SDWebImage

class VideoCell: UITableViewCell {
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupUI(model: VideoModel) {
        self.videoImageView.sd_setImage(with: URL(string: model.img), placeholderImage: UIImage(named: "NoImage"))
        self.videoTitleLabel.text = model.title
    }
}
