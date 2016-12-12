//
//  User+CoreDataProperties.h
//  ios_base_use
//
//  Created by EDF on 16/11/11.
//  Copyright © 2016年 EDF. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *userPassword;
@property (nullable, nonatomic, retain) UNKNOWN_TYPEuerName;

@end

NS_ASSUME_NONNULL_END
