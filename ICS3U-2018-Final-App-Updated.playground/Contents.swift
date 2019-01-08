
// Created on: Jan-2019
// Created by: Brody MacNeil
// Created for: ICS3U
// This program is the template for the ICS3U final project

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class SplashScene : SKScene {
    // local variables to this scene
    let splashSceneBackground = SKSpriteNode(imageNamed: "splashSceneImage.png")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3.0)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        splashSceneBackground.name = "splash Scene Background"
        splashSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(splashSceneBackground)
        
        splashSceneBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            
            self.splashSceneBackground.removeAllActions()
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view!.presentScene(mainMenuScene)
        }
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let mainMenuSceneBackground = SKSpriteNode(imageNamed: "File_001.png")
    let player1Button = SKSpriteNode(imageNamed: "IMG_5136.PNG")
    let player2Button = SKSpriteNode(imageNamed: "IMG_5137.PNG")
    let settingsButton = SKSpriteNode(imageNamed: "IMG_5138.PNG")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        mainMenuSceneBackground.name = "Main menu scene Background"
        mainMenuSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        mainMenuSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(mainMenuSceneBackground)
        
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        player1Button.position = CGPoint(x: frame.midX, y: frame.midY)
        
        player1Button.name = "player 1 button"
        self.addChild(player1Button)
        player1Button.setScale(0.11)
        
        player2Button.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        player2Button.name = "player 2 button"
        self.addChild(player2Button)
        player2Button.setScale(0.11)
        
        settingsButton.position = CGPoint(x: frame.midX, y: frame.midY - 200)
        settingsButton.name = "settings button"
        self.addChild(settingsButton)
        settingsButton.setScale(0.11)
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "player 1 button" {
                UserDefaults().set(1, forKey: "amountOfPlayers")
                let gameScene = GameScene(size: self.size)
                self.view!.presentScene(gameScene)
            }
        }
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "player 2 button" {
                UserDefaults().set(2, forKey: "amountOfPlayers")
                let gameScene = GameScene2(size: self.size)
                self.view!.presentScene(gameScene)
            }
        }
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "settings button" {
                let settingsScene = SettingsScene(size: self.size)
                self.view!.presentScene(settingsScene)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
}

class SettingsScene : SKScene, SKPhysicsContactDelegate{
    // local variables to this scene
    let splashSceneBackground = SKSpriteNode(imageNamed: "File_001.png")
    let backButton = SKSpriteNode(imageNamed: "BlueArrow.png")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        splashSceneBackground.name = "splash Scene Background"
        splashSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(splashSceneBackground)
        
