//
//  ViewController.swift
//  ParallaxSectionExample
//
//  Created by Hubilo Softech Private Limited on 10/08/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var parallaxView: PJParallaxView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = tableView.backgroundColor
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Listing")
        setParallax(for: tableView, cover: imageView, height: 300)
    }
    
    func setParallax(for tableView:UITableView, cover image:UIImageView, height: CGFloat) {
        let coverImageView = image
        var top:CGFloat = 0
        if #available(iOS 11, *) {
            top+=(view.window?.safeAreaInsets.top ?? 0)
        }
        coverImageView.frame = CGRect.init(x: 0, y: -(top), width: self.view.frame.size.width, height: (height + top))
        let parallaxView = PJParallaxView.pj_parallaxViewForTableView(withHeight: height, viewToStretch: coverImageView)
        tableView.tableHeaderView = parallaxView
        self.parallaxView = parallaxView
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardTableViewCell
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        cell.type = (numberOfRows == 1) ? .single : indexPath.row == 0 ? .top : (indexPath.row == (numberOfRows-1)) ? .bottom : .middle
        cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = tableView.backgroundColor
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        stretchParallaxVie(in: scrollView)
    }
    
    func stretchParallaxVie(in scrollView:UIScrollView) {
        if let tableView = scrollView as? UITableView, !tableView.isHidden {
            let offset = scrollView.contentOffset
            if (scrollView.contentOffset.y>0) {
                if let headerView:PJParallaxView = parallaxView {
                    headerView.layoutHeaderViewReverse(forScrollOffset: CGPoint.init(x: offset.x, y: offset.y))
                }
            }
            else if(scrollView.contentOffset.y<=0) {
                if let headerView:PJParallaxView = parallaxView {
                    headerView.layoutHeaderView(forScrollOffset: offset)
                }
            }
        }
    }

}
