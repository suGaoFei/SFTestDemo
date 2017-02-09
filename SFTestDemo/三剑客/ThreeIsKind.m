//
//  ThreeIsKind.m
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/22.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import "ThreeIsKind.h"
#import "BMShowViewController.h"

@interface ThreeIsKind ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@end

@implementation ThreeIsKind

- (void)viewDidLoad {
    [super viewDidLoad];
    //fuck you man, for testing.
    
    self.tableView.separatorInset = UIEdgeInsetsZero;

//    self.headImageView.contentMode = UIViewContentModeScaleAspectFill;
//    self.headImageView.clipsToBounds = YES;
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:nil];
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"警告" message:@"CNDota，BestDota！" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOne = [UIAlertAction actionWithTitle:@"Agree" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

        }];
        UIAlertAction *actionTwo = [UIAlertAction actionWithTitle:@"DisAgree" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alterController addAction:actionOne];
        [alterController addAction:actionTwo];
        
        [self presentViewController:alterController animated:YES completion:nil];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        BMShowViewController *nextVc = [[BMShowViewController alloc]init];
        nextVc.hidesBottomBarWhenPushed = YES;

        [self.navigationController showViewController:nextVc sender:nil];
    }
}

#pragma mark Scroll Delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    _headImageView.height = MAX(-scrollView.contentOffset.y, 0);
//}
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
