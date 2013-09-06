//
//  iCareCell.m
//  iCareTest
//
//  Created by Kevin Lee on 13-5-16.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

//iCareTest is the outside cell.

#import "iCareCell.h"

@implementation iCareCell
NSArray *tableTitle;
NSArray *newsDescription;
NSArray *newsContents;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"datalist" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    tableTitle = [dict objectForKey:@"newsTitle"];
    newsDescription = [dict objectForKey:@"newsDescription"];
    newsContents = [dict objectForKey:@"newsContent"];
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        if (iPhone5) {
            appHeight = HeightFOR5;
        }
        else
        {
            appHeight = HeightFOR4;
        }

        
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _cellView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 65)];
        _cellView.backgroundColor = BackgroundColor;
        _cellView.clipsToBounds = YES;
//        _cellView.backgroundColor = [UIColor redColor];
        _myScrollview = [[iCareCellScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, appHeight)];
        
        [self addSubview:_myScrollview];
        [self addSubview:_cellView];
        
        [self layoutCellView];
        [self layoutBackBtn];
    }
    return self;
}

-(void)layoutCellView
{
    _label_title = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, Width-20, 30)];
    //_label_title.text = @"深圳警方抓获威胁航班事件犯罪嫌疑人";
    _label_title.backgroundColor = [UIColor clearColor];
    _label_title.font = [UIFont systemFontOfSize:17.0];
    [self.cellView addSubview:_label_title];
    
    _label_source = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 200, 20)];
    _label_source.backgroundColor = [UIColor clearColor];
    _label_source.font = [UIFont systemFontOfSize:10.0];
    //NSString *sourceText = @"人民网 分享";
    //[sourceText sizeWithFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(60, 999999.0f) lineBreakMode:UILineBreakModeWordWrap];
    //_label_source.text = @"人民网 分享";
    [self.cellView addSubview:_label_source];
    
    /*_label_time = [[UILabel alloc]initWithFrame:CGRectMake(250, 40, 100, 20)];
    _label_time.backgroundColor = [UIColor clearColor];
    _label_time.font = [UIFont systemFontOfSize:10.0];
    _label_time.text = @"05-16 08:24";
    [self.cellView addSubview:_label_time];＊*/
    
    _imgView_line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 2, 320, 2)];
    [_imgView_line setImage:[UIImage imageNamed:@"list_divider_line"]];
    [self.cellView addSubview:_imgView_line];
    
}

-(void)layoutBackBtn
{
    UIView *view_btnBackground = [[UIView alloc]initWithFrame:CGRectMake(0, appHeight  - 40, Width, 40)];
    view_btnBackground.backgroundColor = BackgroundColor;
    
    [self addSubview:view_btnBackground];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icare_iphone_cell_button_upflag"]];
    [imgView setFrame:CGRectMake(view_btnBackground.frame.size.width - 32, 13, 26, 14)];
    [view_btnBackground addSubview:imgView];
    
    _btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
    //    _btn_back.backgroundColor = BackgroundColor;
    [_btn_back setBackgroundImage:[UIImage imageNamed:@"icare_iphone_cell_button_shadowline"] forState:UIControlStateNormal];

    [_btn_back setFrame:CGRectMake(0, appHeight - 45 , Width, 45)];
    //    _btn_back.adjustsImageWhenHighlighted = YES;
    [_btn_back addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btn_back];
}

-(void)backClick:(id)sender
{
    [self.myScrollview.scrollview_content setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.tabledelegate backTableView:self.subIndex];
}

-(void)changeContent:(BOOL)expand
{
    if (expand) {
        self.myScrollview.hidden = NO;
        self.myScrollview.alpha = 0.0;
        self.cellView.alpha = 1.0;
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             self.myScrollview.alpha = 1;
                             self.cellView.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                            self.cellView.hidden = YES;
                            
                         }
         
         ];
        [self.myScrollview removeContent];
        [self.myScrollview layoutTitleView];
       
        self.myScrollview.label_title.text = [tableTitle objectAtIndex:self.tag];
        self.myScrollview.label_source.text = [newsDescription objectAtIndex:self.tag];
        [self.myScrollview initContentString:[newsContents objectAtIndex:self.tag]];
        [self.myScrollview layoutConentView];
        //self.myScrollview.label_content.text = [newsContents objectAtIndex:self.tag];
       
    }else
    {
        self.cellView.hidden = NO;
        self.myScrollview.hidden = NO;
        self.myScrollview.alpha = 1.0;
        self.cellView.alpha = 0;
        [UIView animateWithDuration:0.8
                              delay:0.0
                            options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             self.myScrollview.alpha = 0;
                             self.cellView.alpha = 1.0;
                             
                         }
                         completion:^(BOOL finished) {
                             self.myScrollview.hidden = YES;
                             
                         }
         
         ];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
