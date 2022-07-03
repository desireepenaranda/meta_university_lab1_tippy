//
//  SettingsViewController.m
//  Tippy
//
//  Created by Desiree Penaranda on 7/3/22.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegCtrl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)updateDefaultTipPercentage:(UISegmentedControl*)sender {
    double tipPercentages[] = {0.10, 0.15, 0.20};
    
    
    
    double updatedDefaultTipPercentageIndex = sender.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:updatedDefaultTipPercentageIndex forKey:@"default_tip_percentage_index"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
