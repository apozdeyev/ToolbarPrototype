//
//  ViewController.swift
//  ExToolbar
//
//  Created by Anatoliy Pozdeyev on 23/03/2018.
//  Copyright © 2018 Hitask. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource  {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		cell.textLabel?.text = String(indexPath.row) + "qweqweqwe"
		return cell
	}
	
	@IBOutlet var slideContainer: UIView!
	
	@IBOutlet var topContainerHeightConstraint: NSLayoutConstraint!
	@IBOutlet var topContainerZeroHeightConstraint: NSLayoutConstraint!
	@IBOutlet var topContainer: UIView!
	
	@IBAction func onLeftBtnTapped(_ sender: Any) {
		UIView.animate(withDuration: 0.3) {
			self.showTopPanel(false)
			self.toggleSidePanel()
		}
	}
	
	
	@IBAction func onRightBtnTapped(_ sender: Any) {
		UIView.animate(withDuration: 0.3) {
			self.showSidePanel(false)
			self.toggleTopPanel()
		}
	}
	
	fileprivate func showSidePanel(_ show: Bool) {
		let isShown = !self.slideContainer.isHidden
		
		if isShown == show {
			return
		}
		
		self.slideContainer.isHidden = !self.slideContainer.isHidden
	}
	
	fileprivate func showTopPanel(_ show: Bool) {
		let isShown = (self.topContainer.alpha > 0)
		
		if isShown == show {
			return
		}
		
		self.topContainer.alpha = (self.topContainer.alpha == 0) ? 1 : 0
	}
	
	fileprivate func toggleSidePanel() {
		let isShown = !self.slideContainer.isHidden
		showSidePanel(!isShown)
	}
	
	fileprivate func toggleTopPanel() {
		let isShown = (self.topContainer.alpha > 0)
		showTopPanel(!isShown)
	}
}

