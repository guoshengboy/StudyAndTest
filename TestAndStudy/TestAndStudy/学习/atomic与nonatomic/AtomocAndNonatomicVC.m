//
//  AtomocAndNonatomicVC.m
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/7/5.
//

#import "AtomocAndNonatomicVC.h"

@interface AtomocAndNonatomicVC ()

@property (atomic, assign) NSInteger a;


@property (nonatomic, assign) NSInteger b;
@property (nonatomic, strong) UITextField *c;

@end

@implementation AtomocAndNonatomicVC

-(void)dealloc{
    NSLog(@"AtomocAndNonatomicVC-->dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test1];
    
    //验证nonatomic 在多线程的情况下set方法会出问题  如果把c的nonatomic变成atomic则不会出问题
    [self test2];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"a==%ld",self.a);
    NSLog(@"b==%ld",self.b);
    NSLog(@"c==%@",self.c);
}



- (void)test1{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.a = 2;
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.a = 10;
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.a = 133;
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.a = 770;
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.a = 102;
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.a = 130;
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.a = 1600;
    });
}


- (void)test2{
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 1;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 2;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 3;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 4;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 5;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 6;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 7;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 8;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 9;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 0;
            self.c = [[NSObject alloc] init];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.b = 10;
            self.c = [[NSObject alloc] init];
        });
    }
}



@end
