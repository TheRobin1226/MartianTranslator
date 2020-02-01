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
    var articleTranslatedText: String?
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleTextView: UITextView!
    @IBOutlet weak var translateSwitch: UISwitch!
    @IBOutlet weak var translateText: UILabel!
    
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
        self.view.backgroundColor = Constants.gold
        setArticleView()
        setTranslatorSwitch()
        setLeftButtonBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = Constants.gold
        navigationController?.navigationBar.tintColor = Constants.americanViolet
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Constants.americanViolet]
        self.navigationItem.hidesBackButton = true
    }
}

// MARK: - ArticleViewProtocol
extension ArticleViewController: ArticleViewProtocol {
    func presentArticleTranslation(articleTranslatedText: String) {
        self.articleTranslatedText = articleTranslatedText
    }
}

// MARK: - Private
private extension ArticleViewController {
    func setArticleView() {
        translateText.textColor = Constants.americanViolet
        articleTitle.text = articleModel?.title
        articleTitle.textColor = Constants.americanViolet
        articleTextView.text = articleModel?.body
        articleTextView.textColor = Constants.americanViolet
        articleImageView.image = articleModel?.topImage
    }
    
    func setTranslatorSwitch() {
        translateSwitch.addTarget(self, action: #selector(self.stateChanged), for: UIControl.Event.valueChanged)
        translateSwitch.onTintColor = Constants.americanViolet
    }
    
    @objc func stateChanged(mySwitch: UISwitch) {
        if (translateSwitch.isOn) {
            presenter?.startMartianTranslation(articleText: articleModel!.body)
            articleTextView.text = self.articleTranslatedText
        } else {
            articleTextView.text = articleModel?.body
        }
    }
    
    func setLeftButtonBarItem() {
        let image = UIImage(named: "backBtn")!.withTintColor(Constants.americanViolet, renderingMode: .alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action:  #selector(goBack(sender:)))
    }
    
    @objc func goBack(sender: UIBarButtonItem) {
        presenter?.goBack(navigationController: navigationController!)
    }
}
