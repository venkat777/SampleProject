//
//  StudentData+CoreDataProperties.h
//  SampleCoreData
//
//  Created by VENKATARAMANA on 04/02/16.
//  Copyright © 2016 rjil. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "StudentData.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *sName;
@property (nullable, nonatomic, retain) NSString *sRollNo;

@end

NS_ASSUME_NONNULL_END
