//
//  HighscoreTableViewController.swift
//  2048 Tilt'it
//
//  Created by Thanusaan Rasiah on 29/11/2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import CoreData

class HighscoreTableViewController: UITableViewController {
    
    var  score: [ScoreType] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        getScores()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        getScores()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return score.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = score[indexPath.row].Date.toString()
        cell.detailTextLabel?.text = String(score[indexPath.row].Score)

        return cell
    }
    
    private func getScores() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Score")
        let sort = NSSortDescriptor(key: #keyPath(Score.score), ascending: false)
        request.sortDescriptors = [sort]
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                score.append(ScoreType(Date: data.value(forKey: "date") as! Date, Score: data.value(forKey: "score") as! Int))
            }
            
        } catch {
            print("Failed")
        }
    }

}

struct ScoreType {
    var Date: Date
    var Score: Int
}

extension Date
{
    func toString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        return dateFormatter.string(from: self)
    }
    
}
