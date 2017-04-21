//
//  DataStore.swift
//  TeamFitnessApp
//
//  Created by Patrick O'Leary on 4/20/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation
import Firebase

class DataStore {
    
    static let sharedInstance = DataStore()
    var allUsers = [User]()
    var allChallenges = [Challenge]()
    var allTeams = [Team]()
    var teamUsers = [User]()
    
    var delegate: DataStoreDelegate?
    
    private init() {
        self.observeAllTeams { 
            print("OBSERVING ALL TEAMS LIKE A MOFO *******************")
        }
        self.observeAllUsers {
            
        }
        
        self.observeAllChallenges {
            
        }
    }
    
    func observeAllTeams(completion: @escaping () -> Void) {
        FirebaseManager.fetchAllTeams { (teams) in
            self.allTeams = teams
            completion()
            self.delegate?.updatedTeams()
        }
    }
    
    func observeAllUsers(completion: @escaping() -> Void) {
        FirebaseManager.fetchAllUsers() { (users) in
            self.allUsers = users
            completion()
            self.delegate?.updatedUsers()
        }
    }
    
    func observeAllChallenges(completion: @escaping () -> Void) {
        FirebaseManager.fetchAllChallenges { (challenges) in
            self.allChallenges = challenges
            completion()
            self.delegate?.updatedChallenges()
        }
    }

    func getTeamUsers(forTeam teamID: String, completion: @escaping () -> ()) {
        var teamUsers = [User]()
        FirebaseManager.fetchTeam(withTeamID: teamID) { (team) in
            for user in team.userUIDs {
                FirebaseManager.fetchUserOnce(withFirebaseUID: user, completion: { (user) in
                    teamUsers.append(user)
                    if teamUsers.count ==  team.userUIDs.count {
                        self.teamUsers = teamUsers
                        completion()
                    }
                })
            }

        }
    }
}

protocol DataStoreDelegate {
    func updatedTeams()
    func updatedChallenges()
    func updatedUsers()
}
