//
//  iCareCellScrollView.m
//  iCareTest
//
//  Created by Kevin Lee on 13-5-16.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "iCareCellScrollView.h"


@implementation iCareCellScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (iPhone5) {
        appHeight = HeightFOR5;
    }
    else
    {
        appHeight = HeightFOR4;
    }
    
    if (self) {
        
        
        // Initialization code
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(Width * 1, appHeight *1);
        self.backgroundColor = BackgroundColor;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        
        self.scrollview_content = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, appHeight)];
        self.scrollview_content.contentSize = CGSizeMake(Width, appHeight *2);
        self.scrollview_content.backgroundColor = BackgroundColor;
        self.scrollview_content.bounces = YES;
        self.scrollview_content.alwaysBounceVertical = YES;
        
        [self addSubview:self.scrollview_content];
        
        //[self layoutTitleView];
        //[self layoutConentView];
//        [self layoutBackBtn];
    }
    return self;
}

-(void)layoutTitleView
{
    // Load the file content and read the data into arrays
    _label_title = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, Width-20, 30)];
    
    //_label_title.text = @"深圳警方抓获威胁航班事件犯罪嫌疑人";
    _label_title.backgroundColor = [UIColor clearColor];
    _label_title.font = [UIFont systemFontOfSize:17.0];
    [self.scrollview_content addSubview:_label_title];
    
    _label_source = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 200, 20)];
    _label_source.backgroundColor = [UIColor clearColor];
    _label_source.font = [UIFont systemFontOfSize:10.0];
    _label_source.textColor = [UIColor colorWithRed:77/255.0 green:140/255.0 blue:170/255.0 alpha:1];
    //    NSString *sourceText = @"人民网 分享";
    //    [sourceText sizeWithFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(60, 999999.0f) lineBreakMode:UILineBreakModeWordWrap];
    //_label_source.text = @"人民网 分享";
    [self.scrollview_content addSubview:_label_source];
    
    /*_label_time = [[UILabel alloc]initWithFrame:CGRectMake(200, 40, 100, 20)];
    _label_time.backgroundColor = [UIColor clearColor];
    _label_time.font = [UIFont systemFontOfSize:10.0];
    _label_time.text = @"05-16 08:24";
    [self.scrollview_content addSubview:_label_time];*/
    
    /*_btn_share = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn_share setBackgroundImage:[UIImage imageNamed:@"icare_iphone_button_zhuanbo_down"] forState:UIControlStateNormal];
    
    [_btn_share setFrame:CGRectMake(Width - 57, 32, 50, 36)];
    _btn_share.adjustsImageWhenHighlighted = YES;
    [self.scrollview_content addSubview:_btn_share];*/

}

-(void)initContentString:(NSString *)strctent
{
    strContent = strctent;
}

-(void)layoutConentView
{
   /*strContent = @"据深圳公安局最新消息，经过19小时连续奋战，我局专案组在上级公安机关的指挥和东莞等地警方的配合下，于16日凌晨3时15分，在东莞市常平镇一出租屋内将犯罪嫌疑人王某亮（男，26岁，内蒙古人，无业）抓获。经初审，王某亮对连续6次拨打电话谎称飞机上有炸弹的犯罪事实供认不讳。此案在进一步调查中。\n \n一小时内五架飞往深圳航班连遭\"诈弹\"\n \n昨日8时前后一小时内，深圳航空、东方航空和吉祥航空陆续接到威胁电话，称“飞机上有炸弹”，共有五个航班受影响。中国民航局随后证实，这些威胁系虚假恐怖消息。目前，包括深圳市公安局在内的公安机关正全力追查犯罪嫌疑人。\n\n“有惊无险”顺利抵达 \n\n受影响的五个航班，目的地均为深圳宝安机场。";*/
       
    CGSize labelStrSize = [strContent sizeWithFont:[UIFont systemFontOfSize:15.0] constrainedToSize:CGSizeMake(290, 99999.0) lineBreakMode:NSLineBreakByWordWrapping];
    _label_content = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, labelStrSize.width, labelStrSize.height)];
   
    _label_content.backgroundColor = [UIColor clearColor];
    _label_content.font = [UIFont systemFontOfSize:15.0];
    _label_content.text = strContent;
    //_label_content.text = nsstring;
    _label_content.numberOfLines = 0;
    [self.scrollview_content addSubview:_label_content];
    
    self.scrollview_content.contentSize = CGSizeMake(labelStrSize.width, labelStrSize.height + 65*2);
}

-(void) removeContent {
    strContent = nil;
    if(self!=nil)
    for(UIView *subview in [self.scrollview_content subviews]) {
        if([subview isKindOfClass:[UILabel class]]) {
            [subview removeFromSuperview];
        }
    }
}


//-(void)layoutBackBtn
//{
//    UIView *view_btnBackground = [[UIView alloc]initWithFrame:CGRectMake(0, Height - 40, Width, 40)];
//    view_btnBackground.backgroundColor = BackgroundColor;
//    [self addSubview:view_btnBackground];
//    
//    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icare_iphone_cell_button_upflag"]];
//    [imgView setFrame:CGRectMake(view_btnBackground.frame.size.width - 32, 13, 26, 14)];
//    [view_btnBackground addSubview:imgView];
//    
//    _btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
////    _btn_back.backgroundColor = BackgroundColor;
//    [_btn_back setBackgroundImage:[UIImage imageNamed:@"icare_iphone_cell_button_shadowline"] forState:UIControlStateNormal];
//    
//    [_btn_back setFrame:CGRectMake(0, Height - 45 , Width, 45)];
////    _btn_back.adjustsImageWhenHighlighted = YES;
//    [_btn_back addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_btn_back];
//}
//
//-(void)backClick:(id)sender
//{
//    [self.tabledelegate backTableView:self.subIndex];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
