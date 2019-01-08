//
//  Api.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/7/27.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#ifndef Api_h
#define Api_h

//域名
//#define DomainURL @"http://2o2340s366.imwork.net/api/services/app"
#define DomainURL @"http://192.168.1.63:8089/api/services/app"

//注册
#define Regist @"/acount/Regist"
//登录
#define Login  @"/acount/Login"
//查询用户信息
#define QueryAcountInfo @"/acount/QueryAcountInfo"

//获取七牛token
#define GetQNToken @"/acount/QueryQiNiuUpLoadToken"

//保存图片
#define SaveImageRecords  @"/ImageRecord/SaveImageRecords"
//获取图片
#define GetImageRecords  @"/ImageRecord/GetImageRecords"

//保存账单
#define SaveBillRecords @"/BillRecord/SaveBillRecords"
//获取账单
#define GetBillRecords @"/BillRecord/GetBillRecords"

//保存收入
#define SaveEarn @"BillRecord/SaveEarn"
//获取收入
#define GetEarn @"BillRecord/GetEarn"

#endif /* Api_h */
