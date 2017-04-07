//
//  TeamDetailVC.swift
//  TeamFitnessApp
//
//  Created by Patrick O'Leary on 4/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class TeamDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var team: Team?
    var teamUsers = [User]()
    var teamChallenges = [Challenge]()
    let teamNameLabel = FitnessLabel()
    let captainLabel = FitnessLabel()
    let membersLabel = FitnessLabel()
    let challengesLabel = FitnessLabel()
    let inviteMembersButton = FitnessButton()
    
    let membersView = UITableView()
    let challengesView = UITableView()
    
    let teamImageView = UIImageView()
    
    override func viewDidLoad() {
        
        membersView.register(FitnessCell.self, forCellReuseIdentifier: "fitnessCell")
        membersView.delegate = self
        membersView.dataSource = self
        
        super.viewDidLoad()
        setupViews()
        getTeamMembers(forTeam: team) { 
            self.membersView.reloadData()
        }
    }
    
    func setTeam(team: Team) {
        self.team = team
        teamNameLabel.text = team.name
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows: Int = 0
        
        if tableView == membersView {
            rows = teamUsers.count
        }
        
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = FitnessCell()
        if tableView == membersView {
            cell = membersView.dequeueReusableCell(withIdentifier: "fitnessCell") as! FitnessCell //TODO set default cell layout
            cell.setLabels(forUser: teamUsers[indexPath.row])
        } else if tableView == challengesView {
            cell = challengesView.dequeueReusableCell(withIdentifier: "fitnessCell") as! FitnessCell
            cell.setLabels(forChallenge: teamChallenges[indexPath.row])
        }
        return cell
    }
    
    func getTeamMembers(forTeam team: Team?, completion: @escaping () -> Void) {
        if let memberList = team?.userUIDs {
            for memberID in memberList {
                FirebaseManager.fetchUser(withUID: memberID, completion: { (user) in
                    self.teamUsers.append(user)
                    completion()
                })
            }
        }
    }
    
    func getChallenges(forTeam team: Team?, completion: @escaping () -> Void) {
        if let challengeList = team?.challengeIDs {
            
        }
    }
}
