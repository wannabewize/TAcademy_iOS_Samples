#import "ThreeViewsViewController.h"

@implementation ThreeViewsViewController

- (void)dealloc {
    [super dealloc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    redView.backgroundColor = [UIColor redColor];
    redView.alpha = 0.5;
    [self.view addSubview:redView];
    [redView release];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(100, 80, 200, 200)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.alpha = 0.5;
    [self.view addSubview:blueView];
    [blueView release];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(50, 180, 200, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.alpha = 0.5;
    [self.view addSubview:greenView];
    [greenView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
