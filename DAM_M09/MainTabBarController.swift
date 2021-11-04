//
//  MainTabBarController.swift
//  DAM_M09
//
//  Created by dam on 30/01/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var eventViewController: CyclistEventViewController!
    var cyclistViewController: CyclistViewController!
    var teamViewController: TeamsViewController!
    var userProfileViewController: UserProfileViewController!
    var subViewControllers: [UIViewController] = []
    var tagSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createTapped))
        eventViewController = CyclistEventViewController()
        cyclistViewController = CyclistViewController()
        teamViewController = TeamsViewController()
        userProfileViewController = UserProfileViewController()
        
        subViewControllers.append(eventViewController)
        subViewControllers.append(cyclistViewController)
        subViewControllers.append(teamViewController)
        subViewControllers.append(userProfileViewController)
        
        eventViewController.tabBarItem = UITabBarItem(title: "Events", image: UIImage(named: "event.png"), selectedImage: UIImage(named: "event-selected.png"))
        eventViewController.tabBarItem.tag = 0
        cyclistViewController.tabBarItem = UITabBarItem(title: "Cyclists", image: UIImage(named: "cyclist.png"), selectedImage: UIImage(named: "cyclist-selected.png"))
        cyclistViewController.tabBarItem.tag = 1
        teamViewController.tabBarItem = UITabBarItem(title: "Teams", image: UIImage(named: "team.png"), selectedImage: UIImage(named: "team-selected.png"))
        teamViewController.tabBarItem.tag = 2
        userProfileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user.png"), selectedImage: UIImage(named: "user-selected.png"))
        userProfileViewController.tabBarItem.tag = 3
        
        self.setViewControllers(subViewControllers, animated: true)
        self.selectedIndex = 0
        self.selectedViewController = eventViewController
    }
    
    @objc func createTapped(){
        switch tagSelected {
            case 0:
                let detailEvent = DetailCyclistEventViewController(nibName:String(describing: DetailCyclistEventViewController.self), bundle: nil)
                detailEvent.delegate = eventViewController
                navigationController?.pushViewController(detailEvent, animated: true)
                break
            case 1:
                navigationController?.pushViewController(CustomViewCyclistTableDetail(), animated: true)
                break
            case 2:
                let detailTeam = DetailTeamViewController(nibName:String(describing: DetailTeamViewController.self), bundle: nil)
                detailTeam.delegateTeam = teamViewController
                navigationController?.pushViewController(detailTeam, animated: true)
                break;
            default:
                navigationController?.pushViewController(UserProfileViewController(), animated: true)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tagSelected = item.tag
        if(item.tag == 3){
            navigationItem.rightBarButtonItem = nil
        }else{
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createTapped))
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
