//
//  weekliesViewController.m
//  TeamZero-Lotto
//
//  Created by Paul Christian, Al Mair, Matthew Schwartz, Albert Diaz and Brian Martinez on 10/11/17.
//  Copyright © 2017 Team-Zer0. Absolutely No rights reserved whatsoever.
//

#import "weekliesViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface weekliesViewController ()
{
    UIColor *white;
    UIColor *blue;
    UIColor *black;
    UIColor *gold;
    bool toggle[53];
    int picked[6];
    int goldPicked;
    bool noBalls;
    bool noGoldBalls;
    bool goldToggle[17];
    int numBalls;
    int numPicks;
    int numGold;
}

@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *ball;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSMutableArray *lblPicked;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *goldBalls;
@property (weak, nonatomic) IBOutlet UIButton *btn01;
@property (weak, nonatomic) IBOutlet UIButton *btn02;
@property (weak, nonatomic) IBOutlet UIButton *btn03;
@property (weak, nonatomic) IBOutlet UIButton *btn04;
@property (weak, nonatomic) IBOutlet UIButton *btn05;
@property (weak, nonatomic) IBOutlet UIButton *btn06;
@property (weak, nonatomic) IBOutlet UIButton *btn07;
@property (weak, nonatomic) IBOutlet UIButton *btn08;
@property (weak, nonatomic) IBOutlet UIButton *btn09;
@property (weak, nonatomic) IBOutlet UIButton *btn10;
@property (weak, nonatomic) IBOutlet UIButton *btn11;
@property (weak, nonatomic) IBOutlet UIButton *btn12;
@property (weak, nonatomic) IBOutlet UIButton *btn13;
@property (weak, nonatomic) IBOutlet UIButton *btn14;
@property (weak, nonatomic) IBOutlet UIButton *btn15;
@property (weak, nonatomic) IBOutlet UIButton *btn16;
@property (weak, nonatomic) IBOutlet UIButton *btn17;
@property (weak, nonatomic) IBOutlet UIButton *btn18;
@property (weak, nonatomic) IBOutlet UIButton *btn19;
@property (weak, nonatomic) IBOutlet UIButton *btn20;
@property (weak, nonatomic) IBOutlet UIButton *btn21;
@property (weak, nonatomic) IBOutlet UIButton *btn22;
@property (weak, nonatomic) IBOutlet UIButton *btn23;
@property (weak, nonatomic) IBOutlet UIButton *btn24;
@property (weak, nonatomic) IBOutlet UIButton *btn25;
@property (weak, nonatomic) IBOutlet UIButton *btn26;
@property (weak, nonatomic) IBOutlet UIButton *btn27;
@property (weak, nonatomic) IBOutlet UIButton *btn28;
@property (weak, nonatomic) IBOutlet UIButton *btn29;
@property (weak, nonatomic) IBOutlet UIButton *btn30;
@property (weak, nonatomic) IBOutlet UIButton *btn31;
@property (weak, nonatomic) IBOutlet UIButton *btn32;
@property (weak, nonatomic) IBOutlet UIButton *btn33;
@property (weak, nonatomic) IBOutlet UIButton *btn34;
@property (weak, nonatomic) IBOutlet UIButton *btn35;
@property (weak, nonatomic) IBOutlet UIButton *btn36;
@property (weak, nonatomic) IBOutlet UIButton *btn37;
@property (weak, nonatomic) IBOutlet UIButton *btn38;
@property (weak, nonatomic) IBOutlet UIButton *btn39;
@property (weak, nonatomic) IBOutlet UIButton *btn40;
@property (weak, nonatomic) IBOutlet UIButton *btn41;
@property (weak, nonatomic) IBOutlet UIButton *btn42;
@property (weak, nonatomic) IBOutlet UIButton *btn43;
@property (weak, nonatomic) IBOutlet UIButton *btn44;
@property (weak, nonatomic) IBOutlet UIButton *btn45;
@property (weak, nonatomic) IBOutlet UIButton *btn46;
@property (weak, nonatomic) IBOutlet UIButton *btn47;
@property (weak, nonatomic) IBOutlet UIButton *btn48;
@property (weak, nonatomic) IBOutlet UIButton *btn49;
@property (weak, nonatomic) IBOutlet UIButton *btn50;
@property (weak, nonatomic) IBOutlet UIButton *btn51;
@property (weak, nonatomic) IBOutlet UIButton *btn52;
@property (weak, nonatomic) IBOutlet UIButton *btn53;
@property (weak, nonatomic) IBOutlet UIButton *btnPickForMe;
@property (weak, nonatomic) IBOutlet UIButton *goldBall01;
@property (weak, nonatomic) IBOutlet UIButton *goldBall02;
@property (weak, nonatomic) IBOutlet UIButton *goldBall03;
@property (weak, nonatomic) IBOutlet UIButton *goldBall04;
@property (weak, nonatomic) IBOutlet UIButton *goldBall05;
@property (weak, nonatomic) IBOutlet UIButton *goldBall06;
@property (weak, nonatomic) IBOutlet UIButton *goldBall07;
@property (weak, nonatomic) IBOutlet UIButton *goldBall08;
@property (weak, nonatomic) IBOutlet UIButton *goldBall09;
@property (weak, nonatomic) IBOutlet UIButton *goldBall10;
@property (weak, nonatomic) IBOutlet UIButton *goldBall11;
@property (weak, nonatomic) IBOutlet UIButton *goldBall12;
@property (weak, nonatomic) IBOutlet UIButton *goldBall13;
@property (weak, nonatomic) IBOutlet UIButton *goldBall14;
@property (weak, nonatomic) IBOutlet UIButton *goldBall15;
@property (weak, nonatomic) IBOutlet UIButton *goldBall16;
@property (weak, nonatomic) IBOutlet UIButton *goldBall17;
@property (weak, nonatomic) IBOutlet UILabel *lblDisplay;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segPickGame;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked01;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked02;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked03;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked04;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked05;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked06;
@property (weak, nonatomic) IBOutlet UILabel *lblPickedGold;
@property (weak, nonatomic) IBOutlet UIButton *btnGo;
@end

