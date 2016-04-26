//
//  PageThreeViewController.swift
//  BasicNavApp
//
//  Created by Jenjira on 4/26/2559 BE.
//  Copyright © 2559 Jenjira. All rights reserved.
//

import UIKit
import Alamofire //REST/SOAP Requests and able to return in either JSON or XML
import SWXMLHash
import MapleBacon   //Get image, youtube from url
import XCDYouTubeKit

class PageThreeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mTableView:UITableView!
    var mDataArray:[XMLIndexer]=[]
    
    //UITalbeViewDataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.mTableView.dequeueReusableCellWithIdentifier("ContentCell") as? ContentTableViewCell
        
        //Fill in info into cell
        //cell?.mTitle.text = "My Title"
        //cell?.mSubTitle.text = "My Subtitle"
        
        
        let item = self.mDataArray[indexPath.row]
        cell?.mTitle.text = item["title"].element?.text
        cell?.mSubTitle.text = item["description"].element?.text
        
        let avatarLink = item["image_link"].element?.text
        let youtubeLink = item["youtube_image"].element?.text
        
        let youtubeURL = NSURL(string: youtubeLink!)
        let avatarURL = NSURL(string: avatarLink!)
        
        cell?.mYouTubeImg.setImageWithURL(youtubeURL!) //If we do cell!.method = we must call this method so if cell = nil this method will crash
        cell?.mAvatarImg.setImageWithURL(avatarURL!)
        
        return cell!
        
    }
    
    //UITableViewDelegate Methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.feedData()
    }
    
    func feedData(){
        
        let params:[String:String] = ["type":"xml"] //Dictionary that comprises many sets of key & values (Keys here is as string and values as string)
        
        Alamofire.request(.POST, "http://codemobiles.com/adhoc/feed/youtube_feed.php", parameters: params, encoding: .URL, headers: nil).responseString { (response) in
            //.responseString is a call back function to do these code below once we get the response
            //print(response.result.value!) //Expect results to be XML
            let doc = SWXMLHash.parse(response.result.value!)
            self.mDataArray = doc["youtubes_list"].children
            
            //Force table view to reload data again once you get response
            self.mTableView.reloadData() //This will go to call #rows, section, reload cell
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
