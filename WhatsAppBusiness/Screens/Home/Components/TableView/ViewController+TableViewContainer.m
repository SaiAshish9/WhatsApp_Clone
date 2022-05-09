//
//  ViewController+TableViewContainer.m
//  WhatsAppBusiness
//
//  Created by Sai Ashish Darapureddy on 08/05/22.
//

#import "ViewController+TableViewContainer.h"
#import "CustomTableCell.h"

@implementation ViewController (TableViewContainer)

-(void)configureTableView:(UIView *) view
{
    self.table = [[UITableView alloc] initWithFrame:view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table setSeparatorColor: [UIColor clearColor]];
    [view addSubview:self.table];
    self.content = @[ @"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
    self.thumbnails = [NSArray arrayWithObjects:@"whatsapp_logo", @"whatsapp_logo",@"whatsapp_logo", @"whatsapp_logo",@"whatsapp_logo", @"whatsapp_logo",@"whatsapp_logo", nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.nameLabel.text = [self.content objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[self.thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [self.content objectAtIndex:indexPath.row];
//    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
//    if(cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    cell.textLabel.text =  [_content objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{
    NSLog(@"title of cell %@", [self.content objectAtIndex:indexPath.row]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

@end