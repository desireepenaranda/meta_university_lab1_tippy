//
//  TipViewController.m
//  Tippy
//
//  Created by Desiree Penaranda on 7/2/22.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegCtrl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"view did load");
}

- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultSelectedTipIndex = [defaults doubleForKey:@"default_tip_percentage_index"] ? [defaults doubleForKey:@"default_tip_percentage_index"] : 0;

    [self.tipSegCtrl setSelectedSegmentIndex:(NSInteger)defaultSelectedTipIndex];
    [self updateLabelValuesFromTipPercentageSelection];

}
- (IBAction)onTap:(id)sender {
    NSLog(@"Tapped");
    
    [self.view endEditing:true];

    
}
- (IBAction)updateTotal:(id)sender {
    [self updateLabelValuesFromTipPercentageSelection];

}

-(void)updateLabelValuesFromTipPercentageSelection {
    double tipPercentages[] = {0.10, 0.15, 0.20};
    double selectedTipPercent = tipPercentages[self.tipSegCtrl.selectedSegmentIndex];
    
    // calculate tip
    double billAmount = self.billField.text.doubleValue;
    double tip = selectedTipPercent * billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    
    // calculate total bill with tip
    double totalBillIncludingTip = tip + billAmount;
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalBillIncludingTip];
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
