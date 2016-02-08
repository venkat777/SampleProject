//
//  TableViewController.m
//  SampleCoreData
//
//  Created by VENKATARAMANA on 04/02/16.
//  Copyright © 2016 rjil. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import "StudentData.h"
@interface TableViewController ()
@property (nonatomic,retain)NSMutableArray *fetchobjects;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self saveData:nil];
    [self fetchStand:nil];
   
    
       // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)saveData:(id)sender {
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"StudentData"
                  inManagedObjectContext:context];
    [newContact setValue:@"venkat"  forKey:@"sName"];
    [newContact setValue:@"p5502650" forKey:@"sRollNo"];
    NSError *error;
    [context save:&error];
}
- (IBAction)fetchStand:(id)sender {
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"StudentData"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"sName" ascending:YES];

//    NSPredicate *pred =
//    [NSPredicate predicateWithFormat:@"(name = %@)",
//     _name.text];
   [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSManagedObject *matches = nil;
    
    NSError *error;
     self.fetchobjects=[NSMutableArray new];
NSArray *fetchobjects= [context executeFetchRequest:request
                                              error:&error];
    NSLog(@"fetch request %@",[(StudentData *)[fetchobjects objectAtIndex:0] sName]);
    
    for (StudentData *object in fetchobjects) {
        [self.fetchobjects addObject:object];
    }
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView reloadData];
//    if ([objects count] == 0) {
//        _status.text = @"No matches";
//    } else {
//        matches = objects[0];
//        _address.text = [matches valueForKey:@"address"];
//        _phone.text = [matches valueForKey:@"phone"];
//        _status.text = [NSString stringWithFormat:
//                        @"%lu matches found", (unsigned long)[objects count]];
//    }
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
    return self.fetchobjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    StudentData *data=(StudentData *)[self.fetchobjects objectAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text=data.sName;
    
    return cell;
}


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
