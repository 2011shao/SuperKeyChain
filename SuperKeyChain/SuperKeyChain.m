//
//  SuperKeyChain.m
//  mytest
//
//  Created by ios-少帅 on 16/9/1.
//  Copyright © 2016年 ios-shaoshuai. All rights reserved.
//

#import "SuperKeyChain.h"
@import AdSupport;

@implementation SuperKeyChain
/**
 *  保存账号密码到 keychain
 */
+(void)saveUserAccount:(NSString*)account userPswed:(NSString*)pswed
{
    [SuperKeyChain saveUserAccount:account];
    [SuperKeyChain saveUserPswed:pswed];
}
/**
 *  保存用户id 到 keychain
 */
+(void)saveUserId:(NSString*)userid
{
    [[UICKeyChainStore keyChainStore]setString:userid forKey:@"USERID"];

}
/**
 *  保存账号到本地
 */
+(void)saveUserAccount:(NSString*)account
{
    [[UICKeyChainStore keyChainStore]setString:account forKey:@"USERACCOUNT"];

}
/**
 *  保存密码到本地
 */
+(void)saveUserPswed:(NSString*)pswed
{
    [[UICKeyChainStore keyChainStore]setString:pswed forKey:@"USERPSWED"];

}
/**
 *  得到用户账号
 */
+(NSString*)getUserAccount
{
    return [[UICKeyChainStore keyChainStore]stringForKey:@"USERACCOUNT"];
}
/**
 *  得到用户密码
 */
+(NSString*)getUserPswed
{
    return [[UICKeyChainStore keyChainStore]stringForKey:@"USERPSWED"];
}
/**
 *  得到用户 id
 */
+(NSString*)getUserId
{
    return [[UICKeyChainStore keyChainStore]stringForKey:@"USERID"];

}
+(BOOL)clear
{
    return  [SuperKeyChain removeAllItems];
}

//********************获取唯一的 udid
#pragma mark 获取UUID
/**
 *此uuid在相同的一个程序里面-相同的vindor-相同的设备下是不会改变的
 *此uuid是唯一的，但应用删除再重新安装后会变化，采取的措施是：只获取一次保存在钥匙串中，之后就从钥匙串中获取
 **/
+(NSString *)openUUID
{
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    return [identifierForVendor stringByReplacingOccurrencesOfString:@"-" withString:@""];
}


#pragma mark 读取UUID
/**
 *先从内存中获取uuid，如果没有再从钥匙串中获取，如果还没有就生成一个新的uuid，并保存到钥匙串中供以后使用
 **/

+(id)getDeviceUUID
{
    
    NSString * uuid=[[SuperKeyChain keyChainStore]stringForKey:@"DEVICEUUID"];
    
    if (uuid== nil || uuid.length== 0)
    {
        
        uuid = [SuperKeyChain openUUID];
        
        [[SuperKeyChain keyChainStore]setString:uuid forKey:@"DEVICEUUID"];
        
    }
    
    return uuid;
    
}
/**
 *  删除 device UUID
 */
+(BOOL)removeDeviceUUID
{
   return [[SuperKeyChain keyChainStore]removeItemForKey:@"DEVICEUUID"];
}
/**
 *  获取设备 idfa
 */
+(id)getDeviceIDFA

{
            //1.取IDFA,可能会取不到,如用户关闭IDFA
     NSString * idfa=[[SuperKeyChain keyChainStore]stringForKey:@"DEVICEIDFA"];
    
        if ([ASIdentifierManager sharedManager].advertisingTrackingEnabled)
        {
            idfa = [[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] lowercaseString];
            [[SuperKeyChain keyChainStore]setString:idfa forKey:@"DEVICEIDFA"];
                   }
        else
        {
            //2.如果取不到,就生成UUID,当成IDFA
            idfa = [SuperKeyChain getDeviceUUID];
            
[[SuperKeyChain keyChainStore]setString:idfa forKey:@"DEVICEIDFA"];                    }
    
    return idfa;

    
}
/**
 *  删除 idfa
 */
+(BOOL)removeDeviceIDFA
{
    return [[SuperKeyChain keyChainStore]removeItemForKey:@"DEVICEIDFA"];
}
@end
