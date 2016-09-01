//
//  SuperKeyChain.h
//  mytest
//
//  Created by ios-少帅 on 16/9/1.
//  Copyright © 2016年 ios-shaoshuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UICKeyChainStore.h"

@interface SuperKeyChain : UICKeyChainStore

/**
 *  保存账号密码到 keychain
 */
+(void)saveUserAccount:(NSString*)account userPswed:(NSString*)pswed;
/**
 *  保存用户id 到 keychain
 */
+(void)saveUserId:(NSString*)userid;
/**
 *  保存账号到本地
 */
+(void)saveUserAccount:(NSString*)account;
/**
 *  保存密码到本地
 */
+(void)saveUserPswed:(NSString*)pswed;
/**
 *  得到用户账号
 */
+(NSString*)getUserAccount;
/**
 *  得到用户密码
 */
+(NSString*)getUserPswed;
/**
 *  得到用户 id
 */
+(NSString*)getUserId;
/**
 *  清楚所有数据
 */
+(BOOL)clear;
/**
 *  获取 device UUID
 */
+(id)getDeviceUUID;
/**
 *  删除 device UUID
 */
+(BOOL)removeDeviceUUID;
/**
 *  获取设备 idfa//如果获取不到会获取到 uuid
 */
+(id)getDeviceIDFA;
/**
 *  删除 idfa
 */
+(BOOL)removeDeviceIDFA;
@end
