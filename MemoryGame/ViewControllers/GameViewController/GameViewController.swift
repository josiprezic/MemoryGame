import UIKit

class GameViewController: UIViewController {
    
    //
    // MARK: - OUTLETS
    //
    
    @IBOutlet private var timerLabel: UILabel!
    @IBOutlet private var gameOverLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    //
    // MARK: - VARIABLES
    //
    
    private lazy var game = Concetration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var emojiChoices = Constants.GameVC.emojis
    private var emoji = [Card:String]()
    private var timer = Timer()
    private var seconds = 0.0
    private var numberOfPairsOfCards: Int { return (cardButtons.count + 1) / 2 }
    private var cardColor = UserDefaultsHelper.cardColor
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    //
    // MARK: - CUSTOM METHODS
    //
    
    private final func configure() {
        configureView()
        configureCollectionView()
    }
    
    private final func configureView() {
        title = Constants.GameVC.title
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
    }
    
    private final func configureCollectionView() {
        cardButtons.forEach { btn in
            btn.layer.cornerRadius = 5.0
            btn.clipsToBounds = true
            btn.backgroundColor = cardColor
        }
    }
    
    func scheduledTimerWithTimeInterval(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.seconds += 0.1
            self.timerLabel.text = "\(Constants.GameVC.timer) : \(round(self.seconds * 1000) / 1000)"
        }
    }

    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : cardColor
            }
        }
        
        if allMatched() {
            gameOverLabel.numberOfLines = 0
            let time = round(seconds*10)/10
            gameOverLabel.text = "Congratulations! \n TIME: \(time) seconds"
            timerLabel.isHidden = true
            hideAllCards()
            if CoreDataHelper.Players.isTopScore(top: Constants.ScoreboardVC.scoreboardSize, score: time) {
                showTopPlayerAlert(score: time)
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if(emoji[card] == nil), emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.random)
        }
        return emoji[card] ?? Constants.GameVC.questionMark
    }
    
    private func allMatched() -> Bool {
        var gameIsOver = true
        for card in game.cards {
            if card.isMatched == false {
                gameIsOver = false
            }
        }
        return gameIsOver
    }
    
    private func hideAllCards() {
        for button in cardButtons { button.isHidden = true }
    }
    
    private final func showTopPlayerAlert(score: Double) {
        let alert = UIAlertController(title: Constants.GameVC.awesomeScore, message: Constants.GameVC.typeUsername, preferredStyle: .alert)
        alert.addTextField { tf in tf.placeholder = Constants.GameVC.yourUsername }
        let okAction = UIAlertAction(title: Constants.GameVC.ok, style: .default, handler: { [weak alert] (_) in
            guard let textField = alert?.textFields?[0], let text = textField.text, !text.isEmpty else { return }
            let player = Player()
            player.username = text
            player.score = score
            CoreDataHelper.Players.insertNewPlayer(player: player)
            self.navigationController?.popToRootViewController(animated: true)
        })
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    //
    // MARK: - ACTIONS
    //
    
    @IBAction private func touchCard(_ sender: UIButton) {
        //start timer
        if seconds == 0.0 { scheduledTimerWithTimeInterval() }
        
        //flip animation
        UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        let cardNumber = cardButtons.index(of: sender)
        game.chooseCard(at: cardNumber!)
        updateViewFromModel()
    }
}
