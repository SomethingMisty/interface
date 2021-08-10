//
//  GroupsTableViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    

    
    
    @IBOutlet var groupTableView: UITableView!
    
    
    
    var group = Group.allGroups
    
    
    @IBAction func goBackFromAvaliableFriends(with segue: UIStoryboardSegue) {
        guard let avaliableVC = segue.source as? AvaliableGroupsTableViewController,
              let indexPath = avaliableVC.tableView.indexPathForSelectedRow else { return }
        let newGroup = avaliableVC.group[indexPath.row]
        
        guard !group.contains(where: { $0.name == newGroup.name}) else {return}
             

        group.append(newGroup)
        groupTableView.reloadData()
            
    }
    
    
    private struct GroupConstants {
        static let cellID = "GroupTableViewCell"
    }
    
    
    /// возвращает количество заполненных ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }
    /// воводит информацию в ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupConstants.cellID, for: indexPath) as? GroupTableViewCell else {
            fatalError("{Message: Error in dequeue GroupsTableViewController}")
        }
        cell.imageGroup.image = group[indexPath.row].image
        cell.nameGroup.text = group[indexPath.row].name
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedFriend = group[indexPath.row]
            group.remove(at: indexPath.row)
            print(deletedFriend.name)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}