        backButton.position = CGPoint(x: frame.midX, y: frame.midY - 200)
        backButton.name = "back button"
        self.addChild(backButton)
        backButton.setScale(0.11)
        }
    
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "back button" {
                self.splashSceneBackground.removeAllActions()
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class GameScene : SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    
    // restrict movement
    var horizontalShouldWork = true
    var verticalShouldWork = true
    var p1BikeTip = CGRect()
    var wallHitbox = CGRect()
    
    // difficulty level
    var wallSize : Double = 10
    var movementSpeed = CGFloat(2)
    
    // checks amount of players
    let numOfPlayers = UserDefaults().integer(forKey: "amountOfPlayers")
    
    // SpriteNodes
    let p1Bike = SKSpriteNode(imageNamed: "BlueBikeLowRes.png")
    let right = SKSpriteNode(imageNamed: "BlueArrow.png")
    let left = SKSpriteNode(imageNamed: "BlueArrow.png")
    let down = SKSpriteNode(imageNamed: "BlueArrow.png")
    let up = SKSpriteNode(imageNamed: "BlueArrow.png")
    var timeCounter = 0
    let time = SKLabelNode.init(text: "0")
    
    // for collision detection
    let collisionBikeCategory : UInt32  = 1
    let collisionTrailCategory : UInt32 = 2
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        // for the GUI
        let blueBikeStartingPoint = CGPoint(x: frame.size.width / 2, y: frame.size.height / 5)
        let centerOfArrows = CGPoint(x: 150, y: 150)
        let distanceFromCenter = 75
        
        // contact
        self.physicsWorld.contactDelegate = self
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0, green:0, blue:0, alpha: 1)
        
        p1Bike.position = blueBikeStartingPoint
        p1Bike.setScale(0.2)
        p1Bike.name = "p1Bike"
        p1Bike.physicsBody?.isDynamic = true
        p1Bike.physicsBody = SKPhysicsBody(circleOfRadius: p1Bike.size.width / 3, center: CGPoint(x: 0, y: p1Bike.size.height / 2 - p1Bike.size.width / 2.5))
        p1Bike.physicsBody?.affectedByGravity = false
        p1Bike.physicsBody?.usesPreciseCollisionDetection = true
        p1Bike.physicsBody?.categoryBitMask = collisionBikeCategory
        p1Bike.physicsBody?.contactTestBitMask = collisionTrailCategory
        p1Bike.physicsBody?.collisionBitMask = 0x0
        self.addChild(p1Bike)
        p1BikeTip = CGRect(x: p1Bike.position.x - p1Bike.size.height / 2, y: p1Bike.position.y - p1Bike.size.height / 2, width: p1Bike.size.height, height: p1Bike.size.height)
        wallHitbox = CGRect(x: 0 + p1Bike.size.height, y: 0 + p1Bike.size.height, width: frame.size.width - p1Bike.size.height * 2, height: frame.size.height - p1Bike.size.height * 2)
        
        left.position = CGPoint(x: centerOfArrows.x - CGFloat(distanceFromCenter), y: centerOfArrows.y)
        left.name = "left Button"
        left.zRotation = CGFloat(M_PI_2)
        self.addChild(left)
        left.setScale(0.3)
        left.alpha = 0.5
        
        right.position = CGPoint(x: centerOfArrows.x + CGFloat(distanceFromCenter), y: centerOfArrows.y)
        right.name = "right Button"
        right.zRotation = CGFloat(-M_PI_2)
        self.addChild(right)
        right.setScale(0.3)
        right.alpha = 0.5
        
        down.position = CGPoint(x: centerOfArrows.x, y: centerOfArrows.y - CGFloat(distanceFromCenter))
        down.name = "down Button"
        down.zRotation = CGFloat(M_PI)
        self.addChild(down)
        down.setScale(0.3)
        down.alpha = 0
        
        up.position = CGPoint(x: centerOfArrows.x, y: centerOfArrows.y + CGFloat(distanceFromCenter))
        up.name = "up Button"
        up.zRotation = CGFloat(0)
        self.addChild(up)
        up.setScale(0.3)
        up.alpha = 0
        
        time.position = CGPoint(x: frame.size.width - 50, y: frame.size.height - 50)
        time.fontSize = 20
        self.addChild(time)
        time.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 1), SKAction.run {
            self.timeCounter += 1
            self.time.text = "\(self.timeCounter)"
            }])))
        
        horizontalShouldWork = true
        verticalShouldWork = false
        makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "up")
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
        if !p1BikeTip.intersects(wallHitbox) {
            p1Bike.removeFromParent()
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionBikeCategory | collisionTrailCategory)) {
            // bike hits trail
            p1Bike.removeFromParent()
        }
    } 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Functions for the Buttons
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Functions for the Buttons
        let touch = touches.first!
        
        if right.contains(touch.location(in: self)) && horizontalShouldWork == true {
            
            horizontalShouldWork = false
            verticalShouldWork = true
            
            right.alpha = 0
            left.alpha = 0
            up.alpha = 0.5
            down.alpha = 0.5
            
            // move right
            p1Bike.zRotation = CGFloat(-M_PI_2)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "right")
        }
        
        if left.contains(touch.location(in: self)) && horizontalShouldWork == true {
            
            horizontalShouldWork = false
            verticalShouldWork = true
            
            right.alpha = 0
            left.alpha = 0
            up.alpha = 0.5
            down.alpha = 0.5
            
            // move left
            p1Bike.zRotation = CGFloat(M_PI_2)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "left")
        }
        
        if down.contains(touch.location(in: self)) && p1Bike.zRotation != CGFloat(0) {
            
            horizontalShouldWork = true
            verticalShouldWork = false
            
            right.alpha = 0.5
            left.alpha = 0.5
            up.alpha = 0
            down.alpha = 0
            
            // move down
            p1Bike.zRotation = CGFloat(M_PI)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "down")
        }
        
        if up.contains(touch.location(in: self)) && verticalShouldWork == true {
            
            horizontalShouldWork = true
            verticalShouldWork = false
            
            right.alpha = 0.5
            left.alpha = 0.5
            up.alpha = 0
            down.alpha = 0
            
            // move up
            p1Bike.zRotation = CGFloat(0)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "up")
        }
    }
    
    func makeTrail(playerNum : Int, movementSpeed : CGFloat, direction : String) {
        let cornerCircle = SKShapeNode(circleOfRadius: 2)
        cornerCircle.fillColor = #colorLiteral(red: 0.25882354378700256, green: 0.7568627595901489, blue: 0.9686274528503418, alpha: 1.0)
        cornerCircle.position = p1Bike.position
        cornerCircle.zPosition = -0.9
        self.addChild(cornerCircle)
        
        let leadingTrail = SKSpriteNode(imageNamed: "LowResTrail.png")
        leadingTrail.position = CGPoint(x: p1Bike.position.x, y: p1Bike.position.y)
        leadingTrail.zPosition = -1
        leadingTrail.zRotation = p1Bike.zRotation
        leadingTrail.name = "trail"
        self.addChild(leadingTrail)
        leadingTrail.size = CGSize(width: 2, height: 2)
        
        if direction == "down" {
            p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: -movementSpeed, duration: 1/60), SKAction.run {
                self.p1BikeTip.origin.y -= movementSpeed
                leadingTrail.size.height += movementSpeed
                leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                leadingTrail.physicsBody?.affectedByGravity = false
                leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                leadingTrail.physicsBody?.collisionBitMask = 0x0
                leadingTrail.position.y = self.p1Bike.position.y + leadingTrail.size.height / 2
                }])))
        } else if direction == "up" {
            p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: movementSpeed, duration: 1/60), SKAction.run {
                self.p1BikeTip.origin.y += movementSpeed
                leadingTrail.size.height += movementSpeed
                leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                leadingTrail.physicsBody?.affectedByGravity = false
                leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                leadingTrail.physicsBody?.collisionBitMask = 0x0
                leadingTrail.position.y = self.p1Bike.position.y - leadingTrail.size.height / 2
                }])))
        } else if direction == "right" {
            p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: movementSpeed, y: 0, duration: 1/60), SKAction.run {
                self.p1BikeTip.origin.x += movementSpeed
                leadingTrail.size.height += movementSpeed
                leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                leadingTrail.physicsBody?.affectedByGravity = false
                leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                leadingTrail.physicsBody?.collisionBitMask = 0x0
                leadingTrail.position.x = self.p1Bike.position.x - leadingTrail.size.height / 2
                }])))
        } else if direction == "left" {
            p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: -movementSpeed, y: 0, duration: 1/60), SKAction.run {
                self.p1BikeTip.origin.x -= movementSpeed
                leadingTrail.size.height += movementSpeed
                leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                leadingTrail.physicsBody?.affectedByGravity = false
                leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                leadingTrail.physicsBody?.collisionBitMask = 0x0
                leadingTrail.position.x = self.p1Bike.position.x + leadingTrail.size.height / 2
                }])))
        }
    }
}
class GameScene2: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    
    // restrict movement
    var blueHorizontalShouldWork = true
    var blueVerticalShouldWork = true
    var redHorizontalShouldWork = true
    var redVerticalShouldWork = true
    var p1BikeTip = CGRect()
    var p2BikeTip = CGRect()
    var wallHitbox = CGRect()
    
    // difficulty level
    var wallSize : Double = 10
    var movementSpeed = CGFloat(0.5)
    
    // SpriteNodes
    let p1Bike = SKSpriteNode(imageNamed: "BlueBikeLowRes.png")
    let blueRight = SKSpriteNode(imageNamed: "BlueArrow.png")
    let blueLeft = SKSpriteNode(imageNamed: "BlueArrow.png")
    let blueDown = SKSpriteNode(imageNamed: "BlueArrow.png")
    let blueUp = SKSpriteNode(imageNamed: "BlueArrow.png")
    
    let p2Bike = SKSpriteNode(imageNamed: "RedBikeLowRes.png")
    let redRight = SKSpriteNode(imageNamed: "RedArrow.png")
    let redLeft = SKSpriteNode(imageNamed: "RedArrow.png")
    let redDown = SKSpriteNode(imageNamed: "RedArrow.png")
    let redUp = SKSpriteNode(imageNamed: "RedArrow.png")
    
    
    var timeCounter = 0
    let time = SKLabelNode.init(text: "0")
    
    // for collision detection
    let collisionBikeCategory : UInt32  = 1
    let collisionTrailCategory : UInt32 = 2
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        // for the GUI
        
        let blueBikeStartingPoint = CGPoint(x: frame.size.width / 2, y: frame.size.height / 5)
        let redBikeStartingPoint = CGPoint(x: frame.size.width / 2, y: frame.size.height / 5 * 4)
        let centerOfBlueArrows = CGPoint(x: 150, y: 150)
        let centerOfRedArrows = CGPoint(x: frame.size.width - 150, y: frame.size.height - 150)
        let distanceFromCenter = 75
        
        // contact
        self.physicsWorld.contactDelegate = self
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0, green:0, blue:0, alpha: 1)
        
        p1Bike.position = blueBikeStartingPoint
        p1Bike.setScale(0.2)
        p1Bike.name = "p1Bike"
        p1Bike.physicsBody?.isDynamic = true
        p1Bike.physicsBody = SKPhysicsBody(circleOfRadius: p1Bike.size.width / 3, center: CGPoint(x: 0, y: p1Bike.size.height / 2 - p1Bike.size.width / 2.5))
        p1Bike.physicsBody?.affectedByGravity = false
        p1Bike.physicsBody?.usesPreciseCollisionDetection = true
        p1Bike.physicsBody?.categoryBitMask = collisionBikeCategory
        p1Bike.physicsBody?.contactTestBitMask = collisionTrailCategory
        p1Bike.physicsBody?.collisionBitMask = 0x0
        self.addChild(p1Bike)
        p1BikeTip = CGRect(x: p1Bike.position.x - p1Bike.size.height / 2, y: p1Bike.position.y - p1Bike.size.height / 2, width: p1Bike.size.height, height: p1Bike.size.height)
        wallHitbox = CGRect(x: 0 + p1Bike.size.height, y: 0 + p1Bike.size.height, width: frame.size.width - p1Bike.size.height * 2, height: frame.size.height - p1Bike.size.height * 2)
        
        blueLeft.position = CGPoint(x: centerOfBlueArrows.x - CGFloat(distanceFromCenter), y: centerOfBlueArrows.y)
        blueLeft.name = "left Button"
        blueLeft.zRotation = CGFloat(M_PI_2)
        self.addChild(blueLeft)
        blueLeft.setScale(0.3)
        blueLeft.alpha = 0.5
        
        blueRight.position = CGPoint(x: centerOfBlueArrows.x + CGFloat(distanceFromCenter), y: centerOfBlueArrows.y)
        blueRight.name = "right Button"
        blueRight.zRotation = CGFloat(-M_PI_2)
        self.addChild(blueRight)
        blueRight.setScale(0.3)
        blueRight.alpha = 0.5
        
        blueDown.position = CGPoint(x: centerOfBlueArrows.x, y: centerOfBlueArrows.y - CGFloat(distanceFromCenter))
        blueDown.name = "down Button"
        blueDown.zRotation = CGFloat(M_PI)
        self.addChild(blueDown)
        blueDown.setScale(0.3)
        blueDown.alpha = 0
        
        blueUp.position = CGPoint(x: centerOfBlueArrows.x, y: centerOfBlueArrows.y + CGFloat(distanceFromCenter))
        blueUp.name = "up Button"
        blueUp.zRotation = CGFloat(0)
        self.addChild(blueUp)
        blueUp.setScale(0.3)
        blueUp.alpha = 0
        
        time.position = CGPoint(x: frame.size.width - 50, y: frame.size.height - 50)
        time.fontSize = 20
        self.addChild(time)
        time.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 1), SKAction.run {
            self.timeCounter += 1
            self.time.text = "\(self.timeCounter)"
            }])))
        
        blueHorizontalShouldWork = true
        blueVerticalShouldWork = false
        makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "up")
        
        //redbike stuff
        p2Bike.position = redBikeStartingPoint
        p2Bike.setScale(0.2)
        p2Bike.name = "p2Bike"
        p2Bike.physicsBody?.isDynamic = true
        p2Bike.physicsBody = SKPhysicsBody(circleOfRadius: p2Bike.size.width / 3, center: CGPoint(x: 0, y: p2Bike.size.height / 2 - p2Bike.size.width / 2.5))
        p2Bike.physicsBody?.affectedByGravity = false
        p2Bike.physicsBody?.usesPreciseCollisionDetection = true
        p2Bike.physicsBody?.categoryBitMask = collisionBikeCategory
        p2Bike.physicsBody?.contactTestBitMask = collisionTrailCategory
        p2Bike.physicsBody?.collisionBitMask = 0x0
        self.addChild(p2Bike)
        p2BikeTip = CGRect(x: p2Bike.position.x - p2Bike.size.height / 2, y: p2Bike.position.y - p2Bike.size.height / 2, width: p2Bike.size.height, height: p2Bike.size.height)
        
        redLeft.position = CGPoint(x: centerOfRedArrows.x - CGFloat(distanceFromCenter), y: centerOfRedArrows.y)
        redLeft.name = "left Button"
        redLeft.zRotation = CGFloat(M_PI_2)
        self.addChild(redLeft)
        redLeft.setScale(0.3)
        redLeft.alpha = 0.5
        
        redRight.position = CGPoint(x: centerOfRedArrows.x + CGFloat(distanceFromCenter), y: centerOfRedArrows.y)
        redRight.name = "right Button"
        redRight.zRotation = CGFloat(-M_PI_2)
        self.addChild(redRight)
        redRight.setScale(0.3)
        redRight.alpha = 0.5
        
        redDown.position = CGPoint(x: centerOfRedArrows.x, y: centerOfRedArrows.y - CGFloat(distanceFromCenter))
        redDown.name = "down Button"
        redDown.zRotation = CGFloat(M_PI)
        self.addChild(redDown)
        redDown.setScale(0.3)
        redDown.alpha = 0
        
        redUp.position = CGPoint(x: centerOfRedArrows.x, y: centerOfRedArrows.y + CGFloat(distanceFromCenter))
        redUp.name = "up Button"
        redUp.zRotation = CGFloat(0)
        self.addChild(redUp)
        redUp.setScale(0.3)
        redUp.alpha = 0
        
        p2Bike.zRotation = CGFloat(M_PI)
        redHorizontalShouldWork = true
        redVerticalShouldWork = false
        makeTrail(playerNum: 2, movementSpeed: movementSpeed, direction: "down")
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
        if !p1BikeTip.intersects(wallHitbox) {
            p1Bike.removeFromParent()
        } else if !p1BikeTip.intersects(wallHitbox) {
            p2Bike.removeFromParent()
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionBikeCategory | collisionTrailCategory)) {
            // bike hits trail
            contact.bodyB.node?.removeFromParent()
        }
    } 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Functions for the Buttons
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Functions for the Buttons
        let touch = touches.first!
        
        if blueRight.contains(touch.location(in: self)) && blueHorizontalShouldWork == true {
            blueHorizontalShouldWork = false
            blueVerticalShouldWork = true
            
            blueRight.alpha = 0
            blueLeft.alpha = 0
            blueUp.alpha = 0.5
            blueDown.alpha = 0.5
            
            // move right
            p1Bike.zRotation = CGFloat(-M_PI_2)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "right")
        }
        if blueLeft.contains(touch.location(in: self)) && blueHorizontalShouldWork == true {
            blueHorizontalShouldWork = false
            blueVerticalShouldWork = true
            
            blueRight.alpha = 0
            blueLeft.alpha = 0
            blueUp.alpha = 0.5
            blueDown.alpha = 0.5
            
            // move left
            p1Bike.zRotation = CGFloat(M_PI_2)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "left")
        }
        if blueDown.contains(touch.location(in: self)) && p1Bike.zRotation != CGFloat(0) {
            blueHorizontalShouldWork = true
            blueVerticalShouldWork = false
            
            blueRight.alpha = 0.5
            blueLeft.alpha = 0.5
            blueUp.alpha = 0
            blueDown.alpha = 0
            
            // move down
            p1Bike.zRotation = CGFloat(M_PI)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "down")
        }
        if blueUp.contains(touch.location(in: self)) && blueVerticalShouldWork == true {
            blueHorizontalShouldWork = true
            blueVerticalShouldWork = false
            
            blueRight.alpha = 0.5
            blueLeft.alpha = 0.5
            blueUp.alpha = 0
            blueDown.alpha = 0
            
            // move up
            p1Bike.zRotation = CGFloat(0)
            p1Bike.removeAllActions()
            
            makeTrail(playerNum: 1, movementSpeed: movementSpeed, direction: "up")
        }
        
        // red bike
        if redRight.contains(touch.location(in: self)) && redHorizontalShouldWork == true {
            redHorizontalShouldWork = false
            redVerticalShouldWork = true
            
            redRight.alpha = 0
            redLeft.alpha = 0
            redUp.alpha = 0.5
            redDown.alpha = 0.5
            
            // move right
            p2Bike.zRotation = CGFloat(-M_PI_2)
            p2Bike.removeAllActions()
            
            makeTrail(playerNum: 2, movementSpeed: movementSpeed, direction: "right")
        }
        if redLeft.contains(touch.location(in: self)) && redHorizontalShouldWork == true {
            redHorizontalShouldWork = false
            redVerticalShouldWork = true
            
            redRight.alpha = 0
            redLeft.alpha = 0
            redUp.alpha = 0.5
            redDown.alpha = 0.5
            
            // move left
            p2Bike.zRotation = CGFloat(M_PI_2)
            p2Bike.removeAllActions()
            
            makeTrail(playerNum: 2, movementSpeed: movementSpeed, direction: "left")
        }
        if redDown.contains(touch.location(in: self)) && p1Bike.zRotation != CGFloat(0) {
            redHorizontalShouldWork = true
            redVerticalShouldWork = false
            
            redRight.alpha = 0.5
            redLeft.alpha = 0.5
            redUp.alpha = 0
            redDown.alpha = 0
            
            // move down
            p2Bike.zRotation = CGFloat(M_PI)
            p2Bike.removeAllActions()
            
            makeTrail(playerNum: 2, movementSpeed: movementSpeed, direction: "down")
        }
        if redUp.contains(touch.location(in: self)) && blueVerticalShouldWork == true {
            redHorizontalShouldWork = true
            redVerticalShouldWork = false
            
            redRight.alpha = 0.5
            redLeft.alpha = 0.5
            redUp.alpha = 0
            redDown.alpha = 0
            
            // move up
            p2Bike.zRotation = CGFloat(0)
            p2Bike.removeAllActions()
            
            makeTrail(playerNum: 2, movementSpeed: movementSpeed, direction: "up")
        }
    }
    
    func makeTrail(playerNum : Int, movementSpeed : CGFloat, direction : String) {
        if playerNum == 1 {
            let cornerCircle = SKShapeNode(circleOfRadius: 3)
            cornerCircle.fillColor = #colorLiteral(red: 0.25882354378700256, green: 0.7568627595901489, blue: 0.9686274528503418, alpha: 1.0)
            cornerCircle.position = p1Bike.position
            cornerCircle.zPosition = -0.9
            self.addChild(cornerCircle)
            
            let leadingTrail = SKSpriteNode(imageNamed: "LowResTrail.png")
            leadingTrail.position = CGPoint(x: p1Bike.position.x, y: p1Bike.position.y)
            leadingTrail.zPosition = -1
            leadingTrail.zRotation = p1Bike.zRotation
            leadingTrail.name = "trail"
            self.addChild(leadingTrail)
            leadingTrail.size = CGSize(width: 5, height: 2)
            
            if direction == "down" {
                p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: -movementSpeed, duration: 1/60), SKAction.run {
                    self.p1BikeTip.origin.y -= movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.y = self.p1Bike.position.y + leadingTrail.size.height / 2
                    }])))
            } else if direction == "up" {
                p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: movementSpeed, duration: 1/60), SKAction.run {
                    self.p1BikeTip.origin.y += movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.y = self.p1Bike.position.y - leadingTrail.size.height / 2
                    }])))
            } else if direction == "right" {
                p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: movementSpeed, y: 0, duration: 1/60), SKAction.run {
                    self.p1BikeTip.origin.x += movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.x = self.p1Bike.position.x - leadingTrail.size.height / 2
                    }])))
            } else if direction == "left" {
                p1Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: -movementSpeed, y: 0, duration: 1/60), SKAction.run {
                    self.p1BikeTip.origin.x -= movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.x = self.p1Bike.position.x + leadingTrail.size.height / 2
                    }])))
            }
        } else if playerNum == 2 {
            let cornerCircle = SKShapeNode(circleOfRadius: 3)
            cornerCircle.fillColor = #colorLiteral(red: 0.9372549057006836, green: 0.3490196168422699, blue: 0.1921568661928177, alpha: 1.0)
            cornerCircle.position = p2Bike.position
            cornerCircle.zPosition = -0.9
            self.addChild(cornerCircle)
            
            let leadingTrail = SKSpriteNode(imageNamed: "RedLowResTrail.png")
            leadingTrail.position = CGPoint(x: p2Bike.position.x, y: p2Bike.position.y)
            leadingTrail.zPosition = -1
            leadingTrail.zRotation = p2Bike.zRotation
            leadingTrail.name = "trail"
            self.addChild(leadingTrail)
            leadingTrail.size = CGSize(width: 5, height: 2)
            
            if direction == "down" {
                p2Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: -movementSpeed, duration: 1/60), SKAction.run {
                    self.p2BikeTip.origin.y -= movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.y = self.p2Bike.position.y + leadingTrail.size.height / 2
                    }])))
            } else if direction == "up" {
                p2Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: movementSpeed, duration: 1/60), SKAction.run {
                    self.p2BikeTip.origin.y += movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.y = self.p2Bike.position.y - leadingTrail.size.height / 2
                    }])))
            } else if direction == "right" {
                p2Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: movementSpeed, y: 0, duration: 1/60), SKAction.run {
                    self.p2BikeTip.origin.x += movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.x = self.p2Bike.position.x - leadingTrail.size.height / 2
                    }])))
            } else if direction == "left" {
                p2Bike.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: -movementSpeed, y: 0, duration: 1/60), SKAction.run {
                    self.p2BikeTip.origin.x -= movementSpeed
                    leadingTrail.size.height += movementSpeed
                    leadingTrail.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leadingTrail.size.width, height: leadingTrail.size.height))
                    leadingTrail.physicsBody?.affectedByGravity = false
                    leadingTrail.physicsBody?.categoryBitMask = self.collisionTrailCategory
                    leadingTrail.physicsBody?.collisionBitMask = 0x0
                    leadingTrail.position.x = self.p2Bike.position.x + leadingTrail.size.height / 2
                    }])))
            }
        }
    }
}






// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad

let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
