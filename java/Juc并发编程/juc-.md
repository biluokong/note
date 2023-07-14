**1.进程与线程**
===========

## 1.1线程与进程

##### 进程

*   程序由指令和数据组成，但这些指令要运行，数据要读写，就必须将指令加载至CPU，数据加载至内存。在指令运行过程中还需要用到磁盘，网络等设备。进程就是用来加载指令，管理内存，管理OI的。
*   当一个程序被运行，从磁盘加载这个程序的代码至内存，这时就开启了一个进程。
*   进程就可以视为程序的一个实例。大部分程序可以同时运行多个实例进程（例如记事本，画图，浏览器等），也有程序只能启动一个实例进程（例如网易云音乐，360安全卫士等）。

##### 线程

*   一个进程之内可以分为一到多个线程。
*   一个线程就是一个指令流，将指令流中的一条条指令以一定的顺序交给CPU执行。
*   java中，线程作为最小调度单位，进程作为资源分配的最小单位。在windows中进程是不活动的，只是作为线程的容器。

##### 二者对比

*   进程基本上相互独立，而线程存在于进程内，是进程的一个子集。
*   进程拥有共享的资源，如内存空间，供其内部的线程共享。
*   进程间通信较为复杂
    *   同一台计算机的进程通信称为IPC（Inter-process communication).
    *   不同计算机之间的进程通信，需要通过网络，并遵守共同的协议，如HTTP。
*   线程通信相对简单，因为它们共享进程内的内存。一个例子是多个线程可以访问同一个共享变量。
*   线程更轻量，线程上下文切换成本一般比进程上下文切换低。

## 1.2并行与并发

##### 并发

单核cpu下，线程实际还是**串行执行**的。操作系统中有一个组件叫做任务调度器，将cpu的时间片（windows下时间片最小约15毫秒）分给不同线程使用，只是由于cpu在线程间（时间片很短）的切换非常快。人类感觉是同时运行的。总结一句话就是：**微观串行，宏观并行**。

一般会将这种线程轮流使用cpu的做法称为并发（concurrent）。

![](https://img-blog.csdnimg.cn/20210527223210347.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ1OTY2NDQw,size_16,color_FFFFFF,t_70)

##### 并行

多核cpu下，每个核（core）都可以调度运行线程，这时候线程可以是并行的。

![](https://img-blog.csdnimg.cn/20210527223237766.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ1OTY2NDQw,size_16,color_FFFFFF,t_70)

引用Rob Pike的一段描述：

> *   **并发**（concurrent)是**同一时间应直接对**（dealing with）多件事情的能力
> *   **并行**（parallel）是**同一时间动手做**（doing）多件事情的能力。

## 1.3应用

##### 应用之异步调用（案例1）

以调用的角度来讲，如果

> *   需要等待结果返回，才能继续运行就是同步。
> *   不需要等待结果返回，就能继续运行就是异步。

**（1）设计**

多线程可以让方法执行变为异步（即不要干巴巴等着）比如说读取磁盘文件时，假设读取操作花费了5秒钟，如果没有线程调度机制，这5

秒cpu什么都做不了，其他代码都得暂停。

**（2）结论**

*   比如在项目中，视频文件需要转换格式等操作比较费时时，这时开一个新线程处理视频转换，避免阻塞主线程。
*   tomcat的异步servlet也是类似目的，让用户线程处理耗时较长的操作，避免阻塞tomcat的工作线程。
*   ui程序中，开线程进行其他操作，避免阻塞ui线程。

##### 应用之提高效率（案例1）

充分利用多核cpu的优势，提高运行效率。想象下面的场景，执行 3 个计算，最后将计算结果汇总。

    计算1 花费 10 ms
    计算2 花费 11 ms
    计算3 花费 9 ms
    汇总需要 1 ms


*   如果是串行执行，那么总共花费的时间是  
    10 + 11 + 9 + 1 = 31 m s 10+11+9+1=31ms 10+11+9+1\=31ms
    
*   但如果是四核cpu，各个核心分别使用线程1执行计算1，线程2执行计算1，线程3执行计算3，那么3个线程是并行的吗，花费时间只取决于最长的那个线程运行的时间，`11ms`最后加上汇总时间总共只花费 `12ms`。
    

> 注意
>
> 需要在多核cpu中才能提高效率，单核仍然是轮流执行

**（1）执行**

**（2）结论**

1.  单核cpu下，多线程不能实际提高程序运行效率，只是为了能够在不同任务之间切换，不同线程切换轮流使用cpu，不至于一个线程总占用cpu，别的线程没法干活。
2.  多核cpu可以并行跑多个线程，但能否提高程序运行效率还是要分情况的
    *   有些任务，经过精心设计，将任务拆分，并行执行，当然可以提高程序的运行效率，但不是所有计算任务都能拆分。（参考后文的【阿姆达定律】）。
    *   也不是所有任务都需要拆分，任务的目的如果不同，谈拆分和效率没啥意义。
3.  IO操作不占用cpu，只是我们一般拷贝文件使用的是【阻塞IO】，这时相当于线程虽然不用cpu，但需要一直等待IO结束，没能充分利用线程，所有才有后面的【非阻塞IO】和【异步IO】优化。



2.Java线程
==============================================================================================================

本文章视频指路👉[黑马程序员-并发编程](https://www.bilibili.com/video/BV16J411h7Rd?p=50)

1.创建和运行线程
---------

### 1-1 方法一：直接使用Thread

    // 创建线程对象
    Thread t = new Thread() {
        public void run() {
         // 要执行的任务
        }
    };
    // 启动线程
    t.start();


例如：

    // 构造方法的参数是给线程指定名字，推荐
    Thread t1 = new Thread("t1") {
        @Override
        // run 方法内实现了要执行的任务
        public void run() {
            log.debug("hello");
        }
    };
    t1.start();


### 1-2 方法二：使用Runnable配合Thread

把【线程】和【任务】（要执行的代码）分开

*   Thread代表线程
    
*   Runnable可运行的任务（线程要执行的代码）
    
        public class Test2 {
            public static void main(String[] args) {
                //创建线程，将Runnable对象传入进来
                Thread t = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        System.out.println("Run");
                    }
                }, "xpp");
                t.start();
            }
        }
    
    
    > java8以后可以使用lambda精简代码
    
        public class Test2 {
            public static void main(String[] args) {
                Thread t = new Thread(() -> System.out.println("Run"), "xpp");
                t.start();
            }
        }
    
    

**原理之Thread与Runnable的关系：**

分析Thread的源码，理清它与Runnable的关系

*   方法1是把线程和任务合并在一起，方法2是把线程和任务分开了（推荐方法2）。
*   用Runnable更容易与线程池等高级API配合。
*   用Runnable让任务类脱离了Thread继承体系，更灵活。

### 1-3 方法三：FutureTask配合Thread

FutureTask能够接受Callable类型的参数，用来处理有返回结果的情况。

    public class Test3 {
        public static void main(String[] args) throws ExecutionException, InterruptedException {
            //创建任务对象，并传入一个Callable对象
            FutureTask<Integer> task=new FutureTask<>(new Callable<Integer>() {
                @Override
                public Integer call() throws Exception {
                    System.out.println("running...");
                    Thread.sleep(1000);
                    return 100;
                }
            });
            Thread t1 = new Thread(task, "t1");
            t1.start();
            //获取线程中方法执行后返回的结果
            System.out.println(task.get());//get方法会一直等待task完成，才会得到结果
            
        }
    }


2.观察多个线程同时运行
------------

    @Slf4j
    public class TestMultiThread {
        public static void main(String[] args) {
            new Thread(() -> {
                while (true) {
                    log.debug("running");
                }
            }, "t1").start();
            new Thread(() -> {
                while (true) {
                    log.debug("running");
                }
            }, "t2").start();
        }
    }


得出的结果：

*   交替执行
*   谁先谁后，不由我们控制

3.查看进程线程的方法
-----------

**windows**

*   任务管理器可以直接查看进程和线程数，也可以用来杀死进程。
    
*   `tasklist`查看进程（通过cmd）。
    
*   `taskkill`杀死进程。
    

**linux**

*   `ps -fe`查看所有进程。
*   `ps -fT -p <PID>`查看某个进程（PID）的所有线程。
*   `kill <PID>`杀死进程。
*   `top`按大写H切换是否显示线程。
*   `top -H -p <PID>`查看某个进程（PID）的所有线程。

**Java**

*   `jps`命令查看所有Java进程。
*   `jstack <PID>`查看某个Java进程（PID）的所有线程状态。
*   `jconsole`来查看某个Java线程中线程的运行情况（图形界面）。

4.原理之线程运行
---------

**栈与栈帧**

Java Virtual Machine Stacks(Java 虚拟机栈)

我们都知道JVM中由堆，栈，方法区所组成，其中栈内存是给谁用呢？其实就是线程，每个线程启动后，虚拟机就会为其分配一块栈内存。

*   每个栈有多个栈帧（Frame）组成，对应着每次方法调用时所占用的内存。
*   每个线程只能有一个活动栈帧，对应着当前正在执行的那个方法。

**线程上下文切换（Thread Context Switch）**

因为一下一些原因导致cpu不再执行当前的线程，转而执行另一个线程的代码。

*   线程的cpu时间片用完。
*   垃圾回收。
*   有更高优先级的线程需要运行。
*   线程自己调用slepp,yield,wait,join,park,synchronized,lock等方法。

当 Context Switch 发生时，需要由操作系统**保存当前线程的状态，并恢复另一个线程的状态**，Java中对应的概念就是程序计数器（Program Counter Register），它的作用是记住下一条jvm指令的执行地址，是**线程私有的**。

*   状态包括程序计数器，虚拟机栈中每个栈帧的信息，如局部变量，操作数栈，返回地址等。
*   Context Switch 频繁发生影响性能。

5.常用方法
------

方法名

static

功能说明

注意

start()

启动一个新线程，在新的线程运行run方法中的代码

start 方法只是让线程进入**就绪**，里面代码不一定立刻运行（CPU 的时间片还没分给它）。每个线程对象的 start方法只能调用一次，如果调用了多次会出现 IllegalThreadStateException

run()

新线程启动后会调用的方法

如果在构造 Thread 对象时传递了 Runnable 参数，则线程启动后会调用 Runnable 中的 run 方法，否则默认不执行任何操作。但可以创建 Thread 的子类对象， 来覆盖默认行为

join()

等线程运行结束

join(long n)

等待线程运行结束，最多等待n毫秒

getld()

获取线程长整型的id

id唯一

getName()

获取线程名

setName(String)

修改线程名

getPriority()

获取线程优先级

setPriority(int)

修改线程优先级

java中规定线程优先级是1~10 的整数，较大的优先级能提高该线程被 CPU 调度的机率

getState()

获取线程状态

Java 中线程状态是用 6 个 enum 表示，分别为： NEW, RUNNABLE, BLOCKED, WAITING, TIMED\_WAITING, TERMINATED

isInterrupted()

判断是否被打断

不会清除 `打断标记`

isAlive()

线程是否存活（还没有运行完毕）

interrupt()

打断线程

如果被打断线程正在 sleep，wait，join 会导致被打断的线程抛出 InterruptedException，并清除`打断标记` ；如果打断的正在运行的线程，则会设置`打断标记` ；park 的线程被打断，也会设置`打断标记`

interrupted()

static

判断当前线程是否被打断

会清除`打断标记`

currentThread()

static

获取当前正在执行的线程

sleep(long n)

static

让当前执行的线程休眠n毫秒，休眠时让出cpu的时间片给其它线程

yield()

static

提示线程调度器让出当前线程对cpu的使用

主要是为了测试和调试

### 5-1 start与run

**start**

1.  启动一个新线程，在新的线程运行run方法中的代码。
2.  start 方法只是让线程进入**就绪**，里面代码不一定立刻运行（CPU 的时间片还没分给它）。每个线程对象的 start方法只能调用一次，如果调用了多次会出现 `IllegalThreadStateException`

**run**

1.  新线程启动后会调用的方法。
2.  如果在构造 Thread 对象时传递了 Runnable 参数，则线程启动后会调用 Runnable 中的 run 方法，否则默认不执行任何操作。但可以创建 Thread 的子类对象， 来覆盖默认行为

**调用run**

程序还是在main线程执行，还是同步执行的

    @Slf4j
    public class Test4 {
        public static void main(String[] args) {
            Thread t1 = new Thread("t1") {
                @Override
                public void run() {
                    log.debug("running...");
                }
            };
            t1.run();
            log.debug("running");
        }
    }


输出

    12:17:47 DEBUG [main] (Test4.java:11) - running...
    12:17:47 DEBUG [main] (Test4.java:15) - runnin


**调用start**

此时是两个线程，异步执行

    @Slf4j
    public class Test4 {
        public static void main(String[] args) {
            Thread t1 = new Thread("t1") {
                @Override
                public void run() {
                    log.debug("running...");
                }
            };
            t1.start();
            log.debug("running");
        }
    }


输出

    12:14:15 DEBUG [main] (Test4.java:15) - running
    12:14:15 DEBUG [t1] (Test4.java:11) - running...


**小结**

*   直接调用run方法是在主线程中执行了run，没有启动新的线程。
*   使用start是启动了新的线程，通过新的线程间接执行run中的代码。

### 5-2 sleep与yield

**sleep**

1.  调用 sleep 会让当前线程从 `Running` 进入 `Timed Waiting` 状态，可通过state()方法查看
    
2.  其它线程可以使用 `interrupt` 方法打断正在睡眠的线程，这时 sleep 方法会抛出 `InterruptedException`
    
3.  睡眠结束后的线程未必会立刻得到执行
    
4.  建议用 `TimeUnit` 的 sleep 代替 Thread 的 sleep 来获得更好的可读性 。
    
        //休眠一秒
        TimeUnit.SECONDS.sleep(1);
        //休眠一分钟
        TimeUnit.MINUTES.sleep(1);
    
    

**yield**

1.  调用 yield 会让当前线程从 `Running` 进入 `Runnable` 就绪状态（仍然有可能被执行），然后调度执行其它线程
2.  具体的实现依赖于操作系统的任务调度器

**线程优先级**

*   线程优先级会提示（hint）调度器优先调度该线程，但它仅仅是一个提示，调度器可以忽略它。
*   如果cpu比较忙，那么优先级高的线程会获得更多的时间片，但cpu闲时，优先级几乎没作用。

举个栗子：

    @Slf4j
    public class Test9 {
        public static void main(String[] args) throws InterruptedException {
            Runnable task1 = () -> {
                int count = 0;
                for (; ; ) {
                    System.out.println("--->1  " + count++);
                }
            };
            Runnable task2 = () -> {
                int count = 0;
                for (; ; ) {
                    Thread.yield();
                    System.out.println("  --->2  " + count++);
                }
            };
            Thread t1 = new Thread(task1, "t1");
            Thread t2 = new Thread(task2, "t2");
    		//t1.setPriority(Thread.MAX_PRIORITY);
    	    //t2.setPriority(Thread.MIN_PRIORITY);
            t1.start();
            t2.start();
    
        }
    }


