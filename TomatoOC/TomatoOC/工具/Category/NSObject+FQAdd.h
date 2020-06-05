//
//  NSObject+FQAdd.h
//  TomatoOC
//
//  Created by 123 on 2020/6/5.
//  Copyright © 2020 master. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FQAdd)

+ (NSDictionary *)fq_dictionaryWithJSON:(id)json;

@end

NS_ASSUME_NONNULL_END