@implementation weekliesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Define colors used by this application
    white = [[UIColor alloc] initWithRed:1.0 green: 1.0 blue: 1.0 alpha: 1.0];
    blue = [[UIColor alloc] initWithRed:0.1 green: 1.0 blue: 0.9 alpha: 1.0];
    black = [[UIColor alloc] initWithRed:0 green: 0 blue: 0 alpha: 1.0];
    gold = [[UIColor alloc] initWithRed:1 green: 0.792 blue: 0 alpha: 1.0];
    
    // Show Display Message
    _lblDisplay.text = @"First, Pick your game";
    
    // Format Display Screen look
    [[_lblDisplay layer] setCornerRadius: 15];
    [[_lblDisplay layer] setBorderColor:[UIColor blackColor].CGColor];
    [[_lblDisplay layer] setMasksToBounds:YES];
    [[_lblDisplay layer] setBorderWidth:0.8f];


    
    // Format Pick-for-me Button look
    [[_btnPickForMe layer] setBorderColor:[UIColor blackColor].CGColor];
    [[_btnPickForMe layer] setCornerRadius:15];
    [[_btnPickForMe layer] setBorderWidth:0.8f];
    [[_btnPickForMe layer] setMasksToBounds:YES];
    
    // Initiate Game Objects
    noBalls = YES;      // Turn off all white balls
    noGoldBalls = YES;    // Turn off all gold balls
    numBalls = 53;        // Number of Balls initiatlly (all games - max)
    numPicks = 6;        // Number of picks initially (all games - max)
    numGold = 17;        // Number of Gold Balls initially (Lucky Money)
    goldPicked = 0;
    [_btnGo setHidden:YES];
    
    [self gameSetUp]; // Puts Ball objects in proper order in array
    
    NSMutableArray *picked = [[NSMutableArray alloc]init]; // Set up array to hold picks
    for (int x=0;x<numPicks;x++) // Initialized picked array to blanks and display in basket
    {
        [picked addObject:@"  "];
        [_lblPicked[x] setText:picked[x]];
    }
    [_lblPickedGold setText:@"  "];
    for (int y=0; y<numBalls; y++) // Initialize white ball toggles to NO and set UIButton object to look like white ball.
    {
        toggle[y] = NO;
        [[_ball[y] layer] setCornerRadius: 15];
        [[_ball[y] layer] setBorderColor:[UIColor blackColor].CGColor];
        [[_ball[y] layer] setBorderWidth:0.8f];
        [_ball[y] setBackgroundColor:white];
        [_ball[y] setEnabled: NO];
        [_ball[y] setHidden:YES];
    }
    for (int z=0;z<numGold;z++) // Initialize gold ball toggles to NO and set UIButton object to look like golden ball.
    {
        goldToggle[z] = NO;
        
        [[_goldBalls[z] layer] setCornerRadius: 15];
        [[_goldBalls[z] layer] setBorderColor:[UIColor blackColor].CGColor];
        [[_goldBalls[z] layer] setBorderWidth:0.8f];
        [_goldBalls[z] setBackgroundColor:white];
        [_goldBalls[z] setEnabled: NO];
        [_goldBalls[z] setHidden:YES];
    }
    
    [self basketOfPicked]; // Updates basket with picked (all blank right now)
    [_btnPickForMe setHidden:YES]; // Hide pick for me button until game is picked.
    [[_btnGo layer] setCornerRadius: 5];
    [[_btnGo layer] setBorderColor: [UIColor greenColor].CGColor ];
    [[_btnGo layer] setBorderWidth:0.8f];

    [_btnGo setHidden:YES];
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetPickers // Dumps the basket of picked balls and resets the game.
{
    for (int x=0;x<numPicks;x++) {picked[x]=0;}
    noBalls = NO;
}
-(void)resetBalls
{
    for (int x=0;x<53;x++) // Reset selection toggle for all white balls and hides them.
    {
        toggle[x]=NO;
        [_ball[x] setBackgroundColor:white];
        [_ball[x] setEnabled: NO];
        [_ball[x] setHidden:YES];
    }
    for (int y=0;y<17;y++) // Reset selection toggle for all gold balls and hides them.
    {
        goldToggle[y]=NO;
        [_goldBalls[y] setBackgroundColor:gold];
        [_goldBalls[y] setEnabled: NO];
        [_goldBalls[y] setHidden:YES];
        
    }
    noBalls = YES;
    noGoldBalls = YES;
}
-(void)redrawBalls
{
    if (noBalls) // Turn off unselected white balls (pre game or full picked)
    {
        for (int i1=0;i1<numBalls;i1++)
        {
            if (!toggle[i1]) // Leave selected balls available for return
            {
                [_ball[i1] setEnabled: NO];
                [_ball[i1] setHidden:YES];
            }
        }
    }
    else  // Turn ON unselected white balls.
    {
        for (int i2=0;i2<numBalls;i2++)
        {
            if (!toggle[i2])
            {
                [_ball[i2] setEnabled: YES];
                [_ball[i2] setHidden: NO];
            }
        }
    }
    if(noGoldBalls || !noBalls) // Turn off unselected gold balls (pre game or one picked)
    {
        for (int j1=0;j1<numGold;j1++)
        {
            if (!goldToggle[j1])
            {
                [_goldBalls[j1] setEnabled: NO];
                [_goldBalls[j1] setHidden:YES];
            }
        }
    }
    else
    {
        for (int j2=0;j2<numGold;j2++)
        {
            if (!goldToggle[j2])
            {
                [_goldBalls[j2] setEnabled: YES];
                [_goldBalls[j2] setHidden: NO];
            }
        }
    }
}
-(void)basketOfPicked         // Reorder Basket of Picked Balls
{
    [self resetPickers];     // Empty Picked Queue
    int y=0;                 // Will hold picked array index
    for (int x=0; x<numBalls; x++) // Cycle through ball toggles and assign balls to picked array
    {
        if (y==numPicks)
        {noBalls = YES;}
        
        else if (toggle[x])
        {
            picked[y]=x+1;
            y++;
            if (y==numPicks){noBalls = YES;}
        }
        
    }
    goldPicked = 0;         // Empty Gold Picked
    noGoldBalls = NO;
    if (numGold > 0)         // If game is Lucky Money
    {
        for (int g=0; g<numGold; g++) // Cycle through gold ball toggles and find godl picked
        {
            if (goldToggle[g])
            {
                goldPicked = g+1;
                noGoldBalls = YES;
            }
        }
    }
    [self updateDisplay];
}
-(void)updateDisplay
{
    NSLog (@"NoBalls: %d   NoGoldBalls: %d  numGold: %d   numBalls: %d",(int)noBalls, (int)noGoldBalls,numGold,numBalls);
    if (noBalls && !noGoldBalls && numGold == 17)
    {_lblDisplay.text = @"Now pick a gold ball";}
    else if (noBalls && (noGoldBalls || numGold < 17))
    {_lblDisplay.text = @"Ready to play? Hit GO!";
        [_btnGo setHidden:NO];}
    else if (!noBalls && !noGoldBalls && numBalls == 53 && numGold == 17)
    { _lblDisplay.text = @"First, Pick your game";}
    else if (!noBalls && !noGoldBalls)
    {_lblDisplay.text = @"Pick your numbers or let me pick them for you";}

    
}
-(void)displayBasket // Display basket of picked balls
{
    for (int x=0;x<numPicks;x++) // Display white balls
    {
        if (picked[x]==0)
        {[_lblPicked[x] setText: [NSString stringWithFormat:@"  "]];}
        else
        {[_lblPicked[x] setText: [NSString stringWithFormat:@"%02d",picked[x]]];}
    }
    if (goldPicked==0)
    {[_lblPickedGold setText: [NSString stringWithFormat:@"  "]];}
    else
    {[_lblPickedGold setText: [NSString stringWithFormat:@"%02d",goldPicked]];}
    
}
-(void) gameSetUp{
    // Create holder array and place ball buttons in it (for ordering purposes)
    NSMutableArray *ballSet = [[NSMutableArray alloc] initWithObjects:
                               _btn01, _btn02, _btn03, _btn04, _btn05, _btn06, _btn07, _btn08, _btn09, _btn10, _btn11, _btn12, _btn13, _btn14,_btn15, _btn16, _btn17, _btn18, _btn19, _btn20, _btn21, _btn22, _btn23, _btn24, _btn25, _btn26, _btn27, _btn28,
                               _btn29, _btn30, _btn31, _btn32, _btn33, _btn34, _btn35, _btn36, _btn37, _btn38, _btn39, _btn40, _btn41, _btn42,_btn43, _btn44, _btn45, _btn46, _btn47, _btn48, _btn49, _btn50, _btn51, _btn52, _btn53, nil];
    
    for (int i=0;i<53;i++)
    {
        _ball [i] = ballSet[i]; // Transfer holder array to ballSet
    }
    // Create holder array and place pick lables in it (basket)(for ordering purposes)
    NSMutableArray *lblPickedSet = [[NSMutableArray alloc] initWithObjects:
                                    _lblPicked01, _lblPicked02, _lblPicked03, _lblPicked04, _lblPicked05, _lblPicked06, nil];
    
    for (int j=0;j<6;j++)
    {
        _lblPicked[j] = lblPickedSet[j]; // Transfer holder array to lblPickedSet
    }
    // Create holder array and place gold Balls in it (for ordering purposes)
    NSMutableArray *goldBallSet = [[NSMutableArray alloc] initWithObjects:
                                   _goldBall01, _goldBall02, _goldBall03, _goldBall04, _goldBall05, _goldBall06, _goldBall07, _goldBall08, _goldBall09,
                                   _goldBall10, _goldBall11, _goldBall12, _goldBall13, _goldBall14, _goldBall15, _goldBall16, _goldBall17, nil];
    
    for (int j=0;j<17;j++)
    {
        _goldBalls[j] = goldBallSet[j]; // Transfer holder array to goldBallSet
    }
}
- (IBAction)toggle_btn01:(id)sender
{
    NSInteger zz = [[(UIButton *)sender currentTitle] integerValue] -1; // assign number of incoming ball to zz
    if(toggle[zz]) // If ball is ON turn it OFF and make it white (unselected)
    {
        toggle[zz]=NO;
        [_ball[zz] setBackgroundColor:white];
    }
    else // If ball is OFF turn it ON and make it blue (selected)
    {
        toggle[zz]=YES;
        [_ball[zz] setBackgroundColor:blue];
    }
    [self basketOfPicked];    // Update Basket:
    [self displayBasket];     // Um... Display basket? Duh!
    [self redrawBalls];     // Redraw ball slate with newly selected balls.
    
    // Maybe Delete This...
    //if (!noGoldBalls)
    //{
    //    for (UIButton *gb in _goldBalls)
    //    {[gb setEnabled: YES];}
    //}
    
}
- (IBAction)toggle_goldbtn:(id)sender
{
    NSInteger zz = [[(UIButton *)sender currentTitle] integerValue] -1;// assign number of incoming ball to zz
    if(goldToggle[zz])    // If ball is ON turn it OFF and make it white (unselected)
    {
        goldToggle[zz]=NO;
        [_goldBalls[zz] setBackgroundColor:gold];
        noGoldBalls = NO;
        [_btnGo setHidden:YES];
        
    }
    else
    {
        goldToggle[zz]=YES;
        [_goldBalls[zz] setBackgroundColor:blue];
        noGoldBalls = YES;
        [_btnGo setHidden:NO];
    }
    [self basketOfPicked];
    [self displayBasket];
    [self redrawBalls];
    
    // Maybe Delete This...
    //if (!noGoldBalls)
    //{
    //    for (UIButton *gb in _goldBalls)
    //    {[gb setEnabled: YES];}
    //}
}


