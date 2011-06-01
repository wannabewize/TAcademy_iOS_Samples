//
//  PagingExerciseViewController.m
//  PagingExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PagingExerciseViewController.h"

#define IMAGE_NUM 4


@implementation PagingExerciseViewController

- (void)dealloc {
	[scrollView release];
	[pageControl release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadContentsPage:(int)pageNo {	
	if ( pageNo < 0 || pageNo < loadedPageCount || pageNo >= IMAGE_NUM )
		return;
	
	float width = scrollView.frame.size.width;
	float height = scrollView.frame.size.height;
	
	pageControl.numberOfPages = IMAGE_NUM;
	
	NSString *fileName = [NSString stringWithFormat:@"image%d", pageNo];
	NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
	UIImage *image = [UIImage imageWithContentsOfFile:filePath];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	imageView.frame = CGRectMake(width * pageNo, 0, width, height);
	[scrollView addSubview:imageView];
	loadedPageCount++;
	
	[imageView release];	
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	float width = scrollView.frame.size.width;	
	float offsetX = scrollView.contentOffset.x;
	int pageNo = floor(offsetX / width);
	pageControl.currentPage = pageNo;	
	
	[self loadContentsPage:pageNo-1];
	[self loadContentsPage:pageNo];
	[self loadContentsPage:pageNo+1];	
}



#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	float width = scrollView.frame.size.width;
	float height = scrollView.frame.size.height;
	
	scrollView.delegate = self;
	scrollView.pagingEnabled = YES;
	scrollView.contentSize = CGSizeMake(width * IMAGE_NUM, height);
	
	loadedPageCount = 0;
	[self loadContentsPage:0];
	[self loadContentsPage:1];
}




- (void)viewDidUnload {
	[scrollView release];
	scrollView = nil;
	[pageControl release];
	pageControl = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
