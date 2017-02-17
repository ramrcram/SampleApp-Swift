//
//  ViewController2.swift
//  AutoLayout
//
//  Created by Ramesh on 02/01/17.
//  Copyright © 2017 Ramesh. All rights reserved.
//

import UIKit
import ObjectMapper

class ActivityVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tbActivity: UITableView!
    var objResult:RecipeActivites!
    let RecipeActivityIdentifier = "RecipeActivityCell"
    let RecipeUserActivityIdentifier = "RecipeUserActivityCell"
    override func viewDidLoad() {
        //Register customCell
        self.tbActivity.register(UINib(nibName: "RecipeActivityCell", bundle: nil), forCellReuseIdentifier: RecipeActivityIdentifier)
        self.tbActivity.register(UINib(nibName: "RecipeUserActivityCell", bundle: nil), forCellReuseIdentifier: RecipeUserActivityIdentifier)
        
        getPersons()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPersons() {
        let apiManager = ApiManager ()
        apiManager.getPersons(jsonFile: "Data", completionBlock: { (jsString) in
            // Convert JSON String to Model
            self.objResult = Mapper<RecipeActivites>().map(JSONString: jsString as String)
            print("User")
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Instantiate a cell
        let objActivity:RecipeActivityModel = self.objResult.RecipeActivites![indexPath.row]
        if objActivity.ActiviteType == "recipe" {
            let cellIdentifier = RecipeActivityIdentifier
            let cell:RecipeActivityCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RecipeActivityCell!
            
            cell.imgRecipeImage.image = UIImage (named:(objActivity.Recipe?.recipeimage)!)
            cell.lblActivityText.text = "\(objActivity.User?.fname) is making a  " + "\(objActivity.Recipe?.recipename) at her " +  "\(objActivity.Recipe?.makingplace)"
            cell.lblTimeText.text = objActivity.Recipe?.time
            
            cell.imgUserProfilePic.image = UIImage (named:(objActivity.User?.profilePic)!)
            cell.imgUserProfilePic.layer.cornerRadius = cell.imgUserProfilePic.bounds.size.width/2
            cell.imgUserProfilePic.clipsToBounds = true
            return cell
        }else{
            let cellIdentifier = RecipeUserActivityIdentifier
            let cell:RecipeUserActivityCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RecipeUserActivityCell!
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.objResult.RecipeActivites?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let objActivity:RecipeActivityModel = self.objResult.RecipeActivites![indexPath.row]
        if objActivity.ActiviteType == "recipe" {
            return 268
        }else{
            return 117
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
