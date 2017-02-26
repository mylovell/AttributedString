//
//  ViewController.m
//  图文混排
//
//  Created by LuoFeng on 2017/2/25.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UIWebView *iWebView;
@property(nonatomic, strong)UITextView *iTextView;
@property(nonatomic, strong)UILabel *iLabel;
@property(nonatomic, strong)UITextField *iTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    富文本技术：
    1、图文混排
    2、随意修改文字样式
    3、能否有点击交互？？
    */
    
    
//    UITableView *iTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWith, screenHeight) style:UITableViewStyleGrouped];
//    iTableView.delegate = self;
//    iTableView.dataSource = self;
//    [self.view addSubview:iTableView];
//    
    
    
    
    //TextView：可以展示富文本,可以点击超链接
//    [self useNSMutableAttrbutedStringWithTextView];
    
//    [self useNSMutableAttrbutedStringWithWebView];//可以点击

//    [self useNSMutableAttrbutedStringWithTextKit];
    
    
//    NSLog(@"familyNames:\n%@",[UIFont familyNames]);
    
}

//UITextView、UITextField、UILabel都有attributedText属性
- (void)useNSMutableAttrbutedStringWithTextView{
    
    //1、可变富文本字符串
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"黄色的树林"];
    
    
    //2、添加属性（1、两种方法 2、注意添加的属性只在汉字上会特殊 3、如果不是自己想要的效果，可以再建一个富文本，最后拼凑）
    
    //字体
    [string1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25] range:NSMakeRange(0, 2)];
    [string1 addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15] } range:NSMakeRange(2, 2)];
    //背景颜色
    [string1 addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 3)];
    //文字颜色
    [string1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    //添加点击链接
    [string1 addAttribute:NSLinkAttributeName value:@"www.baidu.com" range:NSMakeRange(2, 2)];
    
    
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:@"分出两条路"];
    [string2 addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12] } range:NSMakeRange(0, 1)];
    [string1 appendAttributedString:string2];
    
    
    //图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"bitch.jpeg"];
    attach.bounds = CGRectMake(0, 0, 30, 30);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    
    [string1 appendAttributedString:attachString];
    self.iTextView.attributedText = string1;
    self.iTextView.editable = NO;
    self.iTextView.delegate = self;
    [self.view addSubview:self.iTextView];
}

- (void)useNSMutableAttrbutedStringWithWebView{
    //本地图片
//    NSString *filePath = @"file://";
//    filePath = [filePath stringByAppendingString: [[NSBundle mainBundle] pathForResource:@"120x120" ofType:@"png"]];
    
    //网络图片
    NSString *filePath = @"http://b-ssl.duitang.com/uploads/item/201511/02/20151102190232_V4KZ8.jpeg";
    
    NSString *html = [NSString stringWithFormat:
                      @"<font color='red'>喝喝达</font>123<font color='green'>456</font><img width='35' height='35' src='%@'><a href='http://www.baidu.com'>百度链接</a>",filePath];
    [self.iWebView loadHTMLString:html baseURL:nil];
    self.iWebView.scrollView.scrollEnabled = NO;
    
}

- (void)useNSMutableAttrbutedStringWithTextKit{
    
    //storage --> layoutManager --> textContainer --> textView
    //显示一串文本就要做这么多的事情.....
    
    
    //容器装载内容
    NSTextStorage *storage = [[NSTextStorage alloc] init];
    [storage replaceCharactersInRange:NSMakeRange(0, 0) withString:@"未选择的路-弗罗斯特\n\n黄色的树林里分出两条路，\n可惜我不能同时去涉足，\n我在那路口久久伫立，\n我向着一条路极目望去，\n直到它消失在丛林深处。\n但我却选了另外一条路，\n它荒草萋萋，十分幽寂，\n显得更诱人、更美丽，\n虽然在这两条小路上，\n都很少留下旅人的足迹，\n虽然那天清晨落叶满地，\n两条路都未经脚印污染。\n啊，留下一条路等改日再见！\n但我知道路径延绵无尽头，\n恐怕我难以再回返。\n也许多少年后在某个地方，\n我将轻声叹息把往事回顾，\n一片树林里分出两条路，\n而我选了人迹更少的一条，\n从此决定了我一生的道路。"];
    //容器高亮某些内容
    [storage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    
    //容器给内容添加布局
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    [storage addLayoutManager:layoutManager];
    
    //带有内容和布局的容器
    NSTextContainer *textContainer = [NSTextContainer new];
    [layoutManager addTextContainer:textContainer];
    
    
    //给textView添加带有内容和布局的容器
    UITextView *myTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, 200) textContainer:textContainer];
    myTextView.scrollEnabled = NO;
    myTextView.editable      = YES;
    [self.view addSubview:myTextView];
    
    
    //设置图片的位置
    CGRect imageViewRect = CGRectMake(30, 60, 50, 50);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewRect];
    imageView.image = [UIImage imageNamed:@"AnswerCardTick"];
    imageView.backgroundColor = [UIColor orangeColor];
    [myTextView addSubview:imageView];
    
    //设置环绕路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(30, 50, 50, 50)];
    myTextView.textContainer.exclusionPaths = @[path];
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    //打开链接
    return YES;
}



#pragma mark - 懒加载
- (UIWebView *)iWebView{
    if (!_iWebView) {
        _iWebView = [[UIWebView alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, 200)];
    }
    return _iWebView;
}

- (UITextView *)iTextView{
    if (!_iTextView) {
        _iTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, 200)];
    }
    return _iTextView;
}

- (UILabel *)iLabel
{
    if (!_iLabel) {
        _iLabel = [[UILabel alloc] init];
    }
    return _iLabel;
}

- (UITextField *)iTextField
{
    if (_iTextField) {
        _iTextField = [[UITextField alloc] init];
    }
    return _iTextField;
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return 1;
}

static NSString *showCell = @"showCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
    }
    return cell;
}



#pragma mark - 其他
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"screenHeight--%f",screenHeight);
    
}

@end
