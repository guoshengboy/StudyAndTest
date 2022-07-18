//
//  ClosureAndFuncVC.swift
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/7/13.
//

import Foundation

class ClosureAndFuncVC:BaseViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ctest4(a: 1, b: 1) {
            
        }
        
        ctest5(predicate: 3>1)
    }
    
    //MARK: 闭包的定义
    func ctest(){
        
    //标准的闭包  带参数 返回值
     let c = {(a:Int) -> Bool in
         if(a < 0){
             return false
         }
         return true
        }
        
       let c1 = c(1);
       print(c1);
    }
    
    func ctest2(){
        //正常的闭包
        let c: (String, String)->String = {(s1:String, s2:String) -> String in
            return s1+s2
        }
        print(c("1","2"))
        
        //  参数不在括号内  并且不写返回值  因为swift编译器能自动根据 = 去做类型判断,从而推断出相关类型
        let c2:(String, String)->String = {s1, s2  in
            return s1+s2
        }
        print(c2("2","3"))
    }
    
    func ctest3(){
       
        //尾随闭包  当闭包为函数最后一个参数时 可以写在函数括号后面  增强可读性
        add(a: 1, b: 1) { s1, s2 in
            return s1 + s2;
        };
        
        //此调用不用尾随闭包  可读性差
        add(a: 1, b: 2, c: {s1, s2 in
            return s1+s2});
        
        //如过闭包作为唯一参数 则函数括号去除
        add1{num1,num2 in
            return num1+num2
        }
    }
    
    //逃逸闭包  一般在涉及到异步操作时，闭包放在异步线程里，在这种情况下就会出现逃逸闭包，特别是在网络请求时会出现这种情况
    func ctest4(a:Int, b:Int, c:@escaping ()->Void){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5){
            c();
        }
        print("函数执行完毕")
    }
    
    
    func ctest5( predicate:@autoclosure ()->Bool){
        if(predicate()){
            print("自动闭包")
        }
    }
 
    
    
    func add(a:Int, b:Int, c:(Int, Int)->Int){
       print(c(a,b));
    }
    
 
    func add1(c:(Int, Int)->Int){
       print(c(5,5));
    }
    
    
    //MARK: 函数的定义
    //不带参数和返回值
    func test(){
        
    }
    
    //带参数和返回值   ->有返回值的使用  没有返回值则不用->
    func test1(a:Int)-> Int{
        return a+1;
    }
    
    
    //带多个参数  用逗号隔开
    func test2(a:Int, b:Int)-> Int{
        return a+1;
    }
    
    //带有外部参数名  firstNumber为外部参数名  a为内部参数名
    func test3(firstNumber a:Int){
        
    }
    
    //如果参数前面有个下划线   忽略方法的默认外部參数名
    func test4(_ a:Int,_ b:Int){
        
    }
}
