//
//  ViewController.m
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/6/9.
//

#import "ViewController.h"
#import "TestAndStudy-Swift.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *nameArray;

@end

@implementation ViewController

-(NSArray *)nameArray{
    if (!_nameArray) {
        _nameArray = @[@"测试", @"学习",@"Swift学习"];
    }
    return _nameArray;;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"列表";
    self.view.backgroundColor = [UIColor whiteColor];

    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNavStatusHeight, KScreenWidth, KScreenHeight - KNavStatusHeight)];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TestViewController *vc = [[TestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){
        StudyViewController *vc = [[StudyViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 2){
        StudySwiftVC *vc = [[StudySwiftVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.nameArray.count;
}



@end
