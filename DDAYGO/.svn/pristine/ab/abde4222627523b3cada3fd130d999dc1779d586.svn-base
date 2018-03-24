//
//  Pop-upTableViewDataSource.m
//  DDAYGO
//
//  Created by Login on 2017/9/19.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "Pop-upTableViewDataSource.h"
#import "Pop-upPrefixHeader.pch"

@interface Pop_upTableViewDataSource ()

@property (nonatomic, copy)TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, strong) Class Cellclass;
@property (nonatomic, strong) NSArray * modelArray;

@end

@implementation Pop_upTableViewDataSource

- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
}
- (instancetype)initWithItems:(NSArray *)anItems cellClass:(Class)cellClass configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    
    if (self = [super init]) {
        
        self.modelArray = anItems;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.Cellclass = cellClass;
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modelArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Pop_upViewCell * cell = [[self.Cellclass class]cellAllocWithTableView:tableView];
    
    self.configureCellBlock(cell,self.modelArray[indexPath.row]);
    
    return cell;
}

@end
