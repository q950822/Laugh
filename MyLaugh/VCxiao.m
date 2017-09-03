//
//  VCxiao.m
//  MyLaugh
//
//  Created by qinxianjin on 2017/8/31.
//  Copyright © 2017年 qinxianjin. All rights reserved.
//

#import "VCxiao.h"
#import "MyNetworking.h"
#import "RootDataModel.h"
#import "TextTableViewCell.h"

#define TEXTURL @"http://api.avatardata.cn/Joke/NewstImg?key=c99d766d9afa8953ca81408337ce419f&page=%d"

@interface VCxiao ()

{
    int _currenPage;
    NSMutableArray *_dataArray;
    UIButton *_moreBtn;
}
@end

@implementation VCxiao

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _currenPage = 1;
    self.title = @"笑一笑";
    [MyNetworking sharedNetWorking].HTTPHeaderDic = @{@"apikey" : @"c99d766d9afa8953ca81408337ce419f"};
    _dataArray = [[NSMutableArray alloc]init];
    _moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _moreBtn.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
    [_moreBtn setTitle:@"加载更多..." forState:UIControlStateNormal];
    [_moreBtn addTarget:self action:@selector(readMore) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = _moreBtn;
    [self getDataWithPage:_currenPage];
    [self creatRefresh];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataContentlistModel *model = _dataArray[indexPath.row];
    return model.height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextTableViewCell"];
    if (cell == nil) {
        cell = [[TextTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TextTableViewCell"];
    }
    DataContentlistModel *model = _dataArray[indexPath.row];
    cell.title = model.title;
    cell.content = model.text;
    cell.date = [NSString stringWithFormat:@"更新时间:%@",[model.ct substringToIndex:10]];
    
    if (model.height == 0) {
        model.height = [cell getHeight];
    }
    else
    {
        [cell setContentLabelHeight:model.height-56];
    }
    
    return cell;
}

-(void) getDataWithPage:(int) page
{
    [MyNetworking getRequestWithURLString:[NSString stringWithFormat:TEXTURL,page] finish:^(BOOL success, NSData *data) {
        if (success) {
            _currenPage++;
            NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (dataDic == nil) {
                [self getDataWithPage:_currenPage];
            }
            else
            {
                NSDictionary *dic = dataDic[@"showapi_res_body"];
                RootDataModel *model = [[RootDataModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [_dataArray addObjectsFromArray:model.contentlist];
                [self.tableView reloadData];
            }
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"网络或服务器异常" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

-(void) creatRefresh
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _dataArray.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
