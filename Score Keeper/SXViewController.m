//
//  SXViewController.m
//  Score Keeper
//
//  Created by Caleb Hicks on 5/21/14.
//  Copyright (c) 2014 Dev Mountain. All rights reserved.
//

#import "SXViewController.h"

@interface SXViewController ()

@property (nonatomic, strong) NSMutableArray *scoreCells;
@property (nonatomic, strong) NSMutableArray *scoreFields;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *addPlayer;
@property (nonatomic, strong) UIButton *removePlayer;

@end

@implementation SXViewController

static CGFloat scoreHeight = 90;
static CGFloat nameFieldWidth = 90;
static CGFloat scoreFieldWidth = 60;
static CGFloat stepperButtonWidth = 90;
static CGFloat buttonWidth = 130;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Score Keeper";
    self.scoreCells = [NSMutableArray new];
    self.scoreFields = [NSMutableArray new];
    
    
    // Create, size, initialize and place the scrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*2)];
    [self.view addSubview:self.scrollView];
    
    
    // Create first instance for initial cell
    [self createPlayerScoreCell];

    [self updateButtons];
    
}

- (void)createPlayerScoreCell{
    
    NSInteger trackNumberOfCells = [self.scoreCells count];
    
    // Create a View for everything to fit inside of
    
    UIView *cellView = [[UIView alloc] initWithFrame: CGRectMake(0, scoreHeight*trackNumberOfCells, self.view.frame.size.width, scoreHeight)];
    //cellView.backgroundColor = [UIColor purpleColor];
    
    UITextField *playerName = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, nameFieldWidth, scoreHeight)];
    playerName.placeholder =  @"Name";
    [cellView addSubview:playerName];
    
    
    // Create a UITextField for the points
    
    UITextField *playerScore = [[UITextField alloc] initWithFrame:CGRectMake(110, 0, scoreFieldWidth, scoreHeight)];
    playerScore.placeholder =  @"0";
    
    [cellView addSubview:playerScore];
    
    // Create the UIStepper (minus plus buttons)
    
    UIStepper *subOrAddScore = [[UIStepper alloc] initWithFrame:CGRectMake(200, 30, stepperButtonWidth, scoreHeight)];
    
    [cellView addSubview:subOrAddScore];
    
    
    // Create a border view for the bottom
    
    UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, scoreHeight - 1, self.view.frame.size.width, 1)];
    border.backgroundColor = [UIColor lightGrayColor];
    [cellView addSubview:border];
    
    // Add to the NSMutableArray scoreCells
    [self.scoreCells addObject:cellView];
    
    // Display the cellView
    [self.scrollView addSubview:cellView];
    
    // Move the buttons to their new spot
    [self updateButtons];
    
}

- (void)removePlayerScoreCell{
    
    [self.scoreCells.lastObject removeFromSuperview];
    [self.scoreCells removeLastObject];
    [self updateButtons];
    
}

- (void)increasePlayerScore{
    

    
}

- (void)decreasePlayerScore{
    
    
    
}

- (void)updateScrollViewSize{
    
    //self.scrollView = [self.scoreCells count];
}

- (void)updateButtons{
    
    // Remove current buttons
    [self.addPlayer removeFromSuperview];
    [self.removePlayer removeFromSuperview];
    
    // Create the Add Player UIButton with text color Blue
    
    self.addPlayer = [[UIButton alloc] initWithFrame:CGRectMake(20, ([self.scoreCells count]*scoreHeight) + 60, buttonWidth, 45)];
    NSString *addPlayerTitleText = @"Add Player";
    [self.addPlayer setTitle:addPlayerTitleText forState:UIControlStateNormal];
    [self.addPlayer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addPlayer addTarget:self action:@selector(createPlayerScoreCell) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addPlayer];
    
    
    // Create the Remove Player UIButton with text color Blue
    
    self.removePlayer = [[UIButton alloc] initWithFrame:CGRectMake(160, ([self.scoreCells count]*scoreHeight) + 60, buttonWidth, 45)];
    NSString *removePlayerTitleText = @"Remove Player";
    [self.removePlayer setTitle:removePlayerTitleText forState:UIControlStateNormal];
    [self.removePlayer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.removePlayer addTarget:self action:@selector(removePlayerScoreCell) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.removePlayer];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