![](https://img-blog.csdnimg.cn/9ce3c84dede24145833a35a8157ab94a.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

可以看出`yield()`起到了作用，t2进入`Runnable`状态，开启设置优先级后结果也类似，需要注意的是，最终的结果无论是哪种方式，**都是由调度器决定最后时间片的分配**

### 5-3 join方法详解

**join**

用于等待某个线程结束。哪个线程内调用join()方法，就等待哪个线程结束，然后再去执行其他线程。

**为什么需要join**？

    @Slf4j
    public class Test10 {
        static int r = 0;
        public static void main(String[] args) {
            test1();
    
        }
        private static void test1() {
            log.debug("开始");
            Thread t1 = new Thread(() -> {
                log.debug("开始");
                try {
                    sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                log.debug("结果");
                r = 10;
            });
            t1.start();
            //t1.join();
            log.debug("结果为:{}", r);
            log.debug("结束");
        }
    }
    13:36:47 DEBUG [main] (Test10.java:18) - 开始
    13:36:47 DEBUG [Thread-0] (Test10.java:20) - 开始
    13:36:47 DEBUG [main] (Test10.java:30) - 结果为:0
    13:36:47 DEBUG [main] (Test10.java:31) - 结束
    13:36:48 DEBUG [Thread-0] (Test10.java:26) - 结束


**分析**

*   因为主线程和线程t1是并行执行的，t1线程需要1秒之后才能算出`r=10`。
*   而主线程一开始就要打印r的结果，所以只能打印出`r=0`。

**解决方法**

*   用**join**，加在`t1.start()`之后即可。

**应用之同步：**

以调用的角度来讲，如果

*   需要等待结果返回，才能继续运行就是**同步**。
*   不需要等待结果返回，就能继续运行就是**异步**。

### 5-4 interrupt方法详解

用于打断**阻塞**(sleep wait join…)的线程。 处于阻塞状态的线程，CPU不会给其分配时间片。

*   如果一个线程在在运行中被打断，打断标记会被置为**true**。
*   如果是打断因sleep wait join方法而被阻塞的线程，会将打断标记置为**false**

**打断sleep，wait，join的线程**

这里以sleep为例：

    @Slf4j
    public class Test11 {
        public static void main(String[] args) throws InterruptedException {
            Thread t1 = new Thread(() -> {
                log.debug("sleep...");
                try {
                    Thread.sleep(5000);//wait,join
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }, "t1");
            t1.start();
            Thread.sleep(1000);
            log.debug("interrupt");
            t1.interrupt();
            log.debug("打断标记:{}", t1.isInterrupted());//false
        }
    }


**打断正常运行的线程**

打断正常运行的线程，不会清空打断状态

    @Slf4j
    public class Test12 {
        public static void main(String[] args) throws InterruptedException {
            Thread t1 = new Thread(() -> {
                while (true) {
                    boolean interrupted = Thread.currentThread().isInterrupted();
                    if (interrupted) {
                        log.debug("退出循环！");
                        break;
                    }
                }
            }, "t1");
            t1.start();
            Thread.sleep(1000);
            log.debug("interrupt");
            t1.interrupt();
            log.debug("打断标记:{}", t1.isInterrupted());//true
        }
    }
    18:51:03 DEBUG [main] (Test12.java:20) - interrupt
    18:51:03 DEBUG [t1] (Test12.java:13) - 推出循环！
    18:51:03 DEBUG [main] (Test12.java:22) - 打断标记:true


**模式之两阶段终止：**

![](https://img-blog.csdnimg.cn/img_convert/ae56c5bf209dbb9cbb27993bc676050d.png)

代码实现：

    @Slf4j
    public class Test23 {
        public static void main(String[] args) throws InterruptedException {
            TwoPhaseTermination tpt = new TwoPhaseTermination();
            tpt.start();
            Thread.sleep(3500);
            tpt.stop();
        }
    }
    
    @Slf4j
    class TwoPhaseTermination {
        private Thread monitor;//设置监控线程
    
        //启动监控线程
        public void start() {
            monitor = new Thread(() -> {
                while (true) {
                    Thread current = Thread.currentThread();
                    if (current.isInterrupted()) {
                        log.debug("料理后事");
                        //终止线程执行
                        break;
                    }
                    try {
                        Thread.sleep(1000); //情况1，sleep打断，打断标记为false
                        log.debug("执行监控记录");  //情况2，正常打断,打断标记为true
                    } catch (InterruptedException e) { //情况1
                        e.printStackTrace();
                        current.interrupt();//重新设置打断标记
                    }
                }
            }, "monitor");
            monitor.start();
        }
    
        //停止监控线程
        public void stop() {
            //打断线程
            monitor.interrupt();
        }
    }


### 5-5 不推荐的打断方法

这些方法已过时，容易**破坏同步代码块，造成线程死锁**！

*   stop()：停止线程运行（可能造成共享资源无法被释放，其他线程无法使用这些共享资源）
*   suspend()：（暂停线程）
*   resume()：（恢复线程）方法

6.主线程和守护线程
----------

默认情况下，Java 进程需要等待所有线程都运行结束才会结束。有一种特殊的线程叫做守护线程，**只要其它非守护线程运行结束了，即使守护线程的代码没有执行完，也会强制结束。**

栗子：

    @Slf4j
    public class Test15 {
        public static void main(String[] args) throws InterruptedException {
            Thread t1 = new Thread(() -> {
                while (true) {
                    if (Thread.currentThread().isInterrupted()) {
                        break;
                    }
                }
                log.debug("结束");
            }, "t1");
            t1.setDaemon(true);//设置t1为守护线程，即使主线程执行完了，t1线程也会结束，不会死循环
            t1.start();
            Thread.sleep(1000);
            log.debug("结束");
        }
    }


**守护线程的应用**

*   垃圾回收器线程就是一种守护线程
*   Tomcat 中的 Acceptor 和 Poller 线程都是守护线程，所以 Tomcat 接收到 shutdown 命令后，不会等待它们处理完当前请求

7.线程的状态
-------

### 7-1 五种状态

这是从 **操作系统** 层面来描述的

![](https://img-blog.csdnimg.cn/img_convert/579fa80745b73c5352b5077347b59a59.png)

*   **初始状态**：仅是在语言层面创建了线程对象，还未与操作系统线程关联（例如线程调用了start方法）
*   **可运行状态**：（**就绪状态**）指该线程已经被创建（与操作系统线程关联），可以由 CPU 调度执行
*   **运行状态**：指获取了 CPU 时间片运行中的状态
    *   当 CPU 时间片用完，会从【运行状态】转换至【可运行状态】，会导致线程的上下文切换
*   **阻塞状态**：
    *   如果调用了阻塞 API，如 BIO 读写文件，这时该线程实际不会用到 CPU，会导致线程上下文切换，进入 【阻塞状态】
    *   等 BIO 操作完毕，会由操作系统唤醒阻塞的线程，转换至【可运行状态】
    *   与【可运行状态】的区别是，对【阻塞状态】的线程来说只要它们一直不唤醒，调度器就一直不会考虑调度它们
*   **终止状态**：表示线程已经执行完毕，生命周期已经结束，不会再转换为其它状态

### 7-2 六种状态

这是从 **Java API** 层面来描述的，根据 Thread.State 枚举，分为六种状态

![](https://img-blog.csdnimg.cn/img_convert/5e86fdc35e7c4d5d14cc16c40af073fc.png)

*   **NEW** 线程刚被创建，但是还没有调用 start() 方法
*   **RUNNABLE** 当调用了 start() 方法之后，注意，Java API 层面的 RUNNABLE 状态涵盖了操作系统层面的 【可运行状态】、【运行状态】和【阻塞状态】（由于 BIO 导致的线程阻塞，在 Java 里无法区分，仍然认为是可运行）
*   **BLOCKED ， WAITING ， TIMED\_WAITING** 都是 **Java API 层面**对【阻塞状态】的细分，如sleep就位TIMED\_WAITING， join为WAITING状态。后面会在状态转换一节详述。
*   **TERMINATED** 当线程代码运行结束

这里附《并发编程的艺术》这本书的一张图：

![](https://img-blog.csdnimg.cn/656706c3ffec4da68b65846e97b8b5bd.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ1OTY2NDQw,size_16,color_FFFFFF,t_70)

举个栗子：

    @Slf4j
    public class Test16 {
        static Object obj;
    
        public static void main(String[] args) {
            //new
            Thread t1 = new Thread("t1") {
                @Override
                public void run() {
                    log.debug("running...");
                }
            };
            //runnable
            Thread t2 = new Thread("t2") {
                @Override
                public void run() {
                    while (true) {
    
                    }
                }
            };
            t2.start();
            //terminated
            Thread t3 = new Thread("t3") {
                @Override
                public void run() {
                    log.debug("running...");
                }
            };
            t3.start();
            //timed_waiting
            Thread t4 = new Thread("t4") {
                @Override
                public void run() {
                    try {
                        Thread.sleep(1000000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            };
            t4.start();
            //waiting
            Thread t5 = new Thread("t5") {
                @Override
                public void run() {
                    synchronized (Test16.class) {
                        try {
                            t2.join();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            };
            t5.start();
            //blocked
            Thread t6 = new Thread("t6") {
                @Override
                public void run() {
                    synchronized (Test16.class) {
                        try {
                            Thread.sleep(1000000);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            };
            t6.start();
    
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
    
            log.debug("t1 state {}", t1.getState());
            log.debug("t2 state {}", t2.getState());
            log.debug("t3 state {}", t3.getState());
            log.debug("t4 state {}", t4.getState());
            log.debug("t5 state {}", t5.getState());
            log.debug("t6 state {}", t6.getState());
        }
    }
    //输出
    21:44:51 DEBUG [t3] (Test16.java:31) - running...
    21:44:51 DEBUG [main] (Test16.java:82) - t1 state NEW
    21:44:51 DEBUG [main] (Test16.java:83) - t2 state RUNNABLE
    21:44:51 DEBUG [main] (Test16.java:84) - t3 state TERMINATED
    21:44:51 DEBUG [main] (Test16.java:85) - t4 state TIMED_WAITING
    21:44:51 DEBUG [main] (Test16.java:86) - t5 state WAITING
    21:44:51 DEBUG [main] (Test16.java:87) - t6 state BLOCKED



3.共享模型之管程
===============================================================================================================

本文章视频指路👉[黑马程序员-并发编程](https://www.bilibili.com/video/BV16J411h7Rd?from=search&seid=2279329274369061723&spm_id_from=333.337.0.0)

1.共享带来的问题
---------

### 1-1 临界区 Critical Section

*   一个程序运行多个线程本身是没有问题的
*   问题出在多个线程访问**共享资源**
    *   多个线程读共享资源其实也没有问题
    *   多个线程对共享资源**读写**操作时**发生指令交错**，就会出现问题
*   一段代码块内如果存在对共享资源的多线程读写操作，称这段代码块为**临界区**

例如，下面代码中的临界区：

    static int counter = 0;
     
    static void increment() 
    // 临界区 
    {   
        counter++; 
    }
     
    static void decrement() 
    // 临界区 
    { 
        counter--; 
    }


### 1-2 竞态条件 Race Condition

多个线程在**临界区**内执行，由于代码的**执行序列不同**而导致结果无法预测，称之为发生了**竞态条件**

2.synchronized 解决方案
-------------------

### 2-1 解决方案

为了避免临界区的竞态条件发生，有多种手段可以达到目的。

*   **阻塞式**的解决方案：synchronized，Lock
*   **非阻塞式**的解决方案：原子变量

该节使用阻塞式的解决方案：`synchronized`，来解决上述问题，即俗称的\*\*【对象锁】**，它采用**互斥\*\*的方式让同一 时刻至多只有一个线程能持有【对象锁】，其它线程再想获取这个【对象锁】时就会阻塞住(blocked)。这样就能保证拥有锁 的线程可以安全的执行临界区内的代码，不用担心线程上下文切换

> 注意：
>
> 虽然 java 中**互斥**和**同步**都可以采用 `synchronized` 关键字来完成，但它们还是有区别的：
>
> *   互斥是保证临界区的竞态条件发生，同一时刻只能有一个线程执行临界区代码
> *   同步是由于线程执行的先后、顺序不同、需要一个线程等待其它线程运行到某个点

`synchronized` 实际是用**对象锁**保证了**临界区内代码的原子性**，临界区内的代码对外是不可分割的，不会被线程切换所打断。

### 2-2 synchronized 的使用

语法

    synchronized(对象) {
    	//临界区
    }


解决

    static int counter = 0; 
    //创建一个公共对象，作为对象锁的对象
    static final Object room = new Object();
     
    public static void main(String[] args) throws InterruptedException {    
    	Thread t1 = new Thread(() -> {        
        for (int i = 0; i < 5000; i++) {            
            synchronized (room) {     
            counter++;            
           	 }       
     	   }    
        }, "t1");
     
        Thread t2 = new Thread(() -> {       
            for (int i = 0; i < 5000; i++) {         
                synchronized (room) {            
                counter--;          
                }    
            } 
        }, "t2");
     
        t1.start();    
        t2.start(); 
        t1.join();   
        t2.join();    
        log.debug("{}",counter); 
    }


### 2-3 方法上的synchronized

*   加在**成员方法**上，锁是当前**实例对象**
    
        public class Demo {
        	//在方法上加上synchronized关键字
        	public synchronized void test() {
        	
        	}
        	//等价于
        	public void test() {
        		synchronized(this) {
        		
        		}
        	}
        }
    
*   加在**静态方法**上，锁是当前**类的Class对象**
    
        public class Demo {
        	//在静态方法上加上synchronized关键字
        	public synchronized static void test() {
        	
        	}
        	//等价于
        	public void test() {
        		synchronized(Demo.class) {
        		
        		}
        	}
        }
    
    

3.变量的线程安全分析
-----------

### 3-1 成员变量和静态变量是否线程安全？

*   如果它们没有共享，则线程安全
*   如果它们被共享了，根据它们的状态是否能够改变，又分两种情况
    *   如果只有读操作，则线程安全
    *   如果有读写操作，则这段代码是临界区，需要考虑线程安全

### 3-2 局部变量是否线程安全？

*   局部变量是线程安全的
    
*   但**局部变量引用的对象**则未必 （要看该对象是否被共享且被执行了读写操作）
    
    *   如果该对象没有逃离方法的作用范围，它是线程安全的
    *   如果该对象逃离方法的作用范围，需要考虑线程安全
*   局部变量是线程安全的—每个方法都在对应线程的栈中创建栈帧，不会被其他线程共享
    
    ![](https://img-blog.csdnimg.cn/img_convert/3fac3d1e094511ad36456a907d5bcdab.png)
    
*   如果调用的对象被共享，且执行了读写操作，则**线程不安全**
    
    ![](https://img-blog.csdnimg.cn/img_convert/b2fd2dfb784f58b8399b884f4646f673.png)
    
*   如果是局部变量，则会在堆中创建对应的对象，不会存在线程安全问题
    
    ![](https://img-blog.csdnimg.cn/img_convert/22c5cd7a1ffa0810bb5883c414e3f3ff.png)
    

### 3-3 常见线程安全类

*   String
*   Integer
*   StringBffer
*   Random
*   Vector （List的线程安全实现类）
*   Hashtable （Hash的线程安全实现类）
*   java.util.concurrent 包下的类

这里说它们是线程安全的是指，多个线程调用它们**同一个实例的某个方法时**，是线程安全的

例如：

    Hashtable table = new Hashtable();
    
    new Thread(()->{
        table.put("key", "value1");
    }).start();
    new Thread(()->{
        table.put("key", "value2");
    }).start();


*   它们的**每个方法**是**原子的**（都被加上了**synchronized**）
*   但注意它们**多个方法的组合不是原子的**，所以可能会出现线程安全问题

**线程安全类方法的组合**

分析下面代码是否线程安全？

    Hashtable table = new Hashtable();
    // 线程1，线程2
    if( table.get("key") == null) {
        table.put("key", value);
    }


![](https://img-blog.csdnimg.cn/44f51b70fe574e7d90e52d248b60b719.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

可以多个方法的组合不是原子的，所以可能会出现线程安全问题

**不可变类线程安全性**

String、Integer 等都是**不可变类**，因为其内部的状态不可以改变，因此它们的方法都是线程安全的

有同学或许有疑问，String 有 replace，substring 等方法可以改变值啊，那么这些方法又是如何保证线程安全的呢？

这是因为这些方法的返回值都**创建了一个新的对象**，而不是直接改变String、Integer对象本身。

### 3-4 实例分析

例1：

    public class MyServlet extends HttpServlet {
        // 是否安全？no
        Map<String,Object> map = new HashMap<>();
        // 是否安全？yes
        String S1 = "...";
        // 是否安全？yes
        final String S2 = "...";
        // 是否安全？no
        Date D1 = new Date();
        // 是否安全？no,引用不变，但是里面的年月日是可变的
        final Date D2 = new Date();
    
        public void doGet(HttpServletRequest request, HttpServletResponse response) {
            //使用上述变量
        }
    }


例2：

    public class MyServlet extends HttpServlet {
        // 是否安全？no，共享的
        private UserService userService = new UserServiceImpl();
    
        public void doGet(HttpServletRequest request, HttpServletResponse response) {
            userService.update(...);
        }
    }
    public class UserServiceImpl implements UserService {
        // 记录调用次数
        private int count = 0;//这里多个线程调用可能出问题
    
        public void update() {
            // ...
            count++;
        }
    }


例3：

    @Aspect
    @Component
    public class MyAspect {//单例，成员变量会共享
        // 是否安全？no
        private long start = 0L;
    
        @Before("execution(* *(..))")
        public void before() {
            start = System.nanoTime();
        }
    
        @After("execution(* *(..))")
        public void after() {
            long end = System.nanoTime();
            System.out.println("cost time:" + (end-start));
        }
    }


4.Monitor
---------

### 4-1 Java对象头

这里以32位虚拟机为例：

普通对象：  
![](https://img-blog.csdnimg.cn/c18da565f20c4284b1fe8ed97e9b7350.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

数组对象：

![](https://img-blog.csdnimg.cn/f03dda03f0d74817bea249bcbeda8bd9.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

其中Mark Word 结构为：

![](https://img-blog.csdnimg.cn/d20608df385a4029be067aa2b21d70f8.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

64 位虚拟机 Mark Word：

![](https://img-blog.csdnimg.cn/88230d375dc64d958bb423153c339c17.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

### 4-2 原理之Monitor

Monitor被翻译为**监视器**或**管程**

**每个 Java 对象都可以关联一个 Monitor 对象**，如果使用 **synchronized** 给对象上锁（**重量级**）之后，该对象头的 **Mark Word** 中就被设置指向 Monitor 对象的指针

Monitor 结构如下：

![](https://img-blog.csdnimg.cn/img_convert/a1ab4ee5a45633c17591cd9fae7f58f1.png)

*   刚开始 Monitor 中 Owner 为 null
*   当 Thread-2 执行 synchronized(obj) 就会将 Monitor 的所有者 Owner 置为 Thread-2，**Monitor中只能有一 个 Owner**
*   在 Thread-2 上锁的过程中，如果 Thread-3，Thread-4，Thread-5 也来执行 synchronized(obj)，就会进入 **EntryList** （进入**阻塞状态**，BLOCKED ）
*   Thread-2 执行完同步代码块的内容，然后**唤醒** EntryList 中等待的线程来**竞争锁**，竞争的时是**非公平的**
*   图中 **WaitSet** 中的 Thread-0，Thread-1 是之前获得过锁，但条件不满足进入 WAITING 状态的线程，后面讲 wait-notify 时会分析

> 注意：
>
> *   synchronized 必须是进入**同一个对象**的 monitor 才有上述的效果
> *   不加 synchronized 的对象不会关联监视器，不遵从以上规则

5.Synchronized原理进阶
------------------

### 5-1 轻量级锁

*   **轻量级锁使用场景：**当一个对象被多个线程所访问，但访问的时间是**错开的（不存在竞争）**，此时就可以使用轻量级锁来优化。
*   轻量级锁对使用者是透明的，即语法仍然是 `synchronized`

这里举个栗子：假设有两个方法同步块，利用同一个对象加锁

    static final Object obj = new Object();
    public static void method1() {
        synchronized( obj ) {
            // 同步块 A
            method2();
        }
    }
    public static void method2() {
        synchronized( obj ) {
            // 同步块 B
        }
    }


*   创建**锁记录**（Lock Record）对象，每个线程的**栈帧**都会包含一个锁记录对象，内部可以存储**锁定对象的mark word**（不再一开始就使用Monitor）
    
    [![](https://img-blog.csdnimg.cn/img_convert/e59e2d9d66e8b06b242a918573e1eca2.png)](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608144942.png)
    
*   让锁记录中的Object reference指向锁对象（Object），并尝试用cas去替换Object中的mark word，将此mark word放入lock record中保存
    
    ![](https://img-blog.csdnimg.cn/img_convert/a71f4c42c1f9f1e3c27bd2e65d11b439.png)
    
*   如果cas替换成功，则将Object的对象头替换为**锁记录的地址**和**状态 00（轻量级锁状态）**，并由该线程给对象加锁
    
    ![](https://img-blog.csdnimg.cn/img_convert/9a2670aac23e6adb88a4b3db3afa1779.png)
    
*   如果 cas 失败，有两种情况：
    
    *   如果是其它线程已经持有了该 Object 的轻量级锁，这时表明有竞争，进入**锁膨胀**过程
        
    *   如果是自己执行了 **synchronized 锁重入**，那么再添加一条 Lock Record 作为重入的计数
        
        ![](https://img-blog.csdnimg.cn/031af353af8347e8941f6a5174e41b1e.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    
*   当退出 synchronized 代码块（解锁时）如果有**取值为 null** 的锁记录，表示有重入，这时重置锁记录，表示重入计数减一
    
    ![](https://img-blog.csdnimg.cn/488be60ae22c4a3da81389aa663c4439.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    
*   当退出 synchronized 代码块（解锁时）锁记录的值不为 null，这时使用 cas 将 Mark Word 的值恢复给对象头
    
    *   成功，则解锁成功
    *   失败，说明轻量级锁进行了锁膨胀或已经升级为重量级锁，进入重量级锁解锁流程

### 5-2 锁膨胀

如果在尝试加轻量级锁的过程中，CAS 操作无法成功，这时一种情况就是有其它线程为此对象加上了轻量级锁（有竞争），这时需要进行锁膨胀，**将轻量级锁变为重量级锁。**

*   当 Thread-1 进行轻量级加锁时，Thread-0 已经对该对象加了轻量级锁
    
    ![](https://img-blog.csdnimg.cn/img_convert/9d13c9a18c4ce34ccc30d8dbb55d4f2c.png)
    
*   这时 Thread-1 加轻量级锁失败，进入锁膨胀流程
    
    *   即为 Object 对象申请 Monitor 锁，让 Object 指向重量级锁地址
    *   然后自己进入 Monitor 的 EntryList BLOCKED
    
    ![](https://img-blog.csdnimg.cn/img_convert/8e9c733310caa74cb7f31892dea094dd.png)
    
*   当 Thread-0 退出同步块解锁时，使用 cas 将 Mark Word 的值恢复给对象头，失败。这时会进入重量级解锁流程，即按照 Monitor 地址找到 Monitor 对象，设置 Owner 为 null，唤醒 EntryList 中 BLOCKED 线程
    

### 5-3 自旋优化

重量级锁竞争的时候，还可以使用自旋来进行优化，如果当前线程自旋成功（即这时候持锁线程已经退出了同步块，释放了锁），这时当前线程就可以**避免阻塞**

*   自旋会占用 CPU 时间，单核 CPU 自旋就是浪费，多核 CPU 自旋才能发挥优势。
*   在 Java 6 之后自旋锁是自适应的，比如对象刚刚的一次自旋操作成功过，那么认为这次自旋成功的可能性会高，就多自旋几次；反之，就少自旋甚至不自旋，总之，比较智能。
*   Java 7 之后不能控制是否开启自旋功能

### 5-4 偏向锁

轻量级锁在没有竞争时（就自己这个线程），每次**重入**仍然需要执行 CAS 操作。

Java 6 中引入了偏向锁来做进一步优化：只有第一次使用 CAS 将线程 ID 设置到对象的 Mark Word 头，之后发现这个线程 ID 是自己的就表示没有竞争，不用重新 CAS。以后只要不发生竞争，这个对象就归该线程所有

![](https://img-blog.csdnimg.cn/img_convert/1bcc6d6394b0eab119355563fb5d5cef.png)

**偏向状态**

*   Normal：一般状态，没有加任何锁，前面62位保存的是对象的信息，**最后2位为状态（01），倒数第三位表示是否使用偏向锁（未使用：0）**
*   Biased：偏向状态，使用偏向锁，前面54位保存的当前线程的ID，**最后2位为状态（01），倒数第三位表示是否使用偏向锁（使用：1）**
*   Lightweight：使用轻量级锁，前62位保存的是锁记录的指针，**最后两位为状态（00）**
*   Heavyweight：使用重量级锁，前62位保存的是Monitor的地址指针，**后两位为状态(10)**

![](https://img-blog.csdnimg.cn/img_convert/461b804dda9e6ee0737faf0519ca295c.png)

*   如果开启了偏向锁（默认开启），在创建对象时，对象的Mark Word后三位应该是101
*   但是偏向锁默认是**有延迟**的，不会再程序一启动就生效，而是会在程序运行一段时间（几秒之后），才会对创建的对象设置为偏向状态
*   如果没有开启偏向锁，对象的Mark Word后三位应该是001

**撤销偏向**

以下几种情况会使对象的偏向锁失效

*   调用对象的hashCode方法
*   多个线程使用该对象
*   **调用了wait/notify方法**（调用wait方法会导致锁膨胀而使用**重量级锁**）

**批量重偏向**

*   如果对象虽然被多个线程访问，但是线程间不存在竞争，这时偏向T1的对象仍有机会重新偏向T2。重偏向会重置Thread ID
*   当撤销超过20次后（超过阈值），JVM会觉得是不是偏向错了，这时会在给对象加锁时，重新偏向至加锁线程

**批量撤销**

当撤销偏向锁阈值超过 40 次后，jvm 会这样觉得，自己确实偏向错了，根本就不该偏向。于是**整个类的所有对象都会变为不可偏向的，新建的对象也是不可偏向的**

6.Wait/Notify
-------------

### 6-1 原理

![](https://img-blog.csdnimg.cn/img_convert/69adb6bcc079c50ed5ed35644ab463a0.png)

*   Owner 线程发现条件不满足，调用 **wait** 方法，即可进入 WaitSet 变为 WAITING 状态
*   BLOCKED 和 WAITING 的线程都处于**阻塞**状态，不占用 CPU 时间片
*   BLOCKED 线程会在 Owner 线程释放锁时唤醒
*   WAITING 线程会在 Owner 线程调用 **notify** 或 **notifyAll** 时唤醒，但唤醒后并不意味者立刻获得锁，仍需进入 EntryList 重新竞争

这里附《Java并发编程的艺术》里的一张图：

![](https://img-blog.csdnimg.cn/ff9f599606b4446e825fec18a868768b.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

### 6-2 API介绍

*   `wait()` 让进入 object 监视器的线程到 waitSet 等待
*   `notify()` 在 object 上正在 waitSet 等待的线程中挑一个唤醒
*   `notifyAll()` 让 object 上正在 waitSet 等待的线程全部唤醒
*   wait() 方法会释放对象的锁，进入 WaitSet 等待区，从而让其他线程就机会获取对象的锁。无限制等待，直到 notify
*   为止 `wait(long n)` 有时限的等待, 到 n 毫秒后结束等待，或是被 notify

**注意：只有当对象被锁以后，才能调用wait和notify方法**

例子：

    @Slf4j
    public class Test6 {
        final static Object lock = new Object();
    
        public static void main(String[] args) {
            new Thread(() -> {
                synchronized (lock) {
                    log.debug("执行...");
                    try {
                        lock.wait();//让线程在lock上一直等待下去
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    log.debug("其他代码...");
                }
            }, "t1").start();
    
            new Thread(() -> {
                synchronized (lock) {
                    log.debug("执行...");
                    try {
                        lock.wait();//让线程在lock上一直等待下去
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    log.debug("其他代码...");
                }
            }, "t2").start();
            Sleeper.sleep(2);
            log.debug("唤醒 lock 上的线程");
            synchronized (lock) {
                lock.notify(); //唤醒 lock 上的一个线程
                //lock.notifyAll(); //唤醒 lock 上所有等待线程
            }
        }
    }
    //输出
    20:36:08 DEBUG [t1] (Test6.java:13) - 执行...
    20:36:08 DEBUG [t2] (Test6.java:25) - 执行...
    20:36:10 DEBUG [main] (Test6.java:35) - 唤醒 lock 上的线程
    20:36:10 DEBUG [t1] (Test6.java:19) - 其他代码...


### 6-3 wait/notify 的正确使用

开始之前先看看 `sleep(long n)` 和 `wait(long n)` 的区别 ：

1.  sleep 是 **Thread** 方法，而 wait 是 **Object** 的方法
2.  sleep 不需要强制和 synchronized 配合使用，但 wait 需要和 synchronized 一起用
3.  sleep 在睡眠的同时，**不会释放对象锁**，但 wait 在等待的时候**会释放对象锁**
4.  他们的状态都是`TIMED_WAITING`

以下部分建议参考：[《Java并发编程的艺术》读后笔记-part4](https://blog.csdn.net/qq_45966440/article/details/119536541)

**等待方**遵循如下原则：

1.  获取对象的锁
2.  如果条件不满足，那么调用对象的wait()方法，被通知后仍要检查条件
3.  条件满足则执行对应的逻辑

对应伪代码：

    synchronized(对象){
        while(条件不满足){
            对象.wait();
        }
        对应的处理逻辑
    }


**通知方**遵循如下原则：

1.  获得对象的锁
2.  改变条件
3.  通知所有等待在对象上的线程

对应伪代码：

    synchronized(对象){
        改变条件
        对象.notifyAll();
    }


7.Park/Unpark
-------------

### 7-1 基本使用

`park/unpark`都是 `LockSupport` 类中的方法

    //暂停线程运行
    LockSupport.park;
    
    //恢复线程运行
    LockSupport.unpark(thread);


先 park 再 unpark：

    @Slf4j
    public class Test24 {
        public static void main(String[] args) {
            Thread t1 = new Thread(() -> {
                log.debug("start...");
                Sleeper.sleep(1);
                log.debug("park...");
                //暂停线程运行
                LockSupport.park();
                log.debug("resume...");
            }, "t1");
            t1.start();
            Sleeper.sleep(2);
            log.debug("unpark...");
            //恢复线程运行
            LockSupport.unpark(t1);
        }
    }
    13:11:08 DEBUG [t1] (Test24.java:12) - start...
    13:11:09 DEBUG [t1] (Test24.java:14) - park...
    13:11:10 DEBUG [main] (Test24.java:20) - unpark...
    13:11:10 DEBUG [t1] (Test24.java:16) - resume...


### 7-2 特点

与 Object 的 `wait/notify` 相比：

*   wait，notify 和 notifyAll 必须配合**Object Monitor**一起使用，而park，unpark不必
*   park，unpark 是以**线程为单位**来**阻塞**和**唤醒**线程，而 notify 只能**随机**唤醒一个等待线程，notifyAll 是唤醒所有等待线程，就不那么精确
*   park & unpark 可以**先 unpark**，而 wait & notify 不能先 notify
*   **park不会释放锁**，而wait会释放锁

### 7-3 原理

**每个线程**都有一个自己的**Park对象**，并且该对象`_counter`，`_cond`，`__mutex`组成

*   先调用park再调用unpark时
    
    *   先调用park
        
        *   线程运行时，会将Park对象中的\_counter的值设为0；
        *   调用park时，会先查看counter的值是否为0，如果为0，则将线程放入阻塞队列cond中
        *   放入阻塞队列中后，会再次将counter设置为0
    *   然后调用unpark
        
        *   调用unpark方法后，会将counter的值设置为1
            
        *   去唤醒阻塞队列cond中的线程
            
        *   线程继续运行并将counter的值设为0
            
            [![](https://img-blog.csdnimg.cn/img_convert/ed29e96a02b44a7c11aa528d0e95b5e2.png)](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608145250.png)
            

[![](https://img-blog.csdnimg.cn/img_convert/20838a7f30e67c5b8a5255f20268512d.png)](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608145303.png)

*   先调用unpark，再调用park
    *   调用unpark
        *   会将counter设置为1（运行时0）
    *   调用park方法
        *   查看counter是否为0
        *   因为unpark已经把counter设置为1，所以此时将counter设置为0，但不放入阻塞队列cond中

[![](https://img-blog.csdnimg.cn/img_convert/0cd9b3ca85bafd1b320e2e23add1fe71.png)](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608145313.png)

8.重新理解线程状态转换
------------

![](https://img-blog.csdnimg.cn/img_convert/78c9360f2a367e24c99ca91430644ddc.png)

假设有线程`Thread t`

**情况一：NEW –> RUNNABLE**

*   当调用了`t.start()`方法时，由 NEW –> RUNNABLE

**情况二： RUNNABLE <–> WAITING**

*   当调用了t 线程用 synchronized(obj) 获取了对象锁后
    *   调用 `obj.wait()` 方法时，t 线程从 RUNNABLE –> WAITING
    *   调用 `obj.notify()`，`obj.notifyAll()`，`t.interrupt()` 时
        *   竞争锁成功，t 线程从 WAITING –> RUNNABLE
        *   竞争锁失败，t 线程从 WAITING –> BLOCKED

**情况三：RUNNABLE <–> WAITING**

*   当前线程调用 `t.join()` 方法时，当前线程从 RUNNABLE –> WAITING
    *   注意是**当前线程**在t 线程对象的监视器上等待
*   t 线程**运行结束**，或调用了**当前线程**的 `interrupt()` 时，当前线程从 WAITING –> RUNNABLE

**情况四： RUNNABLE <–> WAITING**

*   当前线程调用 `LockSupport.park()` 方法会让当前线程从 RUNNABLE –> WAITING
*   调用 `LockSupport.unpark(目标线程)` 或调用了线程的 `interrupt()` ，会让目标线程从 WAITING –> RUNNABLE

**情况五： RUNNABLE <–> TIMED\_WAITING**

t 线程用 synchronized(obj) 获取了对象锁后

*   调用 `obj.wait(long n)` 方法时，t 线程从 RUNNABLE –> TIMED\_WAITING
*   t 线程等待时间超过了 n 毫秒，或调用 `obj.notify()` ， `obj.notifyAll()` ， `t.interrupt()` 时
    *   竞争锁成功，t 线程从 TIMED\_WAITING –> RUNNABLE
    *   竞争锁失败，t 线程从 TIMED\_WAITING –> BLOCKED

**情况六：RUNNABLE <–> TIMED\_WAITING**

*   当前线程调用 `t.join(long n)` 方法时，当前线程从 RUNNABLE –> TIMED\_WAITING
    *   注意是当前线程在t 线程对象的监视器上等待
*   当前线程等待时间超过了 n 毫秒，或t 线程运行结束，或调用了当前线程的 `interrupt()` 时，当前线程从 TIMED\_WAITING –> RUNNABLE

**情况七：RUNNABLE <–> TIMED\_WAITING**

*   当前线程调用 `Thread.sleep(long n)` ，当前线程从 RUNNABLE –> TIMED\_WAITING
*   当前线程等待时间超过了 n 毫秒，当前线程从 TIMED\_WAITING –> RUNNABLE

**情况八：RUNNABLE <–> TIMED\_WAITING**

*   当前线程调用 `LockSupport.parkNanos(long nanos)` 或 `LockSupport.parkUntil(long millis)` 时，当前线 程从 RUNNABLE –> TIMED\_WAITING
*   调用 `LockSupport.unpark(目标线程)` 或调用了线程的 `interrupt()` ，或是等待超时，会让目标线程从 TIMED\_WAITING–> RUNNABLE

**情况九：RUNNABLE <–> BLOCKED**

*   t 线程用 `synchronized(obj)` 获取了对象锁时如果**竞争失败**，从 RUNNABLE –> BLOCKED
*   持 obj 锁线程的同步代码块执行完毕，会唤醒该对象上所有 BLOCKED 的线程重新竞争，如果其中 t 线程竞争成功，从 BLOCKED –> RUNNABLE ，其它**失败**的线程仍然 BLOCKED

**情况十： RUNNABLE <–> TERMINATED**

当前线程所有代码运行完毕，进入 TERMINATED

* * *

这里附《Java并发编程的艺术》的一张图做一个概括：

![](https://img-blog.csdnimg.cn/656706c3ffec4da68b65846e97b8b5bd.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ1OTY2NDQw,size_16,color_FFFFFF,t_70)

9.多把锁
-----

    class BigRoom {
        //额外创建对象来作为锁
    	private final Object studyRoom = new Object();
    	private final Object bedRoom = new Object();
    }


**将锁的粒度细分**

*   好处：是可以增强并发度
*   坏处：如果一个线程需要同时获得多把锁，就容易发生死锁

10.活跃性
------

### 10-1 死锁

有这样的情况：一个线程需要同时获取多把锁，这时就容易发生死锁

如：

*   t1线程获得A对象锁，接下来想获取B对象的锁
*   t2线程获得B对象锁，接下来想获取A对象的锁

我们来看个死锁的栗子：

    @Slf4j
    public class Test26 {
        public static void main(String[] args) {
            test1();
        }
    
        private static void test1() {
            Object A = new Object();
            Object B = new Object();
            Thread t1 = new Thread(() -> {
                synchronized (A) {
                    log.debug("lock A");
                    Sleeper.sleep(1);
                    synchronized (B) {
                        log.debug("lock B");
                        log.debug("操作...");
                    }
                }
            }, "t1");
            Thread t2 = new Thread(() -> {
                synchronized (B) {
                    log.debug("lock B");
                    Sleeper.sleep(1);
                    synchronized (A) {
                        log.debug("lock A");
                        log.debug("操作...");
                    }
                }
            }, "t2");
            t1.start();
            t2.start();
        }
    }


**死锁产生的必要条件**：

1.  **互斥条件**。只有对必须互斥使用的资源的争抢才会导致死锁（如哲学家的筷子、打印机设备）。像内存、扬声器这样可以同时让多个进程使用的资源是不会导致死锁的（因为进程不用阻塞等待这种资源）。
2.  **不剥夺条件**。进程所获得的资源在未使用完之前，不能由其他进程强行夺走，只能主动释放。
3.  **请求和保持条件**。进程已经保持了至少一个资源，但又提出了新的资源请求，而该资源又被其他进程占有，此时请求进程被阻塞，但又对自己已有的资源保持不放。
4.  **循环等待条件**。存在一种进程资源的循环等待链，链中的每一个进程已获得的资源同时被下一个进程所请求。

如果想要详细了解死锁，可以参考[操作系统-死锁](https://blog.csdn.net/qq_45966440/article/details/119132209)

* * *

### 10-2 定位死锁

检测死锁可以使用 **jconsole**工具，或者使用 **jps** 定位进程 id，再用 **jstack** 定位死锁

*   `jps+jstack ThreadID`
    
    ![](https://img-blog.csdnimg.cn/298a7b72914744c8bc1b6e07bfb8d25a.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    
*   `jconsole`
    
    ![](https://img-blog.csdnimg.cn/img_convert/359638cf867dbe8d03da37c3e19fefe3.png)
    
    ![](https://img-blog.csdnimg.cn/img_convert/e9f23bd07142b38d856fef84e6ded641.png)
    

### 10-3 哲学家就餐问题

![](https://img-blog.csdnimg.cn/img_convert/fe5db50be9adb3cc3462805aa88b8057.png)

代码演示：

    public class Test27 {
        public static void main(String[] args) {
            Chopstick c1 = new Chopstick("1");
            Chopstick c2 = new Chopstick("2");
            Chopstick c3 = new Chopstick("3");
            Chopstick c4 = new Chopstick("4");
            Chopstick c5 = new Chopstick("5");
            new Philosopher("苏格拉底", c1, c2).start();
            new Philosopher("柏拉图", c2, c3).start();
            new Philosopher("亚里士多德", c3, c4).start();
            new Philosopher("赫拉克利特", c4, c5).start();
            new Philosopher("阿基米德", c5, c1).start();
        }
    }
    
    /**
     * 筷子类
     */
    class Chopstick {
        String name;
    
        public Chopstick(String name) {
            this.name = name;
        }
    
        @Override
        public String toString() {
            return "筷子{" + name + '}';
        }
    }
    
    /**
     * 哲学家类
     */
    @Slf4j
    class Philosopher extends Thread {
        Chopstick left;
        Chopstick right;
    
        public Philosopher(String name, Chopstick left, Chopstick right) {
            super(name);
            this.left = left;
            this.right = right;
        }
    
        public void eat() {
            log.debug("eating...");
            Sleeper.sleep(1);
        }
    
        @Override
        public void run() {
            while (true) {
                while (true) {
                    // 获得左手筷子
                    synchronized (left) {
                        // 获得右手筷子
                        synchronized (right) {
                            // 吃饭
                            eat();
                        }
                        // 放下右手筷子
                    }
                    // 放下左手筷子
                }
            }
        }
    }
    //该代码会发生死锁


### 10-4 活锁

活锁出现在两个线程**互相改变对方的结束条件**，最后后谁也无法结束

举个例子：

    @Slf4j
    public class Test28 {
        static volatile int count = 10;
        static final Object lock = new Object();
    
        public static void main(String[] args) {
            new Thread(() -> {
                while (count > 0) {
                    Sleeper.sleep(0.2);
                    count--;
                    log.debug("count:{}", count);
                }
            }, "t1").start();
    
            new Thread(() -> {
                while (count < 20) {
                    Sleeper.sleep(0.2);
                    count++;
                    log.debug("count:{}", count);
                }
            }, "t2").start();
        }
    }
    //可以改变两者睡眠时间，使其交错，避免活锁产生


**死锁与活锁的区别**：

*   死锁：是因为线程互相持有对象想要的锁，并且都不释放，最后到时**线程阻塞**，**停止运行**的现象。
*   活锁：是因为线程间修改了对方的结束条件，而导致代码**一直在运行**，却一直**运行不完**的现象

### 10-5 饥饿

一个线程由于优先级太低，始终得不到 CPU 调度执行，也不能够结束，这种现象就是饥饿

11.ReentrantLock
----------------

### 11-1 特点+语法

`ReentrantLock`相对于 `synchronized` 它具备如下特点：

*   可中断
*   可以设置超时时间
*   可以设置为公平锁
*   支持多个条件变量（具有多个**waitset**）

与 `synchronized` 一样，都支持可重入

基本语法：

    // 获取锁
    reentrantLock.lock();
    try {
        // 临界区
    } finally {
        // 释放锁
        reentrantLock.unlock();
    }


### 11-2 可重入

*   **可重入**是指同一个线程如果首次获得了这把锁，那么因为它是这把锁的拥有者，因此有权利再次获取这把锁
*   如果是**不可重入**锁，那么第二次获得锁时，自己也会被锁挡住

锁重入例子：

    @Slf4j
    public class Test29 {
        private static ReentrantLock lock = new ReentrantLock();
    
        public static void main(String[] args) {
            lock.lock();
            try {
                log.debug("enter main");
                m1();
            } finally {
                lock.unlock();
            }
        }
    
        public static void m1() {
            lock.lock();
            try {
                log.debug("enter m1");
                m2();
            } finally {
                lock.unlock();
            }
        }
    
        public static void m2() {
            lock.lock();
            try {
                log.debug("enter m2");
    
            } finally {
                lock.unlock();
            }
        }
    }
    //输出
    16:10:20 DEBUG [main] (Test29.java:13) - enter main
    16:10:20 DEBUG [main] (Test29.java:22) - enter m1
    16:10:20 DEBUG [main] (Test29.java:31) - enter m2


### 11-3 可打断

如果某个线程处于阻塞状态，可以调用其interrupt方法让其停止阻塞，获得锁失败

    @Slf4j
    public class Test30 {
        private static ReentrantLock lock = new ReentrantLock();
    
        public static void main(String[] args) {
            Thread t1 = new Thread(() -> {
                try {
                    //如果没有竞争，那么该方法就会获取lock 对象锁
                    //如果有竞争就进入阻塞队列,可以被其他线程用interrupt方法打断
                    log.debug("尝试获取锁");
                    lock.lockInterruptibly();//可打断锁！必须用该方法，lock()不能打断
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    log.debug("没获得锁,返回");//等锁的过程中被打断
                    return;
                }
                try {
                    log.debug("获取到锁");
                } finally {
                    lock.unlock();
                }
            }, "t1");
            lock.lock();//主线程获得锁
            log.debug("获得了锁");
            t1.start();
            try {
                sleep(1);
                t1.interrupt();
                log.debug("执行打断");
            } finally {
                lock.unlock();
            }
        }
    }
    16:24:33 DEBUG [t1] (Test30.java:15) - 尝试获取锁
    16:24:34 DEBUG [main] (Test30.java:31) - 打断t1
    16:24:34 DEBUG [t1] (Test30.java:19) - 没获得锁,返回


### 11-4 锁超时

*   使用`lock.tryLock()`方法会返回获取锁是否成功。如果成功则返回true，反之则返回false。
*   并且`tryLock()`方法可以**指定等待时间**，参数为：`tryLock(long timeout, TimeUnit unit)`, 其中`timeout`为最长等待时间，`TimeUnit`为时间单位

改进之前哲学家就餐的死锁问题：

    @Override
    public void run() {
        while (true) {
            if (left.tryLock()) {
                try {
                    if(right.tryLock()){
                        try {
                            eat();
                        }finally {
                            right.unlock();
                        }
                    }
                } finally {
                    left.unlock();
                }
            }
        }
    }
    //需要继承ReentrantLock
    class Chopstick extends ReentrantLock {
        String name;
    
        public Chopstick(String name) {
            this.name = name;
        }
    
        @Override
        public String toString() {
            return "筷子{" + name + '}';
        }
    }


### 11-5 公平锁

在线程获取锁失败，进入阻塞队列时，**先进入**的会在锁被释放后**先获得**锁。这样的获取方式就是**公平**的。

默认是不公平锁，需要在创建时指定为公平锁：

    ReentrantLock lock = new ReentrantLock(true);


公平锁一般没有必要，**会降低并发度**

### 11-6 条件变量

`synchronized` 中也有条件变量，就是我们讲原理时那个 `waitSet` 休息室，当条件不满足时进入waitSet 等待

`ReentrantLock` 的条件变量比 synchronized 强大之处在于，它是支持**多个**条件变量的，这就好比

*   synchronized 是那些不满足条件的线程都在一间休息室等消息
*   而 ReentrantLock 支持多间休息室，有专门等烟的休息室、专门等早餐的休息室、唤醒时也是按休息室来唤 醒

使用流程：

* await 前需要**获得锁**

* await 执行后，**会释放锁**，进入 `conditionObject` 等待

* await 的线程被唤醒（或打断、或超时）取重新竞争 lock 锁

*   竞争 lock 锁成功后，从 await 后继续执行

    ```java
    @Slf4j
    public class Test80 {
        static final Object room = new Object();
        static boolean hasCigarette = false;//有没有烟
        static boolean hasTakeout = false;
        static ReentrantLock ROOM = new ReentrantLock();
        static Condition waitCigaretteSet = ROOM.newCondition();
        static Condition waitTakeoutSet = ROOM.newCondition();
    
        public static void main(String[] args) {
            new Thread(() -> {
                ROOM.lock();
                try {
                    log.debug("有烟没?[{}]", hasCigarette);
                    while (!hasCigarette) {
                        log.debug("没烟，先歇会！");
                        try {
                            waitCigaretteSet.await();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                    log.debug("有烟没?[{}]", hasCigarette);
                    if (hasCigarette) {
                        log.debug("可以开始干活了");
                    } else {
                        log.debug("没干成活");
                    }
                } finally {
                    ROOM.unlock();
                }
            }, "小南").start();
            new Thread(() -> {
                ROOM.lock();
                try {
                    log.debug("外卖送到没?[{}]", hasTakeout);
                    while (!hasTakeout) {
                        log.debug("没外卖，先歇会！");
                        try {
                            waitTakeoutSet.await();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                    log.debug("外卖送到没?[{}]", hasTakeout);
                    if (hasTakeout) {
                        log.debug("可以开始干活了");
                    } else {
                        log.debug("没干成活..");
                    }
                } finally {
                    ROOM.unlock();
                }
            }, "小女").start();
    
            Sleeper.sleep(1);
            new Thread(() -> {
                ROOM.lock();
                try {
                    hasTakeout = true;
                    waitTakeoutSet.signal();
                } finally {
                    ROOM.unlock();
                }
            }, "送外卖的").start();
            Sleeper.sleep(1);
            new Thread(() -> {
                ROOM.lock();
                try {
                    hasCigarette = true;
                    waitCigaretteSet.signal();
                } finally {
                    ROOM.unlock();
                }
            }, "送烟的").start();
        }
    }
    ```
    
    
    

4.共享模型之内存
===============================================================================================================

本文章视频指路👉[黑马程序员-并发编程](https://www.bilibili.com/video/BV16J411h7Rd?from=search&seid=2997500517729436594&spm_id_from=333.337.0.0)

1.Java内存模型
----------

JMM 即 Java Memory Model，它定义了**主存（共享内存）、工作内存（线程私有）** 抽象概念，底层对应着 CPU 寄存器、缓存、硬件内存、 CPU 指令优化等。

**JMM**体现在以下几个方面：

*   **原子性** - 保证指令不会受到线程上下文切换的影响
*   **可见性** - 保证指令不会受 cpu 缓存的影响
*   **有序性** - 保证指令不会受 cpu 指令并行优化的影响

2.可见性
-----

### 2-1 退不出的循环

先来看一个现象，main 线程对 run 变量的修改对于 t 线程不可见，导致了 t 线程无法停止：

    static boolean run = true;
    public static void main(String[] args) throws InterruptedException {
        Thread t = new Thread(()->{
            while(run){
                // ....
            }
        });
        t.start();
        Thread.sleep(1000);
        run = false; // 线程t不会如预想的停下来
    }


**为什么无法退出该循环**？

1.  初始状态， t 线程刚开始从**主内存**读取了 run 的值到**工作内存**。
    
    ![](https://img-blog.csdnimg.cn/2363b3cf0c8c4c34be89818c84e143dd.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    
2.  因为 t 线程要频繁从**主内存**中读取 run 的值，**JIT 编译器**会将 run 的值缓存至自己工作内存中的**高速缓存**中，减少对主存中 run 的访问，提高效率
    
    ![](https://img-blog.csdnimg.cn/579c364e13474ea1b378f513b517300a.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    
3.  1 秒之后，main 线程修改了 run 的值，并同步至主存，而 t 是从自己工作内存中的高速缓存中读取这个变量的值，结果永远是旧值
    
    ![](https://img-blog.csdnimg.cn/3d3b0a4e64424dc88f6325133ba46ec8.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    

**解决办法**

*   使用 `volatile`（易变关键字）
*   它可以用来修饰**成员变量**和**静态成员变量**，他可以避免线程从自己的工作缓存中查找变量的值，必须到主存中获取它的值，线程操作 volatile 变量都是**直接操作主存**

### 2-2 可见性vs原子性

前面例子体现的实际就是**可见性**，它保证的是在多个线程之间，一个线程对**volatile变量**的修改对另一个线程可见， 不能保证原子性，仅用在**一个写**线程，**多个读**线程的情况

> 注意：
>
> *   `synchronized` 语句块既可以保证代码块的**原子性**，也同时保证代码块内变量的**可见性**。
>
> *   但缺点是 `synchronized` 是属于**重量级**操作，性能相对更低。
>
> *   如果在前面示例的死循环中加入 `System.out.println()` 会发现即使不加 volatile 修饰符，线程 t 也能正确看到对 run 变量的修改了，想一想为什么？
>
>     进入`println`源码，可以看出加了`synchronized`，保证了每次`run`变量都会从主存中获取
>
>         public void println(int x) {
>             synchronized (this) {
>                 print(x);
>                 newLine();
>             }
>         }
>
> 

3.有序性
-----

### 3-1 诡异的结果

看下面一个栗子：

    int num = 0;
    boolean ready = false;
    // 线程1 执行此方法
    public void actor1(I_Result r) {
        if(ready) {
            r.r1 = num + num;
        } else {
            r.r1 = 1;
        }
    }
    // 线程2 执行此方法
    public void actor2(I_Result r) {
        num = 2;
        ready = true;
    }


​    

看到这里可能聪明的小伙伴会想到有下面三种情况：

情况1：线程1 先执行，这时 ready = false，所以进入 else 分支结果为 1

情况2：线程2 先执行 num = 2，但没来得及执行 ready = true，线程1 执行，还是进入 else 分支，结果为1

情况3：线程2 执行到 ready = true，线程1 执行，这回进入 if 分支，结果为 4（因为 num 已经执行过了）

**但其实还有可能为0哦！** 😲

有可能还是：线程 2 执行 ready=true ，切换到线程1 ，进入if分支，相加为0，在切回线程 2 执行 num=2

这种现象就是指令重排

### 3-2 解决方法

`volatile` 修饰的变量，可以禁用指令重排

    @JCStressTest
    @Outcome(id = {"1", "4"}, expect = Expect.ACCEPTABLE, desc = "ok")
    @Outcome(id = "0", expect = Expect.ACCEPTABLE_INTERESTING, desc = "!!!!")
    @State
    public class ConcurrencyTest {
        int num = 0;
        volatile boolean ready = false;//可以禁用指令重排
        @Actor
        public void actor1(I_Result r) {
            if(ready) {
                r.r1 = num + num;
            } else {
                r.r1 = 1;
            }
        }
        @Actor
        public void actor2(I_Result r) {
            num = 2;
            ready = true;
        }
    }


### 3-3 有序性理解

同一线程内，JVM会在不影响正确性的前提下，可以调整语句的执行顺序，看看下面的代码：

    static int i;
    static int j;
    // 在某个线程内执行如下赋值操作
    i = ...; // 较为耗时的操作
    j = ...;


可以看到，至于是先执行 i 还是 先执行 j ，对最终的结果不会产生影响。所以，上面代码真正执行时， 既可以是

    i = ...; // 较为耗时的操作
    j = ...;


也可以是

    j = ...;
    i = ...; // 较为耗时的操作


这种特性称之为**指令重排**，**多线程下指令重排会影响正确性**

### 3-4 happens-before

**happens-before** 规定了对共享变量写操作对其它线程的读操作可见，它是**可见性**与**有序性**的一套规则总结，抛开以下 happens-before 规则，JMM 并不能保证一个线程对共享变量的写，对于其它线程对该共享变量的读可见

*   线程解锁 m 之前对变量的写，对于接下来对 m 加锁的其它线程对该变量的读可见
    
        static int x;
        static Object m = new Object();
        new Thread(()->{
            synchronized(m) {
                x = 10;
            }
        },"t1").start();
        new Thread(()->{
            synchronized(m) {
                System.out.println(x);
            }
        },"t2").start()
    
*   线程对 volatile 变量的写，对接下来其它线程对该变量的读可见
    
        volatile static int x;
        new Thread(()->{
            x = 10;
        },"t1").start();
        new Thread(()->{
            System.out.println(x);
        },"t2").start();
    
*   线程 start 前对变量的写，对该线程开始后对该变量的读可见
    
        static int x;
        x = 10;
        new Thread(()->{
            System.out.println(x);
        },"t2").start();
    
*   线程结束前对变量的写，对其它线程得知它结束后的读可见（比如其它线程调用 `t1.isAlive()` 或 `t1.join()`等待它结束）
    
        static int x;
        Thread t1 = new Thread(()->{
            x = 10;
        },"t1");
        t1.start();
        t1.join();
        System.out.println(x);
    
*   线程 t1 打断 t2（interrupt）前对变量的写，对于其他线程得知 t2 被打断后对变量的读可见（通 过`t2.interrupted` 或 `t2.isInterrupted`）
    
        static int x;
        public static void main(String[] args) {
            Thread t2 = new Thread(()->{
                while(true) {
                    if(Thread.currentThread().isInterrupted()) {
                        System.out.println(x);//10
                        break;
                    }
                }
            },"t2");
            t2.start();
            new Thread(()->{
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                x = 10;
                t2.interrupt();
            },"t1").start();
            while(!t2.isInterrupted()) {
                Thread.yield();
            }
            System.out.println(x);//10
        }
    
*   对变量默认值（0，false，null）的写，对其它线程对该变量的读可见
    
*   具有传递性，如果 `x hb-> y` 并且 `y hb-> z` 那么有 `x hb-> z`
    
        volatile static int x;
        static int y;
        new Thread(()->{ 
            y = 10;
            x = 20;//写屏障，y也会同步到主存
        },"t1").start();
        new Thread(()->{
            // x=20 对 t2 可见, 同时 y=10 也对 t2 可见
            System.out.println(x); 
        },"t2").start();
    
    

> 以上变量都是指**共享变量**即成员变量或静态资源变量

4.volatile 原理
-------------

volatile的底层实现原理是**内存屏障**，Memory Barrier（Memory Fence）

*   对 volatile 变量的写指令后会加入**写屏障**
*   对 volatile 变量的读指令前会加入**读屏障**

### 4-1 如何保证可见性

*   **写屏障**（sfence）保证在该屏障之前的，对共享变量的改动，都同步到主存当中
    
        public void actor2(I_Result r) {
            num = 2;
            ready = true; // ready 是 volatile 赋值带写屏障
            // 写屏障
        }
    
*   **读屏障**（lfence）保证在该屏障之后，对共享变量的读取，加载的是主存中新数据
    
        public void actor1(I_Result r) {
            // 读屏障
            // ready 是 volatile 读取值带读屏障
            if(ready) {
                r.r1 = num + num;
            } else {
                r.r1 = 1;
            }
        }
    
    
    [![](https://img-blog.csdnimg.cn/img_convert/5f3edd4038d319b60b284676a8f514ee.png)](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608145713.png)
    

### 4-2 如何保证有序性

*   **写屏障**会确保指令重排序时，不会将写屏障之前的代码排在写屏障之后
    
        public void actor2(I_Result r) {
            num = 2;
            ready = true; // ready 是 volatile 赋值带写屏障
            // 写屏障
        }
    
*   **读屏障**会确保指令重排序时，不会将读屏障之后的代码排在读屏障之前
    
        public void actor1(I_Result r) {
            // 读屏障
            // ready 是 volatile 读取值带读屏障
            if(ready) {
                r.r1 = num + num;
            } else {
                r.r1 = 1;
            }
        }
    
    
    ​    
    
    ![](https://img-blog.csdnimg.cn/img_convert/989ddf56e97f1054b1f369873d945d11.png)
    

但是，**不能解决指令交错**：

*   写屏障仅仅是保证**本线程**之后的读能够读到最新的结果，但不能保证其他线程读跑到它前面去
*   有序性的保证也只是保证了**本线程内**相关代码不被重排序

![](https://img-blog.csdnimg.cn/957ecc95104b4efebbaf52ced0404513.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

### 4-3 double-checked locking 问题

以著名的 double-checked locking 单例模式为例

    public class Singleton {
        private Singleton() {
        }
        private static Singleton INSTANCE = null;
        public static Singleton getInstance() {
            //实例没创建，才会进入内部的 synchronized 代码块,提高性能，防止每次都加锁
            if (INSTANCE == null) {
                //可能第一个线程在synchronized 代码块还没创建完对象时，第二个线程已经到了这一步，所以里面还需要加上判断
                synchronized (Singleton.class) {
                    //也许有其他线程已经创建实例，所以再判断一次
                    if (INSTANCE == null) {
                        INSTANCE = new Singleton();
                    }
                }
            }
            return INSTANCE;
        }
    }


以上的实现特点是：

*   懒惰实例化
*   首次使用 getInstance() 才使用 synchronized 加锁，后续使用时无需加锁
*   有隐含的，但很关键的一点：第一个 if 使用了 INSTANCE 变量，是在同步块之外但在多线程环境下，上面的代码是有问题的

`INSTANCE = new Singleton()` 对应的字节码为：

    0: new #2 // class cn/itcast/jvm/t4/Singleton
    3: dup
    4: invokespecial #3 // Method "<init>":()V
    7: putstatic #4 // Field INSTANCE:Lcn/itcast/jvm/t4/Singleton;


其中4 7 两步顺序不是固定的，也许 jvm 会优化为：先将引用地址赋值给 INSTANCE 变量后，再执行构造方法，如果两个线程 t1,t2 按如下时间顺序执行：

    时间1 t1 线程执行到 INSTANCE = new Singleton();
    时间2 t1 线程分配空间，为Singleton对象生成了引用地址（0 处）
    时间3 t1 线程将引用地址赋值给 INSTANCE，这时 INSTANCE != null（7 处）
    时间4 t2 线程进入getInstance() 方法，发现 INSTANCE != null（synchronized块外），直接
    返回 INSTANCE
    时间5 t1 线程执行Singleton的构造方法（4 处）


这时 t1 还未完全将构造方法执行完毕，如果在构造方法中要执行很多初始化操作，那么 t2 拿到的是将 是一个未初始化完毕的单例

对 `INSTANCE` 使用 **volatile** 修饰即可，可以**禁用指令重排**，但要注意在 JDK 5 以上的版本的 volatile 才 会真正有效



5.共享模型之无锁
===============================================================================================================

本文章视频指路👉[黑马程序员-并发编程](https://www.bilibili.com/video/BV16J411h7Rd?from=search&seid=2997500517729436594&spm_id_from=333.337.0.0)

1.无锁解决线程安全问题
------------

有如下需求，保证 `account.withdraw` 取款方法的线程安全：

    interface Account {
        // 获取余额
        Integer getBalance();
        // 取款
        void withdraw(Integer amount);
        /**
     * 方法内会启动 1000 个线程，每个线程做 -10 元 的操作
     * 如果初始余额为 10000 那么正确的结果应当是 0
     */
        static void demo(Account account) {
            List<Thread> ts = new ArrayList<>();
            long start = System.nanoTime();
            for (int i = 0; i < 1000; i++) {
                ts.add(new Thread(() -> {
                    account.withdraw(10);
                }));
            }
            ts.forEach(Thread::start);
            ts.forEach(t -> {
                try {
                    t.join();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
            long end = System.nanoTime();
            System.out.println(account.getBalance() 
                               + " cost: " + (end-start)/1000_000 + " ms");
        }
    }


原有实现并不是线程安全的：

    class AccountUnsafe implements Account {
        private Integer balance;
    
        public AccountUnsafe(Integer balance) {
            this.balance = balance;
        }
    
        @Override
        public Integer getBalance() {
            return balance;
        }
    
        @Override
        public void withdraw(Integer amount) {
            this.balance -= amount;
        }
    }


执行测试代码：

    public static void main(String[] args) {
        Account.demo(new AccountUnsafe(10000));
    }


某次得到的结果：

    330 cost: 306 ms 


**解决办法-锁**

首先想到的是给 Account 对象加锁：

    @Override
    public synchronized void withdraw(Integer amount) {
        balance -= amount;
    }


**解决思路-无锁**

    class AccountCas implements Account {
       
        private AtomicInteger balance;
    
        public AccountCas(int balance) {
            this.balance = new AtomicInteger(balance);
        }
    
        @Override
        public Integer getBalance() {
            return balance.get();
        }
    
        @Override
        public void withdraw(Integer amount) {
            while (true) {
                int prev = balance.get();
                //要修改的余额
                int next = prev - amount;
                //把next同步到主存，如果成功退出循环，不成功说明有其他线程已经修改了amount，此时需要重新写入
                if (balance.compareAndSet(prev, next)) {
                    break;
                }
            }
            // 可以简化为下面的方法
            // balance.addAndGet(-1 * amount);
        }
    }


2.CAS 与 volatile
----------------

### 2-1 CAS

前面看到的 `AtomicInteger` 的解决方法，内部并没有用锁来保护共享变量的线程安全。那么它是如何实现的呢？

    public void withdraw(Integer amount) {
        while(true) {
            // 需要不断尝试，直到成功为止
            while (true) {
                // 比如拿到了旧值 1000
                int prev = balance.get();
                // 在这个基础上 1000-10 = 990
                int next = prev - amount;
                /*
                 compareAndSet 正是做这个检查，在 set 前，先比较 prev 与当前值
                 - 不一致了，next 作废，返回 false 表示失败
                 比如，别的线程已经做了减法，当前值已经被减成了 990
                 那么本线程的这次 990 就作废了，进入 while 下次循环重试
                 - 一致，以 next 设置为新值，返回 true 表示成功
                 */
                if (balance.compareAndSet(prev, next)) {
                    break;
                }
            }
        }
    }


其中的关键是 `compareAndSet`，它的简称就是 `CAS` （也有 `Compare And Swap` 的说法），它必须是**原子操作**。

![](https://img-blog.csdnimg.cn/img_convert/969e0f863c36184f31d97e464aad79e7.png)

> 注意：
>
> *   其实 CAS 的底层是 `lock cmpxchg` 指令（X86 架构），在单核 CPU 和多核 CPU 下都能够保证【比较-交换】的**原子性**。
> *   在多核状态下，某个核执行到带 lock 的指令时，CPU 会让总线锁住，当这个核把此指令执行完毕，再开启总线。这个过程中不会被线程的调度机制所打断，保证了多个线程对内存操作的准确性，是原子的。

### 2-2 volatile

*   获取共享变量时，为了保证该变量的**可见性**，需要使用 `volatile` 修饰。
*   它可以用来修饰**成员变量**和**静态成员变量**，他可以避免线程从自己的工作缓存中查找变量的值，必须到**主存中获取** 它的值，线程操作 `volatile` 变量都是直接操作主存。即一个线程对 `volatile` 变量的修改，对另一个线程可见。

> 注意：
>
> `volatile` 仅仅**保证了共享变量的可见性**，让其它线程能够看到新值，但不能解决指令交错问题（**不能保证原子性**）

**CAS 必须借助 volatile** 才能读取到共享变量的新值来实现【比较并交换】的效果

### 2-3 为什么无锁效率高

一般情况下，使用无锁比使用加锁的**效率更高**

*   无锁情况下，即使重试失败，线程始终在高速运行，没有停歇，而 `synchronized` 会让线程在没有获得锁的时候，发生上下文切换，进入阻塞。
*   但无锁情况下，因为线程要保持运行，需要额外 CPU 的支持，CPU 在这里就好比高速跑道，没有额外的跑道，线程想高速运行也无从谈起，虽然不会进入阻塞，但由于没有分到时间片，仍然会进入可运行状态，还是会导致上下文切换。

### 2-4 CAS特点

结合 `CAS` 和 `volatile` 可以实现**无锁并发**，适用于**线程数少、多核 CPU** 的场景下。

*   `CAS` 是基于**乐观锁**的思想：乐观的估计，不怕别的线程来修改共享变量，就算改了也没关系，我吃亏点再重试呗。
*   `synchronized` 是基于**悲观锁**的思想：悲观的估计，得防着其它线程来修改共享变量，我上了锁你们都别想改，我改完了解开锁，你们才有机会。
*   CAS 体现的是**无锁并发**、**无阻塞并发**
    *   因为没有使用 synchronized，所以线程不会陷入阻塞，这是效率提升的因素之一
    *   但如果竞争激烈，可以想到重试必然频繁发生，反而效率会受影响

3.原子整数
------

**J.U.C** 并发包提供了：

*   `AtomicBoolean`
*   `AtomicInteger`
*   `AtomicLong`

以 `AtomicInteger` 为例：

    AtomicInteger i = new AtomicInteger(0);
    // 获取并自增（i = 0, 结果 i = 1, 返回 0），类似于 i++
    System.out.println(i.getAndIncrement());
    // 自增并获取（i = 1, 结果 i = 2, 返回 2），类似于 ++i
    System.out.println(i.incrementAndGet());
    // 自减并获取（i = 2, 结果 i = 1, 返回 1），类似于 --i
    System.out.println(i.decrementAndGet());
    // 获取并自减（i = 1, 结果 i = 0, 返回 1），类似于 i--
    System.out.println(i.getAndDecrement());
    // 获取并加值（i = 0, 结果 i = 5, 返回 0）
    System.out.println(i.getAndAdd(5));
    // 加值并获取（i = 5, 结果 i = 0, 返回 0）
    System.out.println(i.addAndGet(-5));
    // 获取并更新（i = 0, p 为 i 的当前值, 结果 i = -2, 返回 0）
    // 其中函数中的操作能保证原子，但函数需要无副作用
    System.out.println(i.getAndUpdate(p -> p - 2));
    // 更新并获取（i = -2, p 为 i 的当前值, 结果 i = 0, 返回 0）
    // 其中函数中的操作能保证原子，但函数需要无副作用
    System.out.println(i.updateAndGet(p -> p + 2));
    // 获取并计算（i = 0, p 为 i 的当前值, x 为参数1, 结果 i = 10, 返回 0）
    // 其中函数中的操作能保证原子，但函数需要无副作用
    // getAndUpdate 如果在 lambda 中引用了外部的局部变量，要保证该局部变量是 final 的
    // getAndAccumulate 可以通过 参数1 来引用外部的局部变量，但因为其不在 lambda 中因此不必是 final
    System.out.println(i.getAndAccumulate(10, (p, x) -> p + x));
    // 计算并获取（i = 10, p 为 i 的当前值, x 为参数1, 结果 i = 0, 返回 0）
    // 其中函数中的操作能保证原子，但函数需要无副作用
    System.out.println(i.accumulateAndGet(-10, (p, x) -> p + x));


4.原子引用
------

### 4-1 原子引用的使用

为什么需要原子引用类型？

*   `AtomicReference`
*   `AtomicMarkableReference`
*   `AtomicStampedReference`

有如下方法：

    public interface DecimalAccount {
        BigDecimal getBalance();
    
        void withdraw(BigDecimal amount);
    
        /**
    	 * 方法内会启动 1000 个线程，每个线程做 -10 元 的操作    
         * 如果初始余额为 10000 那么正确的结果应当是 0
    	 */
        static void demo(DecimalAccountImpl account) {
            List<Thread> ts = new ArrayList<>();
            long start = System.nanoTime();
            for (int i = 0; i < 1000; i++) {
                ts.add(new Thread(() -> {
                    account.withdraw(BigDecimal.TEN);
                }));
            }
            ts.forEach(Thread::start);
            ts.forEach(t -> {
                try {
                    t.join();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
            long end = System.nanoTime();
            System.out.println(account.getBalance() + " cost: " + (end - start) / 1000_000 + " ms");
        }
    }
    
    class DecimalAccountImpl implements DecimalAccount {
        //原子引用，泛型类型为小数类型
        AtomicReference<BigDecimal> balance;
    
        public DecimalAccountImpl(BigDecimal balance) {
            this.balance = new AtomicReference<BigDecimal>(balance);
        }
    
        @Override
        public BigDecimal getBalance() {
            return balance.get();
        }
    
        @Override
        public void withdraw(BigDecimal amount) {
            while(true) {
                BigDecimal pre = balance.get();
                BigDecimal next = pre.subtract(amount);
                if(balance.compareAndSet(pre, next)) {
                    break;
                }
            }
        }
    
        public static void main(String[] args) {
            DecimalAccount.demo(new DecimalAccountImpl(new BigDecimal("10000")));
        }
    }


### 4-2 ABA 问题及解决

**ABA问题**

因为CAS需要在操作值的时候，检查值有没有发生变化，如果没有发生变化则更新，但是如果一个值原来是A，变成了B，又变成了A，那么使用CAS进行检查时会发现它的值没有发生变化，但是实际上却变化了。ABA问题的解决思路就是使用**版本号**。在变量前面追加上版本号，每次变量更新的时候把版本号加1，那么A→B→A就会变成1A→2B→3A

从 Java 1.5开始，JDK的Atomic包里提供了一个类`AtomicStampedReference`来解决ABA问题。这个类的`compareAndSet`方法的作用是首先检查当前引用是否等于预期引用，并且检查当前标志是否等于预期标志，如果全部相等，则以原子方式将该引用和该标志的值设置为给定的更新值

**AtomicStampedReference**

    @Slf4j
    public class Test3 {
        static AtomicStampedReference<String> ref = new AtomicStampedReference<>("A", 0);
    
        public static void main(String[] args) {
            log.debug("main start...");
            // 获取值 A
            String prev = ref.getReference();
            // 获取版本号
            int stamp = ref.getStamp();
            log.debug("版本 {}", stamp);
            // 如果中间有其它线程干扰，发生了 ABA 现象
            other();
            sleep(1);
            // 尝试改为 C
            log.debug("change A->C {}", ref.compareAndSet(prev, "C", stamp, stamp + 1));
    
        }
    
        private static void other() {
            ref.compareAndSet(ref.getReference(), "B", ref.getStamp(), ref.getStamp() + 1);
            ref.compareAndSet(ref.getReference(), "A", ref.getStamp(), ref.getStamp() + 1);
        }
    }
    22:48:31 DEBUG [main] (Test3.java:16) - main start...
    22:48:31 DEBUG [main] (Test3.java:21) - 版本 0
    22:48:32 DEBUG [main] (Test3.java:26) - change A->C false


`AtomicStampedReference` 可以给原子引用加上版本号，追踪原子引用整个的变化过程，如： A -> B -> A -> C ，通过`AtomicStampedReference`，我们可以知道，引用变量中途被更改了几次。

但是有时候，并不关心引用变量更改了几次，只是单纯的关心是否更改过，所以就有了 `AtomicMarkableReference`

**AtomicMarkableReference**

    class GarbageBag {
        String desc;
    
        public GarbageBag(String desc) {
            this.desc = desc;
        }
    
        public void setDesc(String desc) {
            this.desc = desc;
        }
    
        @Override
        public String toString() {
            return super.toString() + " " + desc;
        }
    }
    @Slf4j
    public class TestABAAtomicMarkableReference {
        public static void main(String[] args) throws InterruptedException {
            GarbageBag bag = new GarbageBag("装满了垃圾");
            // 参数2 mark 可以看作一个标记，表示垃圾袋满了
            AtomicMarkableReference<GarbageBag> ref = new AtomicMarkableReference<>(bag, true);
            log.debug("主线程 start...");
            GarbageBag prev = ref.getReference();
            log.debug(prev.toString());
            new Thread(() -> {
                log.debug("打扫卫生的线程 start...");
                bag.setDesc("空垃圾袋");
                while (!ref.compareAndSet(bag, bag, true, false)) {}
                log.debug(bag.toString());
            }).start();
            Thread.sleep(1000);
            log.debug("主线程想换一只新垃圾袋？");
            boolean success = ref.compareAndSet(prev, new GarbageBag("空垃圾袋"), true, false);
            log.debug("换了么？" + success);
            log.debug(ref.getReference().toString());
        }
    }
    
    22:50:57 DEBUG [main] (Test5.java:14) - start...
    22:50:57 DEBUG [main] (Test5.java:16) - xpp.day3.GarbageBag@ffa5d 装满了垃圾
    22:50:57 DEBUG [保洁阿姨] (Test5.java:18) - start...
    22:50:57 DEBUG [保洁阿姨] (Test5.java:21) - xpp.day3.GarbageBag@ffa5d 空垃圾袋
    22:50:58 DEBUG [main] (Test5.java:24) - 想换一只新垃圾袋？
    22:50:58 DEBUG [main] (Test5.java:26) - 换了吗？false
    22:50:58 DEBUG [main] (Test5.java:27) - xpp.day3.GarbageBag@ffa5d 空垃圾袋


5.原子数组
------

*   `AtomicIntegerArray`
*   `AtomicLongArray`
*   `AtomicReferenceArray`

> 注意：
>
> 对**函数式接口**不熟悉的小伙伴可以参考👉[Java—函数式接口](https://blog.csdn.net/qq_45966440/article/details/119100813)

    /**
     参数1，提供数组、可以是线程不安全数组或线程安全数组
     参数2，获取数组长度的方法
     参数3，自增方法，回传 array, index
     参数4，打印数组的方法
    */
    // supplier 提供者 无中生有 ()->结果
    // function 函数 一个参数一个结果 (参数)->结果 , BiFunction (参数1,参数2)->结果
    // consumer 消费者 一个参数没结果 (参数)->void, BiConsumer (参数1,参数2)->
    private static <T> void demo(
        Supplier<T> arraySupplier,
        Function<T, Integer> lengthFun,
        BiConsumer<T, Integer> putConsumer,
        Consumer<T> printConsumer ) {
        List<Thread> ts = new ArrayList<>();
        T array = arraySupplier.get();
        int length = lengthFun.apply(array);
        for (int i = 0; i < length; i++) {
            // 每个线程对数组作 10000 次操作
            ts.add(new Thread(() -> {
                for (int j = 0; j < 10000; j++) {
                    putConsumer.accept(array, j%length);
                }
            }));
        }
        ts.forEach(t -> t.start()); // 启动所有线程
        ts.forEach(t -> {
            try {
                t.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }); // 等所有线程结束
        printConsumer.accept(array);
    }


**不安全的数组**

    demo(
        ()->new int[10],
        (array)->array.length,
        (array, index) -> array[index]++,
        array-> System.out.println(Arrays.toString(array))
    );
    输出：
    [9870, 9862, 9774, 9697, 9683, 9678, 9679, 9668, 9680, 9698] 


**安全的数组**

    demo(
        ()-> new AtomicIntegerArray(10),
        (array) -> array.length(),
        (array, index) -> array.getAndIncrement(index),
        array -> System.out.println(array)
    );
    输出：
    [10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000] 


6.字段更新器
-------

*   `AtomicReferenceFieldUpdater` // 域 字段
*   `AtomicIntegerFieldUpdater`
*   `AtomicLongFieldUpdater`

利用字段更新器，可以针对**对象的某个域**（Field）进行**原子操作**，只能配合 `volatile` 修饰的字段使用，否则会出现异常

    Exception in thread "main" java.lang.IllegalArgumentException: Must be volatile type


栗子1：

    public class Test5 {
        private volatile int field;
        public static void main(String[] args) {
            AtomicIntegerFieldUpdater fieldUpdater =AtomicIntegerFieldUpdater.newUpdater(Test5.class, "field");
            Test5 test5 = new Test5();
            fieldUpdater.compareAndSet(test5, 0, 10);
            // 修改成功 field = 10
            System.out.println(test5.field);
            // 修改成功 field = 20
            fieldUpdater.compareAndSet(test5, 10, 20);
            System.out.println(test5.field);
            // 修改失败 field = 20
            fieldUpdater.compareAndSet(test5, 10, 30);
            System.out.println(test5.field);
        }
    }
    //输出：
    10
    20
    20


栗子2：

    public class Test7 {
        public static void main(String[] args) {
            Student student = new Student();
    		//参数1： 持有属性的类
            //参数2：被更新的属性的class
            //参数3：属性的名称
            AtomicReferenceFieldUpdater<Student, String> updater = AtomicReferenceFieldUpdater.newUpdater(Student.class, String.class, "name");
            updater.compareAndSet(student, null, "xpp");//更新成功
            System.out.println(student);
            updater.compareAndSet(student, "xp", "mzz");//更新失败
            System.out.println(student);
        }
    }
    
    @ToString
    class Student {
        volatile String name;
    }


7.原子累加器
-------

**累加器性能比较**

    private static <T> void demo(Supplier<T> adderSupplier, Consumer<T> action) {
        T adder = adderSupplier.get();
        long start = System.nanoTime();
        List<Thread> ts = new ArrayList<>();
        // 4 个线程，每人累加 50 万
        for (int i = 0; i < 40; i++) {
            ts.add(new Thread(() -> {
                for (int j = 0; j < 500000; j++) {
                    action.accept(adder);
                }
            }));
        }
        ts.forEach(t -> t.start());
        // 等所有线程结束
        ts.forEach(t -> {
            try {
                t.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        long end = System.nanoTime();
        System.out.println(adder + " cost:" + (end - start) / 1000_000);
    }


比较 `AtomicLong` 与 `LongAdder`

    for (int i = 0; i < 5; i++) {
     demo(() -> new LongAdder(), adder -> adder.increment());
    }
    for (int i = 0; i < 5; i++) {
     demo(() -> new AtomicLong(), adder -> adder.getAndIncrement());
    }
    //输出
    1000000 cost:43 
    1000000 cost:9 
    1000000 cost:7 
    1000000 cost:7 
    1000000 cost:7 
    1000000 cost:31 
    1000000 cost:27 
    1000000 cost:28 
    1000000 cost:24 
    1000000 cost:22 


可以看出`LongAdder`效率更高

性能提升的原因很简单，就是在有竞争时，**设置多个累加单元**，Therad-0 累加 Cell\[0\]，而 Thread-1 累加 Cell\[1\]… 最后将结果汇总。这样它们在累加时操作的不同的 Cell 变量，因此减少了 CAS 重试失败，从而提高性能。

8.LongAdder详解
-------------

LongAdder 类有几个关键域：

    // 累加单元数组, 懒惰初始化
    transient volatile Cell[] cells;
    // 基础值, 如果没有竞争, 则用 cas 累加这个域
    transient volatile long base;
    // 在 cells 创建或扩容时, 置为 1, 表示加锁
    transient volatile int cellsBusy;


### 8-1 cas 锁

    // 不要用于实践！！！
    @Slf4j
    public class LockCas {
        //0 没加锁
        //1 加锁
        private AtomicInteger state = new AtomicInteger(0);
    
        public void lock() {
            while (true) {
                //当为0时，加锁，state变为1，此时其他线程想获得锁就会一直循环cas
                if (state.compareAndSet(0, 1)) {
                    break;
                }
            }
        }
    
        public void unlock() {
            log.debug("unlock...");
            state.set(0);
        }
    
        public static void main(String[] args) {
            LockCas lock = new LockCas();
            new Thread(() -> {
                log.debug("begin...");
                lock.lock();
                System.out.println(lock.state);
                try {
                    log.debug("lock...");
                    Sleeper.sleep(1);
                } finally {
                    lock.unlock();
                }
            }).start();
            new Thread(() -> {
                log.debug("begin...");
                lock.lock();
                try {
                    log.debug("lock...");
                } finally {
                    lock.unlock();
                }
            }).start();
    
        }
    }
    17:11:26 DEBUG [Thread-1] (LockCas.java:42) - begin...
    17:11:26 DEBUG [Thread-0] (LockCas.java:35) - lock...
    17:11:27 DEBUG [Thread-0] (LockCas.java:24) - unlock...
    17:11:27 DEBUG [Thread-1] (LockCas.java:45) - lock...
    17:11:27 DEBUG [Thread-1] (LockCas.java:24) - unlock...


### 8-2 原理之伪共享

    // 防止缓存行伪共享
    @sun.misc.Contended
        static final class Cell {
            volatile long value;
            Cell(long x) { value = x; }
    
            // 最重要的方法, 用来 cas 方式进行累加, prev 表示旧值, next 表示新值
            final boolean cas(long prev, long next) {
                return UNSAFE.compareAndSwapLong(this, valueOffset, prev, next);
            }
            // 省略不重要代码
        }


得从缓存说起，缓存与内存的速度比较

![](https://img-blog.csdnimg.cn/img_convert/9d3df3ad5311a92ecf235ccf78584ca3.png)

![](https://img-blog.csdnimg.cn/img_convert/b4d95b0315026ad343cda2dd2d2f3c2a.png)

*   因为 CPU 与 内存的速度差异很大，需要靠预读数据至**缓存**来提升效率。
*   而缓存以**缓存行**为单位，每个缓存行对应着一块内存，一般是 64 byte（8 个 long）
*   缓存的加入会造成**数据副本**的产生，即同一份数据会缓存在不同核心的缓存行中
*   CPU 要保证**数据的一致性**，如果某个 CPU 核心更改了数据，其它 CPU 核心对应的整个缓存行必须失效

![](https://img-blog.csdnimg.cn/img_convert/56de3a77bb6f96ba480f622083864c36.png)

因为 Cell 是数组形式，在内存中是连续存储的，一个 Cell 为 24 字节（16 字节的对象头和 8 字节的 value），因 此缓存行可以存下 2 个的 Cell 对象。这样问题来了：

*   Core-0 要修改 Cell\[0\]
*   Core-1 要修改 Cell\[1\]

无论谁修改成功，都会导致对方 Core 的缓存行失效，比如 Core-0 中Cell\[0\]=6000, Cell\[1\]=8000 要累加 Cell\[0\]=6001, Cell\[1\]=8000 ，这时会让 Core-1 的缓存行失效

`@sun.misc.Contended` 用来解决这个问题，它的原理是在使用此注解的对象或字段的**前后各增加 128 字节大小的 padding**（空白），从而让 CPU 将对象预读至缓存时**占用不同的缓存行**，这样，不会造成对方缓存行的失效

![](https://img-blog.csdnimg.cn/img_convert/4f0aefac3f7bfaece8703efa77e342fa.png)

**累加主要调用下面的方法**

    public void add(long x) {
        // as 为累加单元数组
        // b 为基础值
        // x 为累加值
        Cell[] as; long b, v; int m; Cell a;
        // 进入 if 的两个条件
        // 1. as 有值, 表示已经发生过竞争, 进入 if
        // 2. cas 给 base 累加时失败了, 表示 base 发生了竞争, 进入 if
        if ((as = cells) != null || !casBase(b = base, b + x)) {
            // uncontended 表示 cell 没有竞争
            boolean uncontended = true;
            if (
                // as 还没有创建
                as == null || (m = as.length - 1) < 0 ||
                // 当前线程对应的 cell 还没有
                (a = as[getProbe() & m]) == null ||
                // cas 给当前线程的 cell 累加失败 uncontended=false ( a 为当前线程的 cell )
                !(uncontended = a.cas(v = a.value, v + x))
            ) {
                // 进入 cell 数组创建、cell 创建的流程
                longAccumulate(x, null, uncontended);
            }
        }
    }


**累加流程图**

![](https://img-blog.csdnimg.cn/img_convert/ce399f7bd72da53a22f6fbaba896dcc1.png)

9.Unsafe
--------

### 9-1 概述

Unsafe 对象提供了非常底层的，操作内存、线程的方法，Unsafe 对象不能直接调用，只能通过**反射**获得

    public class TestUnsafe {
        public static void main(String[] args) throws NoSuchFieldException, IllegalAccessException {
            Field theUnsafe = Unsafe.class.getDeclaredField("theUnsafe");
            theUnsafe.setAccessible(true);
            Unsafe unsafe = (Unsafe) theUnsafe.get(null);
            System.out.println(unsafe);
        }
    }


### 9-2 Unsafe CAS 操作

```java
public class TestUnsafe {
    public static void main(String[] args) throws NoSuchFieldException, IllegalAccessException {
        Field theUnsafe = Unsafe.class.getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        Unsafe unsafe = (Unsafe) theUnsafe.get(null);

        System.out.println(unsafe);

        //1.获取域的偏移地址
        long idOffset = unsafe.objectFieldOffset(Teacher.class.getDeclaredField("id"));
        long nameOffset = unsafe.objectFieldOffset(Teacher.class.getDeclaredField("name"));
        //2.执行 cas 操作
        Teacher t = new Teacher();
        unsafe.compareAndSwapInt(t, idOffset, 0, 2);
        unsafe.compareAndSwapObject(t, nameOffset, null, "xpp");
        System.out.println(t.getId() + "---->" + t.getName());
    }
}

@Data
class Teacher {
    volatile int id;
    volatile String name;
}
//输出
sun.misc.Unsafe@103dbd3
2---->xpp
```



ReentrantLock原理
===============

1.非公平锁实现原理先从构造器开始看，默认为非公平锁实现：
----------

    //默认非公平锁
    public ReentrantLock() {
        sync = new NonfairSync();
    }


`NonfairSync` 继承自 `AQS`。

没有竞争时：

![](https://img-blog.csdnimg.cn/img_convert/2cf7fd758f1a8607f4cd120bbf83e31c.png)

第一个竞争出现时：

![](https://img-blog.csdnimg.cn/img_convert/3dee414f14963efbcbfab6383d77371b.png)

Thread-1 执行了：

1.  `CAS` 尝试将 state 由 0 改为 1，结果失败
2.  进入 `tryAcquire` 逻辑，这时 state 已经是1，结果仍然失败
3.  接下来进入 `addWaiter` 逻辑，构造 Node 队列
    *   图中黄色三角表示该 Node 的 waitStatus 状态，其中 `0` 为默认正常状态
    *   Node 的创建是懒惰的
    *   其中第一个 Node 称为 Dummy（哑元）或哨兵，用来占位，并不关联线程

![](https://img-blog.csdnimg.cn/img_convert/c77210a258a2c320377c36601121c1f7.png)

当前线程进入 `acquireQueued` 逻辑：

1.  acquireQueued 会在一个死循环中不断尝试获得锁，失败后进入 `park` 阻塞
    
2.  如果自己是紧邻着 head（排第二位），那么再次 `tryAcquire` 尝试获取锁，当然这时 state 仍为 1，失败
    
3.  进入 `shouldParkAfterFailedAcquire` 逻辑，将前驱 node，即 head 的 waitStatus 改为 -1，这次返回 false
    
    ![](https://img-blog.csdnimg.cn/img_convert/a7006d0df6567fe26ecdd28421c04ee3.png)
    
4.  shouldParkAfterFailedAcquire 执行完毕回到 acquireQueued ，再次 tryAcquire 尝试获取锁，当然这时 state 仍为 1，失败
    
5.  当再次进入 shouldParkAfterFailedAcquire 时，这时因为其前驱 node 的 waitStatus 已经是 `-1`，这次返回 true
    
6.  进入 `parkAndCheckInterrupt`， Thread-1 park（灰色表示）
    

![](https://img-blog.csdnimg.cn/img_convert/87a1d504551f8ad184364426dc484d85.png)

再次有多个线程经历上述过程竞争失败，变成这个样子：

![](https://img-blog.csdnimg.cn/img_convert/43cdaaeb2ddad517242b7a427c608000.png)

Thread-0 释放锁，进入 `tryRelease` 流程，如果成功：

*   设置 `exclusiveOwnerThread` 为 null
*   state = 0

![](https://img-blog.csdnimg.cn/img_convert/879d3c95b3afd5deb0c28a12770f27b1.png)

当前队列不为 null，并且 head 的 `waitStatus = -1`，进入 `unparkSuccessor` 流程。

找到队列中离 head 最近的一个 Node（没取消的），`unpark` 恢复其运行，本例中即为 Thread-1

回到 Thread-1 的 `acquireQueued` 流程

![](https://img-blog.csdnimg.cn/img_convert/2f198b0f7c77b4d2fa7a94ffada920f5.png)

如果加锁成功（没有竞争），会设置：

*   exclusiveOwnerThread 为 Thread-1，state = 1
*   head 指向刚刚 Thread-1 所在的 Node，该 Node 清空 Thread
*   原本的 head 因为从链表断开，而可被垃圾回收

如果这时候有其它线程来竞争（非公平的体现），例如这时有 Thread-4 来了

![](https://img-blog.csdnimg.cn/img_convert/9a7b9ee4c8658089c07a2df263ace5f2.png)

如果不巧又被 Thread-4 占了先

*   Thread-4 被设置为 exclusiveOwnerThread，state = 1
*   Thread-1 再次进入 acquireQueued 流程，获取锁失败，重新进入 park 阻塞

2.可重入原理
-------

这里以非公平锁为例：

获取锁：

    // ReentrantLock.Sync.nonfairTryAcquire()
    final boolean nonfairTryAcquire(int acquires) {
        //获取当前线程
        final Thread current = Thread.currentThread();
        //获取状态值
        int c = getState();
        if (c == 0) {
            //如果状态变量为0，再次尝试CAS更新状态变量的值
            //相对于公平锁模式少了!hasQueuedPredecessors()条件
            if (compareAndSetState(0, acquires)) {
                setExclusiveOwnerThread(current);
                return true;
            }
        }
        // 如果已经获得了锁, 线程还是当前线程, 表示发生了锁重入
        else if (current == getExclusiveOwnerThread()) {
            //state++
            int nextc = c + acquires;
            if (nextc < 0) // overflow
                throw new Error("Maximum lock count exceeded");
            setState(nextc);
            return true;
        }
        return false;
    }


释放锁：

    //ReentrantLock.Sync.tryRelease
    protected final boolean tryRelease(int releases) {
        //state--
        int c = getState() - releases;
        // 如果当前线程不是占有着锁的线程，抛出异常
        if (Thread.currentThread() != getExclusiveOwnerThread())
            throw new IllegalMonitorStateException();
        boolean free = false;
        //如果状态变量的值为0了，说明完全释放了锁
        //这也就是为什么重入锁调用了多少次lock()就要调用多少次unlock()的原因
        //如果不这样做，会导致锁不会完全释放，别的线程永远无法获取到锁
        if (c == 0) {
            free = true;
            // 清空占有线程
            setExclusiveOwnerThread(null);
        }
        //设置状态变量的值
        setState(c);
        return free;
    }


可以看出源码中通过`state`变量的计数来实现可重入，只有当`state==0`时才说明已经不持有锁。

3.可打断原理
-------

### 3.1 不可打断模式

在此模式下，即使它被打断，仍会驻留在 [AQS](https://so.csdn.net/so/search?q=AQS&spm=1001.2101.3001.7020) 队列中，一直要等到获得锁后方能得知自己被打断了。

    //AbstractQueuedSynchronizer.acquireQueued()
    final boolean acquireQueued(final Node node, int arg) {
        //失败标记
        boolean failed = true;
        try {
            //中断标记
            boolean interrupted = false;
            //自旋
            for (;;) {
                //当前节点的前一个节点
                final Node p = node.predecessor();
                //如果当前节点的前一个节点为head节点，则说明轮到自己获取锁了
                //调用ReentrantLock.FairSync.tryAcquire()方法再次尝试获取锁
                if (p == head && tryAcquire(arg)) {
                    //尝试获取锁成功
                    //这里同时只会有一个线程在执行，所以不需要用CAS更新
                    //把当前节点设置为新的头节点
                    setHead(node);
                    //并把上一个节点从链表中删除
                    p.next = null; // help GC
                    //标记为未失败
                    failed = false;
                    //还是需要获得锁后, 才能返回打断状态
                    return interrupted;
                }
                //是否需要阻塞
                if (shouldParkAfterFailedAcquire(p, node) &&
                    //真正阻塞的方法
                    parkAndCheckInterrupt())
                    // 如果是因为 interrupt 被唤醒, 返回打断状态为 true
                    interrupted = true;
            }
        } finally {
            //如果失败了
            if (failed)
                cancelAcquire(node);
        }
    }


    //AbstractQueuedSynchronizer.parkAndCheckInterrupt()
    private final boolean parkAndCheckInterrupt() {
        //如果打断标记已经是 true, 则 park 会失效
        LockSupport.park(this);
        //interrupted 会清除打断标记
        //清除打断标记，下次park就不会受到影响
        return Thread.interrupted();
    }


    public final void acquire(int arg) {
        if (
            !tryAcquire(arg) &&
            acquireQueued(addWaiter(Node.EXCLUSIVE), arg)
        ) {
            // 如果打断状态为 true，acquireQueued方法就会返回成功。就会执行这个方法
            selfInterrupt();
        }
    }
    static void selfInterrupt() {
        // 重新产生一次中断
        Thread.currentThread().interrupt();
    }


### 3.2 可打断模式

与不可打断模式不同的是，当被`interrupt`时是会抛出异常的，不会继续执行for循环。此时等待的线程可以停止等待。

    //ReentrantLock.lockInterruptibly()
    public void lockInterruptibly() throws InterruptedException {
        sync.acquireInterruptibly(1);
    }
    //AbstractQueuedSynchronizer.acquireInterruptibly(int arg)
    public final void acquireInterruptibly(int arg)
            throws InterruptedException {
        if (Thread.interrupted())
            throw new InterruptedException();
        //如果没有获得到锁，进入doAcquireInterruptibly方法
        if (!tryAcquire(arg))
            doAcquireInterruptibly(arg);
    }
    private void doAcquireInterruptibly(int arg)
            throws InterruptedException {
        final Node node = addWaiter(Node.EXCLUSIVE);
        boolean failed = true;
        try {
            for (; ; ) {
                final Node p = node.predecessor();
                if (p == head && tryAcquire(arg)) {
                    setHead(node);
                    p.next = null; // help GC
                    failed = false;
                    return;
                }
                if (shouldParkAfterFailedAcquire(p, node) &&
                        parkAndCheckInterrupt())
                    //在park过程中如果被interrupt会进入这里
                    //这时候抛出一次，而不会再次进入for循环
                    throw new InterruptedException();
            }
        } finally {
            if (failed)
                cancelAcquire(node);
        }
    }


4.公平锁实现原理
---------

    //ReentrantLock.FairSync.lock()
    final void lock() {
        //调用AQS的acquire()方法获取锁
        //注意，这里传的值为1
        acquire(1);
    }


    //AbstractQueuedSynchronizer.acquire()
    public final void acquire(int arg) {
        //先尝试加锁
        //如果失败了，就排队
        if (!tryAcquire(arg) &&
                //注意addWaiter()这里传入的节点模式为“独占模式”
            acquireQueued(addWaiter(Node.EXCLUSIVE), arg))
            selfInterrupt();
    }


    //ReentrantLock.FairSync.tryAcquire()
    //与非公平锁主要区别在于 tryAcquire 方法的实现
    protected final boolean tryAcquire(int acquires) {
        //获取当前线程
        final Thread current = Thread.currentThread();
        //获取当前状态变量的值
        int c = getState();
        //如果为0，说明现在还没有人占有锁
        if (c == 0) {
            //先检查 AQS 队列中是否有前驱节点, 没有才去竞争
            //如果没有其他线程在排队，那么当前线程尝试更新state的值为1
            //如果成功了，说明当前线程获取了锁
            if (!hasQueuedPredecessors() &&
                compareAndSetState(0, acquires)) {
                //当前线程获取了锁，把自己设置到exclusiveOwnerThread中
                //exclusiveOwnerThread是AQS的父类AbstractOwnableSynchronizer中提供的变量
                setExclusiveOwnerThread(current);
                //返回true，说明成功获得了锁
                return true;
            }
        }
        //如果当前线程本身就占有锁，现在又尝试获取锁
        //那么，直接让他获取锁，并返回true
        else if (current == getExclusiveOwnerThread()) {
            //状态变量state的值加一
            int nextc = c + acquires;
            //如果发送一出，则报错
            if (nextc < 0)
                throw new Error("Maximum lock count exceeded");
            //这里为什么不需要CAS更新state？
            //因为当前线程占有锁，其他线程只会CAS把state从0更新到1，是不会成功的
            //所以不存在竞争，自然不需要使用CAS来更新
            setState(nextc);
            //当线程获取锁成功
            return true;
        }
        //当线程获取锁失败
        return false;
    }


    public final boolean hasQueuedPredecessors() {
        //尾部
        Node t = tail;
        //头部
        Node h = head;
        Node s;
        // h != t 时表示队列中有 Node
        return h != t &&
                // (s = h.next) == null 表示队列中还有没有老二
                ((s = h.ext) == null ||
                        // 或者队列中老二线程不是此线程
           
                        s.thread != Thread.currentThread());
    }


5.[条件变量](https://so.csdn.net/so/search?q=%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F&spm=1001.2101.3001.7020)实现原理
----------------------------------------------------------------------------------------------------------

每个条件变量其实就对应着一个等待队列，其实现类是 `ConditionObject`

### 5.1 await 流程

开始 Thread-0 持有锁，调用 `await`，进入 ConditionObject 的 `addConditionWaiter` 流程

创建新的 Node 状态为 -2（Node.CONDITION），关联 Thread-0，加入等待队列尾部

![](https://img-blog.csdnimg.cn/img_convert/64819ba7473a0756199bc0283ddff2a2.png)

接下来进入 AQS 的 `fullyRelease` 流程，释放同步器上的锁

![](https://img-blog.csdnimg.cn/img_convert/7e35155b6d5370c1e2c1cef1c284720a.png)

unpark AQS 队列中的下一个节点，竞争锁，假设没有其他竞争线程，那么 Thread-1 竞争成功

![](https://img-blog.csdnimg.cn/img_convert/cb1d38ee7270469628865a9cba0fa544.png)

park 阻塞 Thread-0

![](https://img-blog.csdnimg.cn/img_convert/97d9c3f21d1151547ac4d5440f0376e3.png)

### 5.2 signal 流程

假设 Thread-1 调用`signal`要来唤醒 Thread-0

![](https://img-blog.csdnimg.cn/img_convert/a6052eef6c65ea36ba3fb475d162aa6b.png)

进入 ConditionObject 的 `doSignal` 流程，取得等待队列中第一个 Node，即 Thread-0 所在 Node

![](https://img-blog.csdnimg.cn/img_convert/9496487855165a975e38a4de450f65ae.png)

执行 `transferForSignal` 流程，将该 Node 加入 AQS 队列尾部，将 Thread-0 的 waitStatus 改为 0，Thread-3 的 waitStatus 改为 -1

（**waitStatus == 0 默认状态，waitStatus == -1 表示当前node如果是head节点时，释放锁之后需要唤醒它的后继节点**）

![](https://img-blog.csdnimg.cn/img_convert/b93872a8ee19579c0620f62c362224fc.png)

Thread-1 释放锁，进入 unlock 流程，略



[读写锁](https://so.csdn.net/so/search?q=%E8%AF%BB%E5%86%99%E9%94%81&spm=1001.2101.3001.7020)
==========================================================================================

1.ReentrantReadWriteLock
------------------------

### 1.1 概述

当读操作远远高于写操作时，这时候使用读写锁 让 `读-读` 可以并发，提高性能。 类似于数据库中的 `select ... from ... lock in share mode`

栗子：

提供一个数据容器类，内部分别使用读锁保护数据的 read() 方法，写锁保护数据的 write() 方法

    @Slf4j
    class Datacontainer {
        private Object data;
        private ReentrantReadWriteLock rw = new ReentrantReadWriteLock();
        private ReentrantReadWriteLock.ReadLock r = rw.readLock();
        private ReentrantReadWriteLock.WriteLock w = rw.writeLock();
    
        public Object read() {
            r.lock();
            log.debug("获取读锁..");
            try {
                log.debug("读取");
                Sleeper.sleep(1);
                return data;
            } finally {
                log.debug("释放读锁...");
                r.unlock();
            }
        }
    
        public void write() {
            w.lock();
            log.debug("获取写锁...");
            try {
                log.debug("写入");
                Sleeper.sleep(1);
            } finally {
                log.debug("释放写锁...");
                w.unlock();
            }
        }
    }


测试 `读锁-读锁` 可以并发：

    public class TestReadWriteLock {
        public static void main(String[] args) {
            Datacontainer datacontainer = new Datacontainer();
            new Thread(() -> {
                datacontainer.read();
            }, "t1").start();
            new Thread(() -> {
                datacontainer.read();
            }, "t2").start();
        }
    }


输出结果，从这里可以看到 Thread-0 锁定期间，Thread-1 的读操作不受影响：

![](https://img-blog.csdnimg.cn/img_convert/0fdf95b57696d9f91905c2e96136dcf4.png)

测试 `读锁-写锁` 相互阻塞：

    @Slf4j
    public class TestReadWriteLock {
        public static void main(String[] args) throws InterruptedException {
            Datacontainer datacontainer = new Datacontainer();
            new Thread(() -> {
                datacontainer.read();
            }, "t1").start();
            Thread.sleep(100);
            new Thread(() -> {
                datacontainer.write();
            }, "t2").start();
        }
    }


结果：

![](https://img-blog.csdnimg.cn/img_convert/887d8f7fae432d8a59ec362def56b20f.png)

> **注意：**
>
> *   读锁不支持条件变量
> *   重入时升级不支持：即持有读锁的情况下去获取写锁，会导致获取写锁永久等待
> *   重入时降级支持：即持有写锁的情况下去获取读锁

看一个重入降级获得锁栗子：

    class CachedData {
        Object data;
        // 是否有效，如果失效，需要重新计算 data
        volatile boolean cacheValid;
        final ReentrantReadWriteLock rwl = new ReentrantReadWriteLock();
        void processCachedData() {
            rwl.readLock().lock();
            if (!cacheValid) {
                // 获取写锁前必须释放读锁
                rwl.readLock().unlock();
                rwl.writeLock().lock();
                try {
                    // 判断是否有其它线程已经获取了写锁、更新了缓存, 避免重复更新
                    if (!cacheValid) {
                        data = ...
                            cacheValid = true;
                    }
                    // 降级为读锁, 释放写锁, 这样能够让其它线程读取缓存
                    rwl.readLock().lock();
                } finally {
                    rwl.writeLock().unlock();
                }
            }
            // 自己用完数据, 释放读锁 
            try {
                use(data);
            } finally {
                rwl.readLock().unlock();
            }
        }
    }


### 1.2 原理演示

读写锁用的是同一个 Sycn 同步器，因此等待队列、state 等也是同一个。

#### t1 w.lock，t2 r.lock

1） t1 成功上锁，流程与 ReentrantLock 加锁相比没有特殊之处，不同是**写锁状态占了 state 的低 16 位，而读锁使用的是 state 的高 16 位**

![](https://img-blog.csdnimg.cn/img_convert/481ebcca94c7f6495512490c91523a9f.png)

2）t2 执行 r.`lock`，这时进入读锁的 sync.`acquireShared`(1) 流程，首先会进入 `tryAcquireShared` 流程。如果有写锁占据，那么 tryAcquireShared 返回 -1 表示失败

> tryAcquireShared 返回值表示：
>
> *   \-1 表示失败
> *   0 表示成功
> *   正数表示成功（而且数值是还有几个后继节点需要唤醒，读写锁返回1）

![](https://img-blog.csdnimg.cn/img_convert/2df9cd299203ab789966ff191a76cb9f.png)

3）这时会进入 sync.`doAcquireShared`(1) 流程，首先也是调用 `addWaiter` 添加节点，不同之处在于节点被设置为 `Node.SHARED` 模式而非 Node.EXCLUSIVE 模式，注意此时 t2 仍处于活跃状态

![](https://img-blog.csdnimg.cn/img_convert/b8f7865b3301484710f2d605e6407af2.png)

4）t2 会看看自己的节点是不是老二，如果是，还会再次调用 `tryAcquireShared`(1) 来尝试获取锁

5）如果没有成功，在 doAcquireShared 内 `for (;;)` 循环一次，把前驱节点的 waitStatus 改为 -1，再 for (;😉 循环一 次尝试 tryAcquireShared(1) 如果还不成功，那么在 `parkAndCheckInterrupt`() 处 park

![](https://img-blog.csdnimg.cn/img_convert/62cc6d372b363dc5cb9a0b5746543b43.png)

#### t3 r.lock，t4 w.lock

这种状态下，假设又有 t3 加读锁和 t4 加写锁，这期间 t1 仍然持有锁，就变成了下面的样子

![](https://img-blog.csdnimg.cn/img_convert/bae74395ae2c14faa59f85e1628ad490.png)

#### t1 w.unlock

这时会走到写锁的 sync.`release`(1) 流程，调用 sync.`tryRelease`(1) 成功，变成下面的样子

![](https://img-blog.csdnimg.cn/img_convert/264910b419ea53fc24a0f706881126f4.png)

接下来执行唤醒流程 sync.`unparkSuccessor`，即让老二恢复运行，这时 t2 在 `doAcquireShared` 内 `parkAndCheckInterrupt` 处恢复运行 这回再来一次 `for (;;)` 执行 `tryAcquireShared` 成功则让读锁计数加一

![](https://img-blog.csdnimg.cn/img_convert/107f4c102050227bd3aa3c540e041eb3.png)

这时 t2 已经恢复运行，接下来 t2 调用 `setHeadAndPropagate`(node, 1)，它原本所在节点被置为头节点

![](https://img-blog.csdnimg.cn/img_convert/0a3709af03b1bd0cf7596910711c1ad1.png)

事情还没完，在 `setHeadAndPropagate` 方法内还会检查下一个节点是否是 `shared`，如果是则调用 `doReleaseShared`() 将 head 的状态从 -1 改为 0 并唤醒老二，这时 t3 在 `doAcquireShared` 内 `parkAndCheckInterrupt`处恢复运行

![](https://img-blog.csdnimg.cn/img_convert/991f6f80457d95d236c9eb106917649a.png)

这回再来一次 `for (;;)` 执行 `tryAcquireShared` 成功则让读锁计数加一

![](https://img-blog.csdnimg.cn/img_convert/98e2a30ae43c214d84e29722a9a2924d.png)

这时 t3 已经恢复运行，接下来 t3 调用 `setHeadAndPropagate`(node, 1)，它原本所在节点被置为头节点

![](https://img-blog.csdnimg.cn/img_convert/ecb0ac3bc54e9a38caeea7a572a965c2.png)

下一个节点不是 `shared` 了，因此不会继续唤醒 t4 所在节点

#### t2 r.unlock，t3 r.unlock

t2 进入 sync.`releaseShared`(1) 中，调用 `tryReleaseShared`(1) 让计数减一，但由于计数还不为零

![](https://img-blog.csdnimg.cn/img_convert/85b8353af5634066930135d2ca922098.png)

t3 进入 sync.`releaseShared`(1) 中，调用 `tryReleaseShared`(1) 让计数减一，这回计数为零了，进入 `doReleaseShared`() 将头节点从 -1 改为 0 并唤醒老二，即

![](https://img-blog.csdnimg.cn/img_convert/ace5f84a3eb33c01c50b03920b42498f.png)

之后 t4 在 `acquireQueued` 中 `parkAndCheckInterrupt` 处恢复运行，再次 `for (;;)` 这次自己是老二，并且没有其他竞争，`tryAcquire`(1) 成功，修改头结点，流程结束

![](https://img-blog.csdnimg.cn/img_convert/dc7ac318785511e384b0e749b9b3e434.png)

2.StampedLock
-------------

### 2.1 概述

该类自 JDK 8 加入，是为了进一步优化读性能，它的特点是在使用读锁、写锁时都必须配合【戳】使用

加解读锁：

    long stamp = lock.readLock();
    lock.unlockRead(stamp);


加解写锁：

    long stamp = lock.writeLock();
    lock.unlockWrite(stamp);


**乐观读**：`StampedLock` 支持 `tryOptimisticRead()` 方法（乐观读），读取完毕后需要做一次戳校验如果校验通过，表示这期间确实没有写操作，数据可以安全使用，如果校验没通过，需要重新获取读锁，保证[数据安全](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%AE%89%E5%85%A8&spm=1001.2101.3001.7020)。

    long stamp = lock.tryOptimisticRead();
    // 验戳
    if(!lock.validate(stamp)){
     // 锁升级
    }


### 2.2 例子

提供一个 数据容器类 内部分别使用读锁保护数据的 read() 方法，写锁保护数据的 write() 方法：

    @Slf4j
    class DataContainerStamper {
        private int data;
        private final StampedLock lock = new StampedLock();
    
        public DataContainerStamper(int data) {
            this.data = data;
        }
    
        public int read(int readTime) {
            //乐观读
            long stamp = lock.tryOptimisticRead();
            log.debug("optimistic read lockuing ... {}", stamp);
            //模拟读取时间
            Sleeper.sleep(readTime);
            //校验戳，通过直接返回
            if (lock.validate(stamp)) {
                log.debug("read finish... {}", stamp);
                return data;
            }
            //锁的升级->读锁
            log.debug("updating to read lock... {}", stamp);
            try {
                //获取读锁
                stamp = lock.readLock();
                log.debug("read lock {}", stamp);
                Sleeper.sleep(readTime);
                log.debug("read finish... {}", stamp);
                return data;
            } finally {
                log.debug("read unlock {}", stamp);
                //释放读锁
                lock.unlockRead(stamp);
            }
    
        }
    
        public void write(int newData) {
            //加写锁
            long stamp = lock.writeLock();
            log.debug("write lock {}", stamp);
            try {
                Sleeper.sleep(2);
                this.data = newData;
            } finally {
                log.debug("write unlock {}", stamp);
                //释放写锁，需要传入戳
                lock.unlockWrite(stamp);
            }
        }
    }


测试 `读-读` 可以优化：

    public class TestStampedLock {
        public static void main(String[] args) {
            DataContainerStamper dataContainer = new DataContainerStamper(1);
            new Thread(() -> {
                dataContainer.read(1);
            }, "t1").start();
            Sleeper.sleep(0.5);
            new Thread(() -> {
                dataContainer.read(0);
            }, "t2").start();
        }
    }


输出结果，可以看到实际没有加读锁：

![](https://img-blog.csdnimg.cn/img_convert/0656b6b6f00dc88ad7991a2f3ca3036f.png)

测试 `读-写` 时优化读补加读锁：

    public class TestStampedLock {
        public static void main(String[] args) {
            DataContainerStamper dataContainer = new DataContainerStamper(1);
            new Thread(() -> {
                dataContainer.read(1);
            }, "t1").start();
            Sleeper.sleep(0.5);
            new Thread(() -> {
                dataContainer.write(0);
            }, "t2").start();
        }
    }


输出结果：

![](https://img-blog.csdnimg.cn/img_convert/20fb96b9498beccfda9ef586f966ad3f.png)

> **注意：**
>
> *   StampedLock 不支持条件变量
> *   StampedLock 不支持可重入
