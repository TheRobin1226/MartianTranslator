//
//  ArticleViewController.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

final class ArticleViewController: UIViewController {
    
    var articleModel: ArticleModel?
    var presenter: ArticlePresenterProtocol?
    var translatedArticleModel: ArticleModel?
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleTextView: UITextView!
    @IBOutlet weak var translateSwitch: UISwitch!
    @IBOutlet weak var translateLabel: UILabel!
    
    init(articleModel: ArticleModel) {
        self.articleModel = articleModel
        super.init(nibName: "ArticleViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "The Alien Times"
        self.view.backgroundColor = Constants.customColors.gold
        setArticleView()
        setTranslatorSwitch()
        setLeftButtonBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = Constants.customColors.gold
        navigationController?.navigationBar.tintColor = Constants.customColors.americanViolet
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Constants.customColors.americanViolet]
    }
}

// MARK: - ArticleViewProtocol
extension ArticleViewController: ArticleViewProtocol {
    func presentArticleTranslation(articleModel: ArticleModel) {
        translatedArticleModel = articleModel
    }
}

// MARK: - Private
private extension ArticleViewController {
    func setArticleView() {
        translateLabel.textColor = Constants.customColors.americanViolet
        articleTitle.text = articleModel?.title
        articleTitle.textColor = Constants.customColors.americanViolet
        articleTextView.text = articleModel?.body
        articleTextView.textColor = Constants.customColors.americanViolet
        articleImageView.image = articleModel?.topImage
    }
    
    func setTranslatorSwitch() {
        translateSwitch.addTarget(self, action: #selector(self.stateChanged), for: UIControl.Event.valueChanged)
        translateSwitch.onTintColor = Constants.customColors.americanViolet
    }
    
    @objc func stateChanged() {
        if (translateSwitch.isOn) {
            presenter?.startMartianTranslation(articleModel: articleModel!)
            articleTextView.text = translatedArticleModel?.body
            articleTitle.text = translatedArticleModel?.title
        } else {
            articleTitle.text = articleModel?.title
            articleTextView.text = articleModel?.body
        }
    }
    
    func setLeftButtonBarItem() {
        let image = UIImage(named: "backBtn")!.withTintColor(Constants.customColors.americanViolet, renderingMode: .alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action:  #selector(goBack(sender:)))
    }
    
    @objc func goBack(sender: UIBarButtonItem) {
        presenter?.goBack(navigationController: navigationController!)
    }
}