- (IBAction)segPickGame:(id)sender  // Pick the game
{
    [_btnPickForMe setHidden:NO];   // Turn it off if it isn't already (this if for game change)
    _lblDisplay.text = @"Now, Pick your numbers or let me pick them for you";
    
    // Reset balls to max for initialization below
    numBalls = 53;
    numPicks = 6;
    numGold = 17;
    
    // Empty pickers, baskets and reset balls for new game
    [self resetPickers];
    [self resetBalls];
    [self basketOfPicked];
    [self displayBasket];
    
    
    // Reset balls to zero after game initialtion before new-game set-up.
    numBalls = 0;
    numPicks = 0;
    numGold = 0;
    
    switch(_segPickGame.selectedSegmentIndex)
    {
        case 0: //Fantasy 5
            numBalls = 36;
            numPicks = 5;
            numGold = 0;
            break;
        case 1: //Lucky Money
            numBalls = 47;
            numPicks = 4;
            numGold = 17;
            noGoldBalls = NO;
            break;
        case 2: //Lotto
            numBalls = 53;
            numPicks = 6;
            numGold = 0;
            break;
        default:
            break;
    }
    noBalls = NO;
    [self updateDisplay];
    
    [self redrawBalls];
}
-(int)randomNumber:(int)max // Best damn random generator... period:
{
    int rand=0;
    NSInteger x3=0;
    NSInteger x1 = CFAbsoluteTimeGetCurrent() ;
    NSString *x2 = [NSString stringWithFormat:@"%ld",(long)x1];
    
    for (int i = 0;i<x2.length;i++) // Take all of the digits of the current time and add them together to get x3
    {
        x3 = x3 + [[NSString stringWithFormat:@"%c", [x2 characterAtIndex:(i)]] integerValue];
    }
    
    
    //     The following code will assign a random number to rand (for return) using the following formula:
    //     (Random pick) "crank" times for "x3" cycles where crank is a random number withing cycles and cycles is a random
    //     number basked upon the current date/time.
    //     Min number of picks 1 x 1 x 1 - Max number of picks 99 x 99 x 99 (1,000,000)
    //     Repeated for every random number needed.
    
    int crank[x3]; // for cycling through random crank x3 times.
    
    for (int i2 = 0; i2 < x3;i2++)
    {crank[i2] = arc4random() % x3;} // Assinging random numbers to crank array between 0 - x3
    
    for (int i3 = 0; i3 < x3; i3++) // random gen cycle (x3 times)
    {
        for (int i4 = 0; i4<crank[i3];i4++) // assign random number crank[i3] times.
        {rand=1 + arc4random() % (max-1);}
    }
    NSLog (@"Random Number = %d",rand);
    return rand;
}
- (IBAction)actButtonPickForMe:(id)sender
{
    // Maybe delete this:
    //   for (int p=0;p<numPicks;p++){picked[p]=0;}         //Reset Picks
    //   for (int t=0;t<numBalls;t++){toggle[t]=NO;}     //Reset Toggles
    // and add this:
    [self resetPickers];NSLog(@"Pickers Reset");
    [self resetBalls];NSLog(@"Balls Reset");  //Clear ball board
    [self redrawBalls];NSLog(@"Balls Redrawn");
    
    
    //assign randoms
    for (int i=0;i<numPicks;i++)
    {
        int newBall = [self randomNumber:numBalls];
        if (toggle[newBall-1])
        {
            i--; // Repeat ball selected... Pick another one
        }
        else
        {
            toggle[newBall-1]=YES; // Keep the ball (toggle it "on")
        }
    }
    if (numGold >0)
    {
        int golden =[self randomNumber:numGold]-1;
        goldToggle[golden]=YES;
        [_goldBalls[golden] setHidden: NO];
        [_goldBalls[golden] setEnabled:YES];
        
        
    }
    
    [self basketOfPicked];NSLog(@"Basket Set");
    [self showPickedBalls];NSLog(@"Picked Balls Shown");
    [self displayBasket];NSLog(@"Basket Displayed");
    [self redrawBalls];NSLog(@"Balls Redrawn");
    
}
-(void)showPickedBalls
{
    for (int t=1;t<numBalls;t++)
    {
        NSLog(@"Showing Ball: %d",t);
        if (toggle[t])
        {
            [_ball[t] setBackgroundColor:blue];
            [_ball[t] setEnabled: YES];
            [_ball[t] setHidden:NO];
        }
        else
        {
            [_ball[t] setBackgroundColor:white];
            [_ball[t] setEnabled: NO];
            [_ball[t] setHidden:YES];
        }
    }
}
- (IBAction)actPlayGame:(id)sender {
    
    int winningBall[numPicks];
    int winningGoldBall=0;
    bool checkWin[numBalls];
    int numWinningBalls=0;
    NSString *numbers = @"Winning Numbers are: ";
    for (int r=0;r<numPicks;r++){winningBall[r]=0;}
    for (int s=0;s<numBalls;s++){checkWin[s]=NO;}
    NSLog(@"getting ready to pick");
    for (int t=0;t<numPicks;t++)
    {
        winningBall[t] = [self randomNumber:(numBalls)];
        if (checkWin[winningBall[t]-1])
        {
            t--;
        }
        else
        {
            checkWin[winningBall[t]-1]=YES;
            numbers = [numbers stringByAppendingString:[NSString stringWithFormat:@"%02d ",winningBall[t]]];
            
        }
    }
    for (int q=0;q<numBalls;q++)
    {
        if(checkWin[q] && toggle[q])
        {numWinningBalls++;
            NSLog(@"q: %d - # %d",q,numWinningBalls);}
    }
        numbers = [numbers stringByAppendingString:[NSString stringWithFormat:@" You got %d numbers right.",numWinningBalls]];

    if (numGold > 0)
    {
        winningGoldBall = [self randomNumber:17];
        if (goldToggle[winningGoldBall-1])
        {
            numbers =[numbers stringByAppendingString:[NSString stringWithFormat:@" The winning Gold ball is %d which matches yours!",winningGoldBall]];
        
        }
        else
        {
            numbers =[numbers stringByAppendingString:[NSString stringWithFormat:@" The winning Gold ball is %d.",winningGoldBall]];
        }
        if (goldToggle[winningGoldBall-1] && numWinningBalls == numPicks)
        {
            numbers=[numbers stringByAppendingString:[NSString stringWithFormat:@" YOU WIN!!!! Holy crap, you should play the REAL lottery!"]];
        }
        else
        {
            numbers=[numbers stringByAppendingString:[NSString stringWithFormat:@" Sorry. You loose. Please play again."]];
        }
    }
    else if (numWinningBalls == numPicks)
    {
        numbers=[numbers stringByAppendingString:[NSString stringWithFormat:@" YOU WIN!!!! Holy crap, you should play the REAL lottery!"]];
    }
    else
    {
            numbers=[numbers stringByAppendingString:[NSString stringWithFormat:@" Sorry. You loose. Please play again."]];
    }
    _lblDisplay.text = numbers;
    [self resetBalls];
    [self resetPickers];
    [_segPickGame setSelectedSegmentIndex:-1];
    [_btnPickForMe setHidden:YES];
    [_btnGo setHidden:YES];
}



@end

