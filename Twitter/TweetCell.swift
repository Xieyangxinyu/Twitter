//
//  TweetCell.swift
//  Twitter
//
//  Created by 谢阳欣雨 on 2/18/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetId:Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFav = !favorited
        if (toBeFav){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFav(true)
            }, failure: { (error) in
                print("Favorite not succeed :\(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFav(false)
            }, failure: { (error) in
                print("Unfavorite not succeed :\(error)")
            })
        }
    }
    
    @IBAction func reTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Retweet not succeed :\(error)")
        })
    }
    
    func setFav(_ isFav: Bool){
        favorited = isFav
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
