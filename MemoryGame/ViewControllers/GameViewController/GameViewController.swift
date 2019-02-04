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
    private var emojiChoices = ["🍒","🐞","🐌","🍗","🎧","🇵🇱","😀","🥶", "🎃", "⛑", "🐥", "🎱"]
    private var emoji = [Card:String]()
    private var timer = Timer()
    private var seconds = 0.0
    private var numberOfPairsOfCards: Int { return (cardButtons.count + 1) / 2 }

    //
    // MARK: - VIEW METHODS
    //
    
    override func viewWillAppear(_ animated: Bool) {
        cardButtons.forEach{ btn in
            btn.layer.cornerRadius = 5.0
            btn.clipsToBounds = true
        }
        super.viewWillAppear(animated)
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
        title = "Memory Game"
    }
    
    //
    // MARK: - CUSTOM METHODS
    //
    
    func scheduledTimerWithTimeInterval(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (time) in
            self.seconds += 0.1
            self.timerLabel.text = "Timer : \(round(self.seconds * 1000) / 1000)"
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
            else
            {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
        if allMatched() {
            gameOverLabel.numberOfLines = 0
            gameOverLabel.text = "Congratulations! \n TIME: \(round(seconds*10)/10) seconds"
            timerLabel.isHidden = true
            hideAllCards()
        }
    }
    
    private func emoji(for card: Card) -> String {
        if(emoji[card] == nil), emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.random)
        }
        return emoji[card] ?? "?"
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
