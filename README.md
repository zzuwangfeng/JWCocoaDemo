#IOS View的Frame 、bounds 和 center的区别（位置和大小）

先看下下面这段代码
```mark
-(CGRect)frame{
    return CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
}
-(CGRect)bounds{
    return CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
}
```
很明显，bounds的原点是(0,0)点（就是view本身的坐标系统，默认永远都是0，0点，除非认为setbounds），而frame的原点却是任意的（相对于父视图中的坐标位置）。

再来看张图就明白了

![Editor preferences pane](http://jwimages.qiniudn.com/1364058232_8785.jpg)

**frame:** 该view在父view坐标系统中的位置和大小。（参照点是，父亲的坐标系统）
**bounds:**该view在本地坐标系统中的位置和大小。（参照点是，本地坐标系统，就相当于ViewB自己的坐标系统，以0,0点为起点）    
**center:**该view的中心点在父view坐标系统中的位置和大小。（参照电是，父亲的坐标系统）



我个人认为，bounds稍微有点费解，稍不留神，想的多了，就会绕进去。每个view都有一个本地坐标系统。这个坐标系统作用比较重要，比如触 摸的回调函数中的UITouch里面的>坐标值都是参照这个本地坐标系统的坐标。当然bounds这个属性也是参照这个本地坐标系统来的。其实本地 坐标系统的关键就是要知道的它的原点（0，0）在什么位置（这个位置又是相对于上层的view的本地坐标系统而言的，当然最上面的一层view就是 window它的本地坐标系统原点就是屏幕的左上角了）。通过修改view的bounds属性可以修改本地坐标系统的原点位置。

所以，我个人认为，bounds影响到子view的位置和大小。

#demo演示：
```
UIView *parentView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, 250)];
parentView.bounds = CGRectMake(-20, -20, 280, 250);
parentView.backgroundColor = [UIColor grayColor];
[self.view addSubview:parentView];
    
UIView *childView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 100)];
childView.backgroundColor = [UIColor yellowColor];
[parentView addSubview:childView];
    
NSLog(@"parentView frame :%@ ###### parentView bounds :%@",NSStringFromCGRect(parentView.frame),NSStringFromCGRect(parentView.bounds));
NSLog(@"childView frame :%@ ###### childView bounds :%@",NSStringFromCGRect(childView.frame),NSStringFromCGRect(childView.bounds));
```
![Iphone run](http://jwimages.qiniudn.com/IOSFrameAndBounds_02.png)
（运行展示，图中说的很明白了哦）
###运行结果如下
![运行结果](http://jwimages.qiniudn.com/68D1DA02-7278-4391-B2D6-AC3B05CE7D16.png)

(log输出日志表明，每个新的view默认的bounds其实都是（0,0）)
