//
//  dailiesViewController.m
//  TeamZero-Lotto
//
//  Created by user130164 on 10/11/17.
//  Copyright © 2017 paulc. All rights reserved.
//

#import "dailiesViewController.h"


@interface dailiesViewController ()
{
    
    NSInteger pix;
    
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *pkrNumberPicker;
@property (strong, nonatomic) NSArray * games;
@property (strong, nonatomic) NSArray * pickerNumbers;
@property (weak, nonatomic) IBOutlet UISwitch *swtQuickPick;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;

@property (weak, nonatomic) IBOutlet UILabel *lblUserNumbers;




@end

@implementation dailiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pix = 5;
    _games = @[@"Pick Two",
               @"Pick 3",
               @"Pick 4",
               @"Pick 5"];
    _pickerNumbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    
    self.pkrNumberPicker.delegate = self;
    [_pkrNumberPicker setHidden:YES];
    _btnPlay.enabled = NO;
    [_swtQuickPick setOn:NO animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segGamePicked:(id)sender {
    pix = _segPicker.selectedSegmentIndex +2;
    if (![_swtQuickPick isOn]) {
        [_pkrNumberPicker setHidden:NO];
        self.pkrNumberPicker.delegate = self;
    }
    _btnPlay.enabled = YES;
    
    /*
     #pragma mark - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{return pix;}

//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{return _nbr01[row];}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{return _pickerNumbers.count;}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return _pickerNumbers[row];
    
}
- (IBAction)swtchQuickPickToggle:(id)sender {
    if ([_swtQuickPick isOn]) {
        [_pkrNumberPicker setHidden:YES];
    }
    else {
        [_pkrNumberPicker setHidden:NO];
        [_pkrNumberPicker setDelegate:self];
    }
}
- (IBAction)btnPlayPressed:(id)sender {
    int picks = (int)_segPicker.selectedSegmentIndex +2;
    //int row;
    //NSMutableArray *pickerData;
    NSLog(@"Picks: %d",picks);
    NSString *pickerDataString,*winMsg,*winTotal;
    NSMutableArray *userNumbers = [[NSMutableArray alloc] init];
    int uNumbers[picks];
    int wNumbers[picks];
    NSMutableArray *winningNumbers = [[NSMutableArray alloc] init];
    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:nil ascending:true];
    for (int i=0; i < picks; i++)
    {
        NSLog(@"Iteration: %d",i);
        wNumbers[i] = arc4random_uniform(9);
        [winningNumbers addObject: [NSNumber numberWithInt:wNumbers[i]]];
        if ([_swtQuickPick isOn]) {
            uNumbers[i]=arc4random_uniform(9);
            [userNumbers addObject: [NSNumber numberWithInt:arc4random_uniform(9)]];}
        else {
            uNumbers[i] = (int)[_pkrNumberPicker selectedRowInComponent:i];
            //row = [_pkrNumberPicker selectedRowInComponent:i];
            pickerDataString = [NSString stringWithFormat:@"%d",uNumbers[i]];
            [userNumbers addObject:pickerDataString];
        }
    }
    NSLog(@"%@", userNumbers);
    
    NSArray *finalUserNumbers = [userNumbers sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *finalWinningNumbers = [winningNumbers sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    NSString *userNumDisplay = [finalUserNumbers componentsJoinedByString:@", "];
    NSString *winningNumDisplay = [finalWinningNumbers componentsJoinedByString:@", "];
    
    switch(_segPicker.selectedSegmentIndex) {
        case 0:
            winTotal = @"$50";
            break;
        case 1:
            winTotal = @"$500";
            break;
        case 2:
            winTotal = @"$5000";
            break;
        case 3:
            winTotal = @"$50000";
            break;
    }
    winMsg = [NSString stringWithFormat:@"Your numbers are:\n%@\nThe winning numbers are:\n%@\n",userNumDisplay,winningNumDisplay];
    if ([userNumDisplay isEqualToString:winningNumDisplay]) {
        winMsg=[NSString stringWithFormat:@"%@You are a winner! You win %@!",winMsg,winTotal];}
    else{
        winMsg=[NSString stringWithFormat:@"%@You are not a winner!\nYou could have won %@!",winMsg,winTotal];}
    
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Game Results"
                                  message:winMsg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {[alert dismissViewControllerAnimated:YES completion:nil];}];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
    /*
    NSInteger row;
    NSMutableArray *pickerData;
    NSString *pickerDataString,*winMsg,*winTotal;
    NSMutableArray *userNumbers = [[NSMutableArray alloc] init];
    NSMutableArray *winningNumbers = [[NSMutableArray alloc] init];
    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:nil ascending:true];
    for (int i=1; i <= _segPicker.selectedSegmentIndex+2; i++)
    {
        [winningNumbers addObject: [NSNumber numberWithInt:arc4random_uniform(9)]];
        if ([_swtQuickPick isOn]) {
            [userNumbers addObject: [NSNumber numberWithInt:arc4random_uniform(9)]];}
        else {
            
            row = [_pkrNumberPicker selectedRowInComponent:i];
            pickerDataString = [pickerData objectAtIndex:i];
            [userNumbers addObject:pickerDataString];
        }
    }
    NSLog(@"%@", userNumbers);
    
    NSArray *finalUserNumbers = [userNumbers sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *finalWinningNumbers = [winningNumbers sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    NSString *userNumDisplay = [finalUserNumbers componentsJoinedByString:@", "];
    NSString *winningNumDisplay = [finalWinningNumbers componentsJoinedByString:@", "];
    
    switch(_segPicker.selectedSegmentIndex) {
        case 0:
            winTotal = @"$50";
            break;
        case 1:
            winTotal = @"$500";
            break;
        case 2:
            winTotal = @"$5000";
            break;
        case 3:
            winTotal = @"$50000";
            break;
    }
    winMsg = [NSString stringWithFormat:@"Your numbers are:\n%@\nThe winning numbers are:\n%@\n",userNumDisplay,winningNumDisplay];
    if ([userNumDisplay isEqualToString:winningNumDisplay]) {
        winMsg=[NSString stringWithFormat:@"%@You are a winner! You win %@!",winMsg,winTotal];}
    else{
        winMsg=[NSString stringWithFormat:@"%@You are not a winner!\nYou could have won %@!",winMsg,winTotal];}
    
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Game Results"
                                  message:winMsg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {[alert dismissViewControllerAnimated:YES completion:nil];}];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    */
}

@end

