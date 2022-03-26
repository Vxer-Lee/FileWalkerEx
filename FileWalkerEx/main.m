//
//  main.m
//  FileWalkerEx
//
//  Created by hack on 2022/3/26.
//

#import <Foundation/Foundation.h>
#define NSLog(FORMAT, ...) printf("%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

void usage()
{

    NSLog(@"    _______ __        _       __      ____             ______");
    NSLog(@"   / ____(_) /__     | |     / /___ _/ / /_____  _____/ ____/  __");
    NSLog(@"  / /_  / / / _ \\    | | /| / / __ `/ / //_/ _ \\/ ___/ __/ | |/_/");
    NSLog(@" / __/ / / /  __/    | |/ |/ / /_/ / / ,< /  __/ /  / /____>  <");
    NSLog(@"/_/   /_/_/\___/      |__/|__/\\__,_/_/_/|_|\\___/_/  /_____/_/|_|");
    NSLog(@"");
    NSLog(@"                             From 三进制安全 & PTU Team VxerLee");
    NSLog(@"");
    NSLog(@"例子:");
    NSLog(@"    ./FileWalkerEx /Users/VxerLee jpg");
    NSLog(@"");
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if(argc < 3)
        {
            usage();
            return 0;
        }
        usage();
        //
        NSString *strDir    = [NSString stringWithUTF8String:argv[1]];
        NSString *strSuffic = [NSString stringWithFormat:@".%s",argv[2]];
        NSLog(@"开始搜寻目录:%@",strDir);
        NSLog(@"搜索后缀名为:%@的文件",strSuffic);
        
        //用来与文件系统交互的类
        NSFileManager *manager;
        manager = [NSFileManager defaultManager];
        
        NSMutableArray *files;
        files = [NSMutableArray arrayWithCapacity:69];
        
        //遍历
        for (NSString *filename in [manager enumeratorAtPath:strDir]) {
            if([filename hasSuffix:strSuffic])
            {
                NSLog(@"---------------------------------------------------------------------------------------------------------");
                NSLog(@"%@",filename);
                [files addObject:filename];
            }
        }
        //遍历完在输出太慢了，这里注释了
        /*
         for (NSString *filename in files) {
             NSLog(@"---------------------------------------------------------------------");
             NSLog(@"%@",filename);
         }
         */

    }
    return 0;
}
