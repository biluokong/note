一、前言
====

1、什么是 JVM ？
-----------

1）定义  
Java [Virtual](https://so.csdn.net/so/search?q=Virtual&spm=1001.2101.3001.7020) Machine ，Java 程序的**运行环境**（Java 二进制字节码的运行环境）。  
2）好处

*   一次编译，处处执行
*   自动的内存管理，垃圾回收机制
*   数组下标越界检查

3）比较  
JVM、JRE、JDK 的关系如下图所示  
![](https://img-blog.csdnimg.cn/20210207154634171.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

2、学习 JVM 有什么用？
--------------

*   面试必备
*   中高级程序员必备
*   想走的长远，就需要懂原理，比如：自动装箱、自动拆箱是怎么实现的，反射是怎么实现的，垃圾回收机制是怎么回事等待，JVM 是必须掌握的。

3、常见的 JVM
---------

![](https://img-blog.csdnimg.cn/20210207155653261.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
我们主要学习的是 HotSpot 版本的虚拟机。

4、学习路线
------

![](https://img-blog.csdnimg.cn/20210207155820178.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
ClassLoader：Java 代码编译成二进制后，会经过类加载器，这样才能加载到 JVM 中运行。  
Method Area：类是放在方法区中。  
Heap：类的实例对象。  
当类调用方法时，会用到 JVM Stack、PC Register、本地方法栈。  
方法执行时的每行代码是有执行引擎中的解释器逐行执行，方法中的热点代码频繁调用的方法，由 JIT 编译器优化后执行，GC 会对堆中不用的对象进行回收。需要和操作系统打交道就需要使用到本地方法接口。

二、内存结构
======

1、程序计数器
-------

### 1）定义

Program Counter Register 程序计数器（寄存器）  
作用：是记录下一条 jvm 指令的执行地址行号。  
特点：

*   是线程私有的
*   不会存在内存溢出

### 2）作用

    0: getstatic #20 // PrintStream out = System.out; 
    3: astore_1 // -- 
    4: aload_1 // out.println(1); 
    5: iconst_1 // -- 
    6: invokevirtual #26 // -- 
    9: aload_1 // out.println(2); 
    10: iconst_2 // -- 
    11: invokevirtual #26 // -- 
    14: aload_1 // out.println(3); 
    15: iconst_3 // -- 
    16: invokevirtual #26 // -- 
    19: aload_1 // out.println(4); 
    20: iconst_4 // -- 
    21: invokevirtual #26 // -- 
    24: aload_1 // out.println(5); 
    25: iconst_5 // -- 
    26: invokevirtual #26 // -- 
    29: return


*   解释器会解释指令为机器码交给 cpu 执行，程序计数器会记录下一条指令的地址行号，这样下一次解释器会从程序计数器拿到指令然后进行解释执行。
*   多线程的环境下，如果两个线程发生了上下文切换，那么程序计数器会记录线程下一行指令的地址行号，以便于接着往下执行。

2、虚拟机栈
------

### 1）定义

*   每个线程运行需要的内存空间，称为虚拟机栈
*   每个栈由多个栈帧（Frame）组成，对应着每次调用方法时所占用的内存
*   每个线程只能有一个活动栈帧，对应着当前正在执行的方法

问题辨析：

1.  垃圾回收是否涉及栈内存？  
    不会。栈内存是方法调用产生的，方法调用结束后会弹出栈。
2.  栈内存分配越大越好吗？  
    不是。因为物理内存是一定的，栈内存越大，可以支持更多的递归调用，但是可执行的线程数就会越少。
3.  方法呢的局部变量是否线程安全
    *   如果方法内部的变量没有逃离方法的作用访问，它是线程安全的
    *   如果是局部变量引用了对象，并逃离了方法的访问，那就要考虑线程安全问题。

### 2）栈内存溢出

栈帧过大、过多、或者第三方类库操作，都有可能造成栈内存溢出 java.lang.stackOverflowError ，使用 -Xss256k 指定栈内存大小！

### 3）线程运行诊断

案例一：cpu 占用过多  
解决方法：Linux 环境下运行某些程序的时候，可能导致 CPU 的占用过高，这时需要定位占用 CPU 过高的线程

*   top 命令，查看是哪个进程占用 CPU 过高
*   ps H -eo pid, tid（线程id）, %cpu | grep 刚才通过 top 查到的进程号 通过 ps 命令进一步查看是哪个线程占用 CPU 过高
*   jstack 进程 id 通过查看进程中的线程的 nid ，刚才通过 ps 命令看到的 tid 来对比定位，注意 jstack 查找出的线程 id 是 16 进制的，需要转换。

3、本地方法栈
-------

一些带有 native 关键字的方法就是需要 JAVA 去调用本地的C或者C++方法，因为 JAVA 有时候没法直接和操作系统底层交互，所以需要用到本地方法栈，服务于带 native 关键字的方法。

4、堆
---

### 1）定义

Heap 堆

*   通过new关键字创建的对象都会被放在堆内存

特点

*   它是线程共享，堆内存中的对象都需要考虑线程安全问题
*   有垃圾回收机制

### 2）堆内存溢出

java.lang.OutofMemoryError ：java heap space. 堆内存溢出  
可以使用 -Xmx8m 来指定堆内存大小。

### 3）堆内存诊断

1.  jps 工具  
    查看当前系统中有哪些 java 进程
2.  jmap 工具  
    查看堆内存占用情况 jmap - heap 进程id
3.  jconsole 工具  
    图形界面的，多功能的监测工具，可以连续监测
4.  jvisualvm 工具

5、方法区
-----

### 1）定义

Java 虚拟机有一个在所有 Java 虚拟机线程之间共享的方法区域。方法区域类似于用于传统语言的编译代码的存储区域，或者类似于操作系统进程中的“文本”段。它存储每个类的结构，例如运行时常量池、字段和方法数据，以及方法和构造函数的代码，包括特殊方法，用于类和实例初始化以及接口初始化方法区域是在虚拟机启动时创建的。尽管方法区域在逻辑上是堆的一部分，但简单的实现可能不会选择垃圾收集或压缩它。此规范不强制指定方法区的位置或用于管理已编译代码的策略。方法区域可以具有固定的大小，或者可以根据计算的需要进行扩展，并且如果不需要更大的方法区域，则可以收缩。方法区域的内存不需要是连续的！

### 2）组成

Hotspot 虚拟机 jdk1.6 1.7 1.8 内存结构图  
![](https://img-blog.csdnimg.cn/20210208112903305.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

### 3）方法区内存溢出

*   1.8 之前会导致永久代内存溢出
    *   使用 -XX:MaxPermSize=8m 指定永久代内存大小
*   1.8 之后会导致元空间内存溢出
    *   使用 -XX:MaxMetaspaceSize=8m 指定元空间大小

### 4）运行时常量池

二进制字节码包含（类的基本信息，常量池，类方法定义，包含了虚拟机的指令）  
首先看看常量池是什么，编译如下代码：

    public class Test {
    
        public static void main(String[] args) {
            System.out.println("Hello World!");
        }
    
    }


​    

然后使用 javap -v Test.class 命令反编译查看结果。  
![](https://img-blog.csdnimg.cn/20210208124448238.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
每条指令都会对应常量池表中一个地址，常量池表中的地址可能对应着一个类名、方法名、参数类型等信息。  
![](https://img-blog.csdnimg.cn/20210208124525875.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**常量池**：  
就是一张表，虚拟机指令根据这张常量表找到要执行的类名、方法名、参数类型、字面量信息  
**运行时常量池**：  
常量池是 \*.class 文件中的，当该类被加载以后，它的常量池信息就会放入运行时常量池，并把里面的符号地址变为真实地址

### 5）StringTable

*   常量池中的字符串仅是符号，只有在被用到时才会转化为对象
*   利用串池的机制，来避免重复创建字符串对象
*   字符串变量拼接的原理是StringBuilder
*   字符串常量拼接的原理是编译器优化
*   可以使用intern方法，主动将串池中还没有的字符串对象放入串池中

**intern方法 1.8**  
调用字符串对象的 intern 方法，会将该字符串对象尝试放入到串池中

*   如果串池中没有该字符串对象，则放入成功
*   如果有该字符串对象，则放入失败  
    无论放入是否成功，都会返回串池中的字符串对象

注意：此时如果调用 intern 方法成功，堆内存与串池中的字符串对象是同一个对象；如果失败，则不是同一个对象

例1：

    public class Main {
    	public static void main(String[] args) {
    		// "a" "b" 被放入串池中，str 则存在于堆内存之中
    		String str = new String("a") + new String("b");
    		// 调用 str 的 intern 方法，这时串池中没有 "ab" ，则会将该字符串对象放入到串池中，此时堆内存与串池中的 "ab" 是同一个对象
    		String st2 = str.intern();
    		// 给 str3 赋值，因为此时串池中已有 "ab" ，则直接将串池中的内容返回
    		String str3 = "ab";
    		// 因为堆内存与串池中的 "ab" 是同一个对象，所以以下两条语句打印的都为 true
    		System.out.println(str == st2);
    		System.out.println(str == str3);
    	}
    }


例2：

    public class Main {
    	public static void main(String[] args) {
            // 此处创建字符串对象 "ab" ，因为串池中还没有 "ab" ，所以将其放入串池中
    		String str3 = "ab";
            // "a" "b" 被放入串池中，str 则存在于堆内存之中
    		String str = new String("a") + new String("b");
            // 此时因为在创建 str3 时，"ab" 已存在与串池中，所以放入失败，但是会返回串池中的 "ab" 
    		String str2 = str.intern();
            // false
    		System.out.println(str == str2);
            // false
    		System.out.println(str == str3);
            // true
    		System.out.println(str2 == str3);
    	}
    }


### 6）StringTable 的位置

jdk1.6 StringTable 位置是在永久代中，1.8 StringTable 位置是在堆中。

### 7）StringTable 垃圾回收

\-Xmx10m 指定堆内存大小  
\-XX:+PrintStringTableStatistics 打印字符串常量池信息  
\-XX:+PrintGCDetails  
\-verbose:gc 打印 gc 的次数，耗费时间等信息

    /**
     * 演示 StringTable 垃圾回收
     * -Xmx10m -XX:+PrintStringTableStatistics -XX:+PrintGCDetails -verbose:gc
     */
    public class Code_05_StringTableTest {
    
        public static void main(String[] args) {
            int i = 0;
            try {
                for(int j = 0; j < 10000; j++) { // j = 100, j = 10000
                    String.valueOf(j).intern();
                    i++;
                }
            }catch (Exception e) {
                e.printStackTrace();
            }finally {
                System.out.println(i);
            }
        }
    
    }


​    

### 8）StringTable 性能调优

*   因为StringTable是由HashTable实现的，所以可以适当增加HashTable桶的个数，来减少字符串放入串池所需要的时间

    -XX:StringTableSize=桶个数（最少设置为 1009 以上）
    
*   考虑是否需要将字符串对象入池  
    可以通过 intern 方法减少重复入池

6、直接内存
------

### 1）定义

Direct Memory

*   常见于 NIO 操作时，用于数据缓冲区
*   分配回收成本较高，但读写性能高
*   不受 JVM 内存回收管理

### 2）使用直接内存的好处

文件读写流程：  
![](https://img-blog.csdnimg.cn/20210208180041113.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
因为 java 不能直接操作文件管理，需要切换到内核态，使用本地方法进行操作，然后读取磁盘文件，会在系统内存中创建一个缓冲区，将数据读到系统缓冲区， 然后在将系统缓冲区数据，复制到 java 堆内存中。缺点是数据存储了两份，在系统内存中有一份，java 堆中有一份，造成了不必要的复制。

**使用了 DirectBuffer 文件读取流程**  
![](https://img-blog.csdnimg.cn/20210208181022863.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
直接内存是操作系统和 Java 代码都可以访问的一块区域，无需将代码从系统内存复制到 Java 堆内存，从而提高了效率。

### 3）直接内存回收原理

    public class Code_06_DirectMemoryTest {
    
        public static int _1GB = 1024 * 1024 * 1024;
    
        public static void main(String[] args) throws IOException, NoSuchFieldException, IllegalAccessException {
    //        method();
            method1();
        }
    
        // 演示 直接内存 是被 unsafe 创建与回收
        private static void method1() throws IOException, NoSuchFieldException, IllegalAccessException {
    
            Field field = Unsafe.class.getDeclaredField("theUnsafe");
            field.setAccessible(true);
            Unsafe unsafe = (Unsafe)field.get(Unsafe.class);
    
            long base = unsafe.allocateMemory(_1GB);
            unsafe.setMemory(base,_1GB, (byte)0);
            System.in.read();
    
            unsafe.freeMemory(base);
            System.in.read();
        }
    
        // 演示 直接内存被 释放
        private static void method() throws IOException {
            ByteBuffer byteBuffer = ByteBuffer.allocateDirect(_1GB);
            System.out.println("分配完毕");
            System.in.read();
            System.out.println("开始释放");
            byteBuffer = null;
            System.gc(); // 手动 gc
            System.in.read();
        }
    
    }


​    

直接内存的回收不是通过 JVM 的垃圾回收来释放的，而是通过unsafe.freeMemory 来手动释放。  
第一步：allocateDirect 的实现

    public static ByteBuffer allocateDirect(int capacity) {
        return new DirectByteBuffer(capacity);
    }


底层是创建了一个 DirectByteBuffer 对象。  
第二步：DirectByteBuffer 类

    DirectByteBuffer(int cap) {   // package-private
       
        super(-1, 0, cap, cap);
        boolean pa = VM.isDirectMemoryPageAligned();
        int ps = Bits.pageSize();
        long size = Math.max(1L, (long)cap + (pa ? ps : 0));
        Bits.reserveMemory(size, cap);
    
        long base = 0;
        try {
            base = unsafe.allocateMemory(size); // 申请内存
        } catch (OutOfMemoryError x) {
            Bits.unreserveMemory(size, cap);
            throw x;
        }
        unsafe.setMemory(base, size, (byte) 0);
        if (pa && (base % ps != 0)) {
            // Round up to page boundary
            address = base + ps - (base & (ps - 1));
        } else {
            address = base;
        }
        cleaner = Cleaner.create(this, new Deallocator(base, size, cap)); // 通过虚引用，来实现直接内存的释放，this为虚引用的实际对象, 第二个参数是一个回调，实现了 runnable 接口，run 方法中通过 unsafe 释放内存。
        att = null;
    }


这里调用了一个 Cleaner 的 create 方法，且后台线程还会对虚引用的对象监测，如果虚引用的实际对象（这里是 DirectByteBuffer ）被回收以后，就会调用 Cleaner 的 clean 方法，来清除直接内存中占用的内存。

     public void clean() {
            if (remove(this)) {
                try {
                // 都用函数的 run 方法, 释放内存
                    this.thunk.run();
                } catch (final Throwable var2) {
                    AccessController.doPrivileged(new PrivilegedAction<Void>() {
                        public Void run() {
                            if (System.err != null) {
                                (new Error("Cleaner terminated abnormally", var2)).printStackTrace();
                            }
    
                            System.exit(1);
                            return null;
                        }
                    });
                }
    
            }
        }


可以看到关键的一行代码， this.thunk.run()，thunk 是 Runnable 对象。run 方法就是回调 Deallocator 中的 run 方法，

    		public void run() {
                if (address == 0) {
                    // Paranoia
                    return;
                }
                // 释放内存
                unsafe.freeMemory(address);
                address = 0;
                Bits.unreserveMemory(size, capacity);
            }


**直接内存的回收机制总结**

*   使用了 Unsafe 类来完成直接内存的分配回收，回收需要主动调用freeMemory 方法
*   ByteBuffer 的实现内部使用了 Cleaner（虚引用）来检测 ByteBuffer 。一旦ByteBuffer 被垃圾回收，那么会由 ReferenceHandler（守护线程） 来调用 Cleaner 的 clean 方法调用 freeMemory 来释放内存

**注意：**

    /**
         * -XX:+DisableExplicitGC 显示的
         */
        private static void method() throws IOException {
            ByteBuffer byteBuffer = ByteBuffer.allocateDirect(_1GB);
            System.out.println("分配完毕");
            System.in.read();
            System.out.println("开始释放");
            byteBuffer = null;
            System.gc(); // 手动 gc 失效
            System.in.read();
        }


​    

一般用 jvm 调优时，会加上下面的参数：

    -XX:+DisableExplicitGC  // 静止显示的 GC


意思就是禁止我们手动的 GC，比如手动 System.gc() 无效，它是一种 full gc，会回收新生代、老年代，会造成程序执行的时间比较长。所以我们就通过 unsafe 对象调用 freeMemory 的方式释放内存。

三、[垃圾回收](https://so.csdn.net/so/search?q=%E5%9E%83%E5%9C%BE%E5%9B%9E%E6%94%B6&spm=1001.2101.3001.7020)
======================================================================================================

1、如果判断对象可以回收
------------

### 1）引用计数法

当一个对象被引用时，就当引用对象的值加一，当值为 0 时，就表示该对象不被引用，可以被垃圾收集器回收。  
这个引用计数法听起来不错，但是有一个弊端，如下图所示，循环引用时，两个对象的计数都为1，导致两个对象都无法被释放。![](https://img-blog.csdnimg.cn/20210208191757858.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

### 2）可达性分析算法

*   JVM 中的垃圾回收器通过可达性分析来探索所有存活的对象
*   扫描堆中的对象，看能否沿着 GC Root 对象为起点的引用链找到该对象，如果找不到，则表示可以回收
*   可以作为 GC Root 的对象
    *   虚拟机栈（栈帧中的本地变量表）中引用的对象。
    *   方法区中类静态属性引用的对象
    *   方法区中常量引用的对象
    *   本地方法栈中 JNI（即一般说的Native方法）引用的对象

    public static void main(String[] args) throws IOException {
    
            ArrayList<Object> list = new ArrayList<>();
            list.add("a");
            list.add("b");
            list.add(1);
            System.out.println(1);
            System.in.read();
        
            list = null;
            System.out.println(2);
            System.in.read();
            System.out.println("end");
        }
    
    

对于以上代码，可以使用如下命令将堆内存信息转储成一个文件，然后使用  
Eclipse Memory Analyzer 工具进行分析。  
第一步：  
使用 jps 命令，查看程序的进程  
![](https://img-blog.csdnimg.cn/20210209111015399.png)  
第二步：  
![](https://img-blog.csdnimg.cn/20210209111229838.png)  
使用 jmap -dump:format=b,live,file=1.bin 16104 命令转储文件  
dump：转储文件  
format=b：二进制文件  
file：文件名  
16104：进程的id  
第三步：打开 Eclipse Memory Analyzer 对 1.bin 文件进行分析。  
![](https://img-blog.csdnimg.cn/20210209111656952.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
分析的 gc root，找到了 ArrayList 对象，然后将 list 置为null，再次转储，那么 list 对象就会被回收。

### 3）四种引用

![](https://img-blog.csdnimg.cn/20210209113952135.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

1.  强引用  
    只有所有 GC Roots 对象都不通过【强引用】引用该对象，该对象才能被垃圾回收
2.  软引用（SoftReference）  
    仅有软引用引用该对象时，在垃圾回收后，内存仍不足时会再次出发垃圾回收，回收软引用对象  
    可以配合引用队列来释放软引用自身
3.  弱引用（WeakReference）  
    仅有弱引用引用该对象时，在垃圾回收时，无论内存是否充足，都会回收弱引用对象  
    可以配合引用队列来释放弱引用自身
4.  虚引用（PhantomReference）  
    必须配合引用队列使用，主要配合 ByteBuffer 使用，被引用对象回收时，会将虚引用入队，  
    由 Reference Handler 线程调用虚引用相关方法释放直接内存
5.  终结器引用（FinalReference）  
    无需手动编码，但其内部配合引用队列使用，在垃圾回收时，终结器引用入队（被引用对象暂时没有被回收），再由 Finalizer 线程通过终结器引用找到被引用对象并调用它的 finalize 方法，第二次 GC 时才能回收被引用对象。

**演示软引用**

    /**
     * 演示 软引用
     * -Xmx20m -XX:+PrintGCDetails -verbose:gc
     */
    public class Code_08_SoftReferenceTest {
    
        public static int _4MB = 4 * 1024 * 1024;
    
        public static void main(String[] args) throws IOException {
            method2();
        }
    
        // 设置 -Xmx20m , 演示堆内存不足,
        public static void method1() throws IOException {
            ArrayList<byte[]> list = new ArrayList<>();
    
            for(int i = 0; i < 5; i++) {
                list.add(new byte[_4MB]);
            }
            System.in.read();
        }
    
        // 演示 软引用
        public static void method2() throws IOException {
            ArrayList<SoftReference<byte[]>> list = new ArrayList<>();
            for(int i = 0; i < 5; i++) {
                SoftReference<byte[]> ref = new SoftReference<>(new byte[_4MB]);
                System.out.println(ref.get());
                list.add(ref);
                System.out.println(list.size());
            }
            System.out.println("循环结束：" + list.size());
            for(SoftReference<byte[]> ref : list) {
                System.out.println(ref.get());
            }
        }
    }


​    

method1 方法解析：  
首先会设置一个堆内存的大小为 20m，然后运行 mehtod1 方法，会抛异常，堆内存不足，因为 mehtod1 中的 list 都是强引用。  
![](https://img-blog.csdnimg.cn/20210209125537878.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
method2 方法解析：  
在 list 集合中存放了 软引用对象，当内存不足时，会触发 full gc，将软引用的对象回收。细节如图：  
![](https://img-blog.csdnimg.cn/20210209130334776.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
上面的代码中，当软引用引用的对象被回收了，但是软引用还存在，所以，一般软引用需要搭配一个引用队列一起使用。  
修改 method2 如下：

    // 演示 软引用 搭配引用队列
        public static void method3() throws IOException {
            ArrayList<SoftReference<byte[]>> list = new ArrayList<>();
            // 引用队列
            ReferenceQueue<byte[]> queue = new ReferenceQueue<>();
    
            for(int i = 0; i < 5; i++) {
                // 关联了引用队列，当软引用所关联的 byte[] 被回收时，软引用自己会加入到 queue 中去
                SoftReference<byte[]> ref = new SoftReference<>(new byte[_4MB], queue);
                System.out.println(ref.get());
                list.add(ref);
                System.out.println(list.size());
            }
    
            // 从队列中获取无用的 软引用对象，并移除
            Reference<? extends byte[]> poll = queue.poll();
            while(poll != null) {
                list.remove(poll);
                poll = queue.poll();
            }
    
            System.out.println("=====================");
            for(SoftReference<byte[]> ref : list) {
                System.out.println(ref.get());
            }
        }


![](https://img-blog.csdnimg.cn/20210209140627985.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**弱引用演示**

    public class Code_09_WeakReferenceTest {
    
        public static void main(String[] args) {
    //        method1();
            method2();
        }
    
        public static int _4MB = 4 * 1024 *1024;
    
        // 演示 弱引用
        public static void method1() {
            List<WeakReference<byte[]>> list = new ArrayList<>();
            for(int i = 0; i < 10; i++) {
                WeakReference<byte[]> weakReference = new WeakReference<>(new byte[_4MB]);
                list.add(weakReference);
    
                for(WeakReference<byte[]> wake : list) {
                    System.out.print(wake.get() + ",");
                }
                System.out.println();
            }
        }
    
        // 演示 弱引用搭配 引用队列
        public static void method2() {
            List<WeakReference<byte[]>> list = new ArrayList<>();
            ReferenceQueue<byte[]> queue = new ReferenceQueue<>();
    
            for(int i = 0; i < 9; i++) {
                WeakReference<byte[]> weakReference = new WeakReference<>(new byte[_4MB], queue);
                list.add(weakReference);
                for(WeakReference<byte[]> wake : list) {
                    System.out.print(wake.get() + ",");
                }
                System.out.println();
            }
            System.out.println("===========================================");
            Reference<? extends byte[]> poll = queue.poll();
            while (poll != null) {
                list.remove(poll);
                poll = queue.poll();
            }
            for(WeakReference<byte[]> wake : list) {
                System.out.print(wake.get() + ",");
            }
        }
    
    }


​    

2、垃圾回收算法
--------

### 1）标记清除

定义：Mark Sweep

*   速度较快
*   会产生内存碎片  
    ![](https://img-blog.csdnimg.cn/20210209142921425.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

### 2）标记整理

Mark Compact

*   速度慢
*   没有内存碎片  
    ![](https://img-blog.csdnimg.cn/20210209143504936.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

### 3）复制

Copy

*   不会有内存碎片
*   需要占用两倍内存空间  
    ![](https://img-blog.csdnimg.cn/20210209144026784.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

3、分代垃圾回收
--------

![](https://img-blog.csdnimg.cn/20210209161407621.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

*   新创建的对象首先分配在 eden 区
*   新生代空间不足时，触发 minor gc ，eden 区 和 from 区存活的对象使用 - copy 复制到 to 中，存活的对象年龄加一，然后交换 from to
*   minor gc 会引发 stop the world，暂停其他线程，等垃圾回收结束后，恢复用户线程运行
*   当幸存区对象的寿命超过阈值时，会晋升到老年代，最大的寿命是 15（4bit）
*   当老年代空间不足时，会先触发 minor gc，如果空间仍然不足，那么就触发 full fc ，停止的时间更长！

### 1）相关 [JVM](https://so.csdn.net/so/search?q=JVM&spm=1001.2101.3001.7020) 参数

含义

参数

堆初始大小

\-Xms

堆最大大小

\-Xmx 或 -XX:MaxHeapSize=size

新生代大小

\-Xmn 或 (-XX:NewSize=size + -XX:MaxNewSize=size )

幸存区比例（动态）

\-XX:InitialSurvivorRatio=ratio 和 -XX:+UseAdaptiveSizePolicy

幸存区比例

\-XX:SurvivorRatio=ratio

晋升阈值

\-XX:MaxTenuringThreshold=threshold

晋升详情

\-XX:+PrintTenuringDistribution

GC详情

\-XX:+PrintGCDetails -verbose:gc

FullGC 前 MinorGC

\-XX:+ScavengeBeforeFullGC

### 2）GC 分析

    public class Code_10_GCTest {
    
        private static final int _512KB = 512 * 1024;
        private static final int _1MB = 1024 * 1024;
        private static final int _6MB = 6 * 1024 * 1024;
        private static final int _7MB = 7 * 1024 * 1024;
        private static final int _8MB = 8 * 1024 * 1024;
    
        // -Xms20m -Xmx20m -Xmn10m -XX:+UseSerialGC -XX:+PrintGCDetails -verbose:gc
        public static void main(String[] args) {
            List<byte[]> list = new ArrayList<>();
            list.add(new byte[_6MB]);
            list.add(new byte[_512KB]);
            list.add(new byte[_6MB]);
            list.add(new byte[_512KB]);
            list.add(new byte[_6MB]);
        }
    
    }


​    

通过上面的代码，给 list 分配内存，来观察 新生代和老年代的情况，什么时候触发 minor gc，什么时候触发 full gc 等情况，使用前需要设置 jvm 参数。

4、垃圾回收器
-------

**相关概念：**

*   并行收集：指多条垃圾收集线程并行工作，但此时用户线程仍处于等待状态。
*   并发收集：指用户线程与垃圾收集线程同时工作（不一定是并行的可能会交替执行）。用户程序在继续运行，而垃圾收集程序运行在另一个 CPU 上
*   吞吐量：即 CPU 用于运行用户代码的时间与 CPU 总消耗时间的比值（吞吐量 = 运行用户代码时间 / ( 运行用户代码时间 + 垃圾收集时间 )），也就是。例如：虚拟机共运行 100 分钟，垃圾收集器花掉 1 分钟，那么吞吐量就是 99% 。

### 1）串行

*   单线程
*   堆内存较少，适合个人电脑

![](https://img-blog.csdnimg.cn/20210210092812153.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

    -XX:+UseSerialGC=serial + serialOld


**安全点**：让其他线程都在这个点停下来，以免垃圾回收时移动对象地址，使得其他线程找不到被移动的对象  
因为是串行的，所以只有一个垃圾回收线程。且在该线程执行回收工作时，其他线程进入阻塞状态

**Serial 收集器**  
Serial 收集器是最基本的、发展历史最悠久的收集器  
**特点**：单线程、简单高效（与其他收集器的单线程相比），采用复制算法。对于限定单个 CPU 的环境来说，Serial 收集器由于没有线程交互的开销，专心做垃圾收集自然可以获得最高的单线程收集效率。收集器进行垃圾回收时，必须暂停其他所有的工作线程，直到它结束（Stop The World）！

**ParNew 收集器**  
ParNew 收集器其实就是 Serial 收集器的多线程版本  
**特点**：多线程、ParNew 收集器默认开启的收集线程数与CPU的数量相同，在 CPU 非常多的环境中，可以使用 -XX:ParallelGCThreads 参数来限制垃圾收集的线程数。和 Serial 收集器一样存在 Stop The World 问题

**Serial Old 收集器**  
Serial Old 是 Serial 收集器的老年代版本  
**特点**：同样是单线程收集器，采用标记-整理算法

### 2）吞吐量优先

*   多线程
*   堆内存较大，多核 cpu
*   让单位时间内，STW 的时间最短 0.2 0.2 = 0.4

![](https://img-blog.csdnimg.cn/20210210094915306.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

    -XX:+UseParallelGC ~ -XX:+UsePrallerOldGC
    -XX:+UseAdaptiveSizePolicy
    -XX:GCTimeRatio=ratio // 1/(1+radio)
    -XX:MaxGCPauseMillis=ms // 200ms
    -XX:ParallelGCThreads=n


**Parallel Scavenge 收集器**  
与吞吐量关系密切，故也称为吞吐量优先收集器  
**特点**：属于新生代收集器也是采用复制算法的收集器（用到了新生代的幸存区），又是并行的多线程收集器（与 ParNew 收集器类似）

该收集器的目标是达到一个可控制的吞吐量。还有一个值得关注的点是：GC自适应调节策略（与 ParNew 收集器最重要的一个区别）

GC自适应调节策略：  
Parallel Scavenge 收集器可设置 -XX:+UseAdptiveSizePolicy 参数。  
当开关打开时不需要手动指定新生代的大小（-Xmn）、Eden 与 Survivor 区的比例（-XX:SurvivorRation）、  
晋升老年代的对象年龄（-XX:PretenureSizeThreshold）等，[虚拟机](https://so.csdn.net/so/search?q=%E8%99%9A%E6%8B%9F%E6%9C%BA&spm=1001.2101.3001.7020)会根据系统的运行状况收集性能监控信息，动态设置这些参数以提供最优的停顿时间和最高的吞吐量，这种调节方式称为 GC 的自适应调节策略。

Parallel Scavenge 收集器使用两个参数控制吞吐量：

*   XX:MaxGCPauseMillis=ms 控制最大的垃圾收集停顿时间（默认200ms）
*   XX:GCTimeRatio=rario 直接设置吞吐量的大小

**Parallel Old 收集器**  
是 Parallel Scavenge 收集器的老年代版本  
**特点**：多线程，采用标记-整理算法（老年代没有幸存区）

### 3）响应时间优先

*   多线程
*   堆内存较大，多核 cpu
*   尽可能让 STW 的单次时间最短 0.1 0.1 0.1 0.1 0.1 = 0.5

![](https://img-blog.csdnimg.cn/20210210104030390.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

    -XX:+UseConcMarkSweepGC ~ -XX:+UseParNewGC ~ SerialOld
    -XX:ParallelGCThreads=n ~ -XX:ConcGCThreads=threads
    -XX:CMSInitiatingOccupancyFraction=percent
    -XX:+CMSScavengeBeforeRemark


**CMS 收集器**  
Concurrent Mark Sweep，一种以获取最短回收停顿时间为目标的**老年代收集器**  
**特点**：基于标记-清除算法实现。并发收集、低停顿，但是会产生内存碎片  
**应用场景**：适用于注重服务的响应速度，希望系统停顿时间最短，给用户带来更好的体验等场景下。如 web 程序、b/s 服务  
**CMS 收集器的运行过程分为下列4步：**  
**初始标记**：标记 GC Roots 能直接到的对象。速度很快但是仍存在 Stop The World 问题。  
**并发标记**：进行 GC Roots Tracing 的过程，找出存活对象且用户线程可并发执行。  
**重新标记**：为了修正并发标记期间因用户程序继续运行而导致标记产生变动的那一部分对象的标记记录。仍然存在 Stop The World 问题  
**并发清除**：对标记的对象进行清除回收，清除的过程中，可能任然会有新的垃圾产生，这些垃圾就叫浮动垃圾，如果当用户需要存入一个很大的对象时，新生代放不下去，老年代由于浮动垃圾过多，就会退化为 serial Old 收集器，将老年代垃圾进行标记-整理，当然这也是很耗费时间的！

CMS 收集器的内存回收过程是与用户线程一起并发执行的，可以搭配 ParNew 收集器（多线程，新生代，复制算法）与 Serial Old 收集器（单线程，老年代，标记-整理算法）使用。

### 4）G1 收集器

**定义：** Garbage First  
**适用场景：**

*   同时注重吞吐量和低延迟（响应时间）
*   超大堆内存（内存大的），会将堆内存划分为多个大小相等的区域
*   整体上是标记-整理算法，两个区域之间是复制算法

**相关参数：**  
JDK8 并不是默认开启的，所需要参数开启

    -XX:+UseG1GC
    -XX:G1HeapRegionSize=size
    -XX:MaxGCPauseMillis=time


#### G1 垃圾回收阶段

![](https://img-blog.csdnimg.cn/20210210114932887.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
Young Collection：对新生代垃圾收集  
Young Collection + Concurrent Mark：如果老年代内存到达一定的阈值了，新生代垃圾收集同时会执行一些并发的标记。  
Mixed Collection：会对新生代 + 老年代 + 幸存区等进行混合收集，然后收集结束，会重新进入新生代收集。

#### Young Collection

**新生代存在 STW：**  
分代是按对象的生命周期划分，分区则是将堆空间划分连续几个不同小区间，每一个小区间独立回收，可以控制一次回收多少个小区间，方便控制 GC 产生的停顿时间！  
E：eden，S：幸存区，O：老年代  
新生代收集会产生 STW ！  
![](https://img-blog.csdnimg.cn/20210210122339138.gif)

#### Young Collection + CM

在 Young GC 时会进行 GC Root 的初始化标记  
老年代占用堆空间比例达到阈值时，进行并发标记（不会STW），由下面的 JVM 参数决定 -XX:InitiatingHeapOccupancyPercent=percent （默认45%）  
![](https://img-blog.csdnimg.cn/20210210122601873.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

#### Mixed Collection

会对 E S O 进行**全面的回收**

*   最终标记会 STW
*   拷贝存活会 STW

\-XX:MaxGCPauseMills=xxms 用于指定最长的停顿时间！  
问：为什么有的老年代被拷贝了，有的没拷贝？  
因为指定了最大停顿时间，如果对所有老年代都进行回收，耗时可能过高。为了保证时间不超过设定的停顿时间，会回收最有价值的老年代（回收后，能够得到更多内存）  
![](https://img-blog.csdnimg.cn/20210210144216170.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

#### Full GC

G1 在老年代内存不足时（老年代所占内存超过阈值）  
如果垃圾产生速度慢于垃圾回收速度，不会触发 Full GC，还是并发地进行清理  
如果垃圾产生速度快于垃圾回收速度，便会触发 Full GC，然后退化成 serial Old 收集器串行的收集，就会导致停顿的时候长。

#### Young Collection 跨代引用

*   新生代回收的跨代引用（老年代引用新生代）问题  
    ![](https://img-blog.csdnimg.cn/20210210154730275.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)
*   卡表 与 Remembered Set
    *   Remembered Set 存在于E中，用于保存新生代对象对应的脏卡
        *   脏卡：O 被划分为多个区域（一个区域512K），如果该区域引用了新生代对象，则该区域被称为脏卡
*   在引用变更时通过 post-write barried + dirty card queue
*   concurrent refinement threads 更新 Remembered Set  
    ![](https://img-blog.csdnimg.cn/20210210154940579.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

#### Remark

重新标记阶段  
在垃圾回收时，收集器处理对象的过程中

*   黑色：已被处理，需要保留的
*   灰色：正在处理中的
*   白色：还未处理的  
    ![](https://img-blog.csdnimg.cn/20210210161204728.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

但是在并发标记过程中，有可能 A 被处理了以后未引用 C ，但该处理过程还未结束，在处理过程结束之前 A 引用了 C ，这时就会用到 remark 。  
过程如下

*   之前 C 未被引用，这时 A 引用了 C ，就会给 C 加一个写屏障，写屏障的指令会被执行，将 C 放入一个队列当中，并将 C 变为 处理中状态
*   在并发标记阶段结束以后，重新标记阶段会 STW ，然后将放在该队列中的对象重新处理，发现有强引用引用它，就会处理它，由灰色变成黑色。

![](https://img-blog.csdnimg.cn/20210210161559793.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
![](https://img-blog.csdnimg.cn/20210210161527103.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

#### JDK 8u20 字符串去重

过程

*   将所有新分配的字符串（底层是 char\[\] ）放入一个队列
*   当新生代回收时，G1 并发检查是否有重复的字符串
*   如果字符串的值一样，就让他们引用同一个字符串对象
*   注意，其与 String.intern() 的区别
    *   String.intern() 关注的是字符串对象
    *   字符串去重关注的是 char\[\]
    *   在 JVM 内部，使用了不同的字符串标

优点与缺点

*   节省了大量内存
*   新生代回收时间略微增加，导致略微多占用 CPU

    -XX:+UseStringDeduplication
    

#### JDK 8u40 并发标记类卸载

在并发标记阶段结束以后，就能知道哪些类不再被使用。如果一个类加载器的所有类都不在使用，则卸载它所加载的所有类

#### JDK 8u60 回收巨型对象

*   一个对象大于region的一半时，就称为巨型对象
*   G1不会对巨型对象进行拷贝
*   回收时被优先考虑
*   G1会跟踪老年代所有incoming引用，如果老年代incoming引用为0的巨型对象就可以在新生代垃圾回收时处理掉

![](https://img-blog.csdnimg.cn/20210210165555732.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

#### JDK 9 并发标记起始时间的调整

*   并发标记必须在堆空间占满前完成，否则退化为 FulGC
*   JDK 9 之前需要使用 -XX:InitiatingHeapOccupancyPercent
*   JDK 9 可以动态调整
    *   \-XX:InitiatingHeapOccupancyPercent 用来设置初始值
    *   进行数据采样并动态调整
    *   总会添加一个安全的空挡空间

5、垃圾回收调优
--------

查看虚拟机参数命令

    D:\JavaJDK1.8\bin\java  -XX:+PrintFlagsFinal -version | findstr "GC"


可以根据参数去查询具体的信息

### 1）调优领域

*   内存
*   锁竞争
*   cpu 占用
*   io
*   gc

### 2）确定目标

低延迟/高吞吐量？ 选择合适的GC

*   CMS G1 ZGC
*   ParallelGC
*   Zing

### 3）最快的 GC

首先排除减少因为自身编写的代码而引发的内存问题

*   查看 Full GC 前后的内存占用，考虑以下几个问题
    *   数据是不是太多？
        *   resultSet = statement.executeQuery(“select \* from 大表 limit n”)
    *   数据表示是否太臃肿
        *   对象图
        *   对象大小 16 Integer 24 int 4
    *   是否存在内存泄漏
        *   static Map map …
        *   软
        *   弱
        *   第三方缓存实现

### 4）新生代调优

*   新生代的特点
    
    *   所有的 new 操作分配内存都是非常廉价的
        *   TLAB thread-lcoal allocation buffer
    *   死亡对象回收零代价
    *   大部分对象用过即死（朝生夕死）
    *   Minor GC 所用时间远小于 Full GC
*   新生代内存越大越好么？
    
    *   不是
        *   新生代内存太小：频繁触发 Minor GC ，会 STW ，会使得吞吐量下降
        *   新生代内存太大：老年代内存占比有所降低，会更频繁地触发 Full GC。而且触发 Minor GC 时，清理新生代所花费的时间会更长
    *   新生代内存设置为内容纳\[并发量\*(请求-响应)\]的数据为宜
*   幸存区需要能够保存 当前活跃对象+需要晋升的对象
    
*   晋升阈值配置得当，让长时间存活的对象尽快晋升
    

    -XX:MaxTenuringThreshold=threshold
    -XX:+PrintTenuringDistrubution
    

### 5）老年代调优

以 CMS 为例：

*   CMS 的老年代内存越大越好
*   先尝试不做调优，如果没有 Full GC 那么已经，否者先尝试调优新生代。
*   观察发现 Full GC 时老年代内存占用，将老年代内存预设调大 1/4 ~ 1/3

    -XX:CMSInitiatingOccupancyFraction=percent
    

### 6）案例

案例1：Full GC 和 Minor GC 频繁  
案例2：请求高峰期发生 Full GC，单次暂停时间特别长（CMS）  
案例3：老年代充裕情况下，发生 Full GC（jdk1.7）

四、[类加载](https://so.csdn.net/so/search?q=%E7%B1%BB%E5%8A%A0%E8%BD%BD&spm=1001.2101.3001.7020)与字节码技术
==================================================================================================

![](https://img-blog.csdnimg.cn/20210210200506952.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

1、类文件结构
-------

通过 javac 类名.java 编译 java 文件后，会生成一个 .class 的文件！  
以下是字节码文件：

    0000000 ca fe ba be 00 00 00 34 00 23 0a 00 06 00 15 09 
    0000020 00 16 00 17 08 00 18 0a 00 19 00 1a 07 00 1b 07 
    0000040 00 1c 01 00 06 3c 69 6e 69 74 3e 01 00 03 28 29 
    0000060 56 01 00 04 43 6f 64 65 01 00 0f 4c 69 6e 65 4e 
    0000100 75 6d 62 65 72 54 61 62 6c 65 01 00 12 4c 6f 63 
    0000120 61 6c 56 61 72 69 61 62 6c 65 54 61 62 6c 65 01 
    0000140 00 04 74 68 69 73 01 00 1d 4c 63 6e 2f 69 74 63 
    0000160 61 73 74 2f 6a 76 6d 2f 74 35 2f 48 65 6c 6c 6f 
    0000200 57 6f 72 6c 64 3b 01 00 04 6d 61 69 6e 01 00 16 
    0000220 28 5b 4c 6a 61 76 61 2f 6c 61 6e 67 2f 53 74 72 
    0000240 69 6e 67 3b 29 56 01 00 04 61 72 67 73 01 00 13 
    0000260 5b 4c 6a 61 76 61 2f 6c 61 6e 67 2f 53 74 72 69 
    0000300 6e 67 3b 01 00 10 4d 65 74 68 6f 64 50 61 72 61 
    0000320 6d 65 74 65 72 73 01 00 0a 53 6f 75 72 63 65 46 
    0000340 69 6c 65 01 00 0f 48 65 6c 6c 6f 57 6f 72 6c 64
    0000360 2e 6a 61 76 61 0c 00 07 00 08 07 00 1d 0c 00 1e 
    0000400 00 1f 01 00 0b 68 65 6c 6c 6f 20 77 6f 72 6c 64 
    0000420 07 00 20 0c 00 21 00 22 01 00 1b 63 6e 2f 69 74 
    0000440 63 61 73 74 2f 6a 76 6d 2f 74 35 2f 48 65 6c 6c 
    0000460 6f 57 6f 72 6c 64 01 00 10 6a 61 76 61 2f 6c 61 
    0000500 6e 67 2f 4f 62 6a 65 63 74 01 00 10 6a 61 76 61 
    0000520 2f 6c 61 6e 67 2f 53 79 73 74 65 6d 01 00 03 6f 
    0000540 75 74 01 00 15 4c 6a 61 76 61 2f 69 6f 2f 50 72 
    0000560 69 6e 74 53 74 72 65 61 6d 3b 01 00 13 6a 61 76 
    0000600 61 2f 69 6f 2f 50 72 69 6e 74 53 74 72 65 61 6d 
    0000620 01 00 07 70 72 69 6e 74 6c 6e 01 00 15 28 4c 6a 
    0000640 61 76 61 2f 6c 61 6e 67 2f 53 74 72 69 6e 67 3b 
    0000660 29 56 00 21 00 05 00 06 00 00 00 00 00 02 00 01 
    0000700 00 07 00 08 00 01 00 09 00 00 00 2f 00 01 00 01 
    0000720 00 00 00 05 2a b7 00 01 b1 00 00 00 02 00 0a 00 
    0000740 00 00 06 00 01 00 00 00 04 00 0b 00 00 00 0c 00 
    0000760 01 00 00 00 05 00 0c 00 0d 00 00 00 09 00 0e 00 
    0001000 0f 00 02 00 09 00 00 00 37 00 02 00 01 00 00 00 
    0001020 09 b2 00 02 12 03 b6 00 04 b1 00 00 00 02 00 0a 
    0001040 00 00 00 0a 00 02 00 00 00 06 00 08 00 07 00 0b 
    0001060 00 00 00 0c 00 01 00 00 00 09 00 10 00 11 00 00 
    0001100 00 12 00 00 00 05 01 00 10 00 00 00 01 00 13 00 
    0001120 00 00 02 00 14


根据 JVM 规范，类文件结构如下：

    u4 			   magic
    u2             minor_version;    
    u2             major_version;    
    u2             constant_pool_count;    
    cp_info        constant_pool[constant_pool_count-1];    
    u2             access_flags;    
    u2             this_class;    
    u2             super_class;   
    u2             interfaces_count;    
    u2             interfaces[interfaces_count];   
    u2             fields_count;    
    field_info     fields[fields_count];   
    u2             methods_count;    
    method_info    methods[methods_count];    
    u2             attributes_count;    
    attribute_info attributes[attributes_count];


### 1）魔数

u4 magic  
对应字节码文件的 0~3 个字节  
0000000 ca fe ba be 00 00 00 34 00 23 0a 00 06 00 15 09  
ca fe ba be ：意思是 .class 文件，不同的东西有不同的魔数，比如 jpg、png 图片等！

### 2）版本

u2 minor\_version;  
u2 major\_version;  
0000000 ca fe ba be 00 00 00 34 00 23 0a 00 06 00 15 09  
00 00 00 34：34H（16进制） = 52（10进制），代表JDK8

### 3）常量池

…  
参考文档  
[传送门](https://docs.oracle.com/javase/specs/jvms/se8/html/)

2、字节码指令
-------

可参考：  
[](https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html>字节码指令</a></p> 
<h3><a name=)1）javap 工具

Java 中提供了 javap 工具来反编译 class 文件

    javap -v D:Demo.class


### 2）图解方法执行流程

**代码**

    public class Demo3_1 {    
    	public static void main(String[] args) {        
    		int a = 10;        
    		int b = Short.MAX_VALUE + 1;        
    		int c = a + b;        
    		System.out.println(c);   
        } 
    }


**常量池载入运行时常量池**  
常量池也属于方法区，只不过这里单独提出来了  
![](https://img-blog.csdnimg.cn/20210210230332114.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**方法字节码载入方法区**  
（stack=2，locals=4） 对应操作数栈有 2 个空间（每个空间 4 个字节），局部变量表中有 4 个槽位。  
![](https://img-blog.csdnimg.cn/20210210230419340.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**执行引擎开始执行字节码**  
**bipush 10**

*   **将一个 byte 压入操作数栈**（其长度会补齐 4 个字节），类似的指令还有
    *   sipush 将一个 short 压入操作数栈（其长度会补齐 4 个字节）
    *   ldc 将一个 int 压入操作数栈
    *   ldc2\_w 将一个 long 压入操作数栈（**分两次压入**，因为 long 是 8 个字节）
    *   这里小的数字都是和字节码指令存在一起，**超过 short 范围的数字存入了常量池**

![](https://img-blog.csdnimg.cn/20210210230611776.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**istore 1**  
将操作数栈栈顶元素弹出，放入局部变量表的 slot 1 中  
对应代码中的 a = 10  
![](https://img-blog.csdnimg.cn/20210210230717611.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**ldc #3**  
读取运行时常量池中 #3 ，即 32768 (超过 short 最大值范围的数会被放到运行时常量池中)，将其加载到操作数栈中  
注意 Short.MAX\_VALUE 是 32767，所以 32768 = Short.MAX\_VALUE + 1 实际是在编译期间计算好的。  
![](https://img-blog.csdnimg.cn/20210210230918171.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**istore 2**  
将操作数栈中的元素弹出，放到局部变量表的 2 号位置  
![](https://img-blog.csdnimg.cn/20210210231005919.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**iload1 iload2**  
将局部变量表中 1 号位置和 2 号位置的元素放入操作数栈中。因为只能在操作数栈中执行运算操作  
![](https://img-blog.csdnimg.cn/20210210231211695.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**iadd**  
将操作数栈中的两个元素弹出栈并相加，结果在压入操作数栈中。  
![](https://img-blog.csdnimg.cn/20210210231236404.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**istore 3**  
将操作数栈中的元素弹出，放入局部变量表的3号位置。  
![](https://img-blog.csdnimg.cn/20210210231319967.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**getstatic #4**  
在运行时常量池中找到 #4 ，发现是一个对象，在堆内存中找到该对象，并将其引用放入操作数栈中  
![](https://img-blog.csdnimg.cn/20210210231759663.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
![](https://img-blog.csdnimg.cn/20210210231827339.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**iload 3**  
将局部变量表中 3 号位置的元素压入操作数栈中。  
![](https://img-blog.csdnimg.cn/20210210232008706.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**invokevirtual #5**  
找到常量池 #5 项，定位到方法区 java/io/PrintStream.println:(I)V 方法  
生成新的栈帧（分配 locals、stack等）  
传递参数，执行新栈帧中的字节码  
![](https://img-blog.csdnimg.cn/20210210232148931.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
执行完毕，弹出栈帧  
清除 main 操作数栈内容  
![](https://img-blog.csdnimg.cn/20210210232228908.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
**return**  
完成 main 方法调用，弹出 main 栈帧，程序结束

### 3）通过字节码指令分析问题

代码

    public class Code_11_ByteCodeTest {
        public static void main(String[] args) {
    
            int i = 0;
            int x = 0;
            while (i < 10) {
                x = x++;
                i++;
            }
            System.out.println(x); // 0
        }
    }


​    

为什么最终的 x 结果为 0 呢？ 通过分析字节码指令即可知晓

    Code:
         stack=2, locals=3, args_size=1	// 操作数栈分配2个空间，局部变量表分配 3 个空间
            0: iconst_0	// 准备一个常数 0
            1: istore_1	// 将常数 0 放入局部变量表的 1 号槽位 i = 0
            2: iconst_0	// 准备一个常数 0
            3: istore_2	// 将常数 0 放入局部变量的 2 号槽位 x = 0	
            4: iload_1		// 将局部变量表 1 号槽位的数放入操作数栈中
            5: bipush        10	// 将数字 10 放入操作数栈中，此时操作数栈中有 2 个数
            7: if_icmpge     21	// 比较操作数栈中的两个数，如果下面的数大于上面的数，就跳转到 21 。这里的比较是将两个数做减法。因为涉及运算操作，所以会将两个数弹出操作数栈来进行运算。运算结束后操作数栈为空
           10: iload_2		// 将局部变量 2 号槽位的数放入操作数栈中，放入的值是 0 
           11: iinc          2, 1	// 将局部变量 2 号槽位的数加 1 ，自增后，槽位中的值为 1 
           14: istore_2	//将操作数栈中的数放入到局部变量表的 2 号槽位，2 号槽位的值又变为了0
           15: iinc          1, 1 // 1 号槽位的值自增 1 
           18: goto          4 // 跳转到第4条指令
           21: getstatic     #2                  // Field java/lang/System.out:Ljava/io/PrintStream;
           24: iload_2
           25: invokevirtual #3                  // Method java/io/PrintStream.println:(I)V
           28: return


### 4）构造方法

**cinit()V**

    public class Code_12_CinitTest {
    	static int i = 10;
    
    	static {
    		i = 20;
    	}
    
    	static {
    		i = 30;
    	}
    
    	public static void main(String[] args) {
    		System.out.println(i); // 30
    	}
    }


编译器会按从上至下的顺序，收集所有 static 静态代码块和静态成员赋值的代码，合并为一个特殊的方法 cinit()V ：

    stack=1, locals=0, args_size=0
             0: bipush        10
             2: putstatic     #3                  // Field i:I
             5: bipush        20
             7: putstatic     #3                  // Field i:I
            10: bipush        30
            12: putstatic     #3                  // Field i:I
            15: return


**init()V**

    public class Code_13_InitTest {
    
        private String a = "s1";
    
        {
            b = 20;
        }
    
        private int b = 10;
    
        {
            a = "s2";
        }
    
        public Code_13_InitTest(String a, int b) {
            this.a = a;
            this.b = b;
        }
    
        public static void main(String[] args) {
            Code_13_InitTest d = new Code_13_InitTest("s3", 30);
            System.out.println(d.a);
            System.out.println(d.b);
        }
    
    }


​    

编译器会按从上至下的顺序，收集所有 {} 代码块和成员变量赋值的代码，形成新的构造方法，但原始构造方法内的代码总是在后.

    Code:
         stack=2, locals=3, args_size=3
            0: aload_0
            1: invokespecial #1                  // Method java/lang/Object."<init>":()V
            4: aload_0
            5: ldc           #2                  // String s1
            7: putfield      #3                  // Field a:Ljava/lang/String;
           10: aload_0
           11: bipush        20
           13: putfield      #4                  // Field b:I
           16: aload_0
           17: bipush        10
           19: putfield      #4                  // Field b:I
           22: aload_0
           23: ldc           #5                  // String s2
           25: putfield      #3                  // Field a:Ljava/lang/String;
           // 原始构造方法在最后执行
           28: aload_0
           29: aload_1
           30: putfield      #3                  // Field a:Ljava/lang/String;
           33: aload_0
           34: iload_2
           35: putfield      #4                  // Field b:I
           38: return


### 5）方法调用

    public class Code_14_MethodTest {
    
        public Code_14_MethodTest() {
    
        }
    
        private void test1() {
    
        }
    
        private final void test2() {
    
        }
    
        public void test3() {
    
        }
    
        public static void test4() {
    
        }
    
        public static void main(String[] args) {
            Code_14_MethodTest obj = new Code_14_MethodTest();
            obj.test1();
            obj.test2();
            obj.test3();
            Code_14_MethodTest.test4();
        }
    }


​    

不同方法在调用时，对应的虚拟机指令有所区别

*   私有、构造、被 final 修饰的方法，在调用时都使用 invokespecial 指令
*   普通成员方法在调用时，使用 invokevirtual 指令。因为编译期间无法确定该方法的内容，只有在运行期间才能确定
*   静态方法在调用时使用 invokestatic 指令

    Code:
          stack=2, locals=2, args_size=1
             0: new           #2                  //
             3: dup // 复制一份对象地址压入操作数栈中
             4: invokespecial #3                  // Method "<init>":()V
             7: astore_1
             8: aload_1
             9: invokespecial #4                  // Method test1:()V
            12: aload_1
            13: invokespecial #5                  // Method test2:()V
            16: aload_1
            17: invokevirtual #6                  // Method test3:()V
            20: invokestatic  #7                  // Method test4:()V
            23: return
    
*   new 是创建【对象】，给对象分配堆内存，执行成功会将【对象引用】压入操作数栈
*   dup 是赋值操作数栈栈顶的内容，本例即为【对象引用】，为什么需要两份引用呢，一个是要配合 invokespecial 调用该对象的构造方法 “init”: ()V （会消耗掉栈顶一个引用），另一个要 配合 astore\_1 赋值给局部变量
*   终方法（ﬁnal），私有方法（private），构造方法都是由 invokespecial 指令来调用，属于静态绑定
*   普通成员方法是由 invokevirtual 调用，属于动态绑定，即支持多态 成员方法与静态方法调用的另一个区别是，执行方法前是否需要【对象引用】

### 6）多态原理

因为普通成员方法需要在运行时才能确定具体的内容，所以虚拟机需要调用 invokevirtual 指令  
在执行 invokevirtual 指令时，经历了以下几个步骤

*   先通过栈帧中对象的引用找到对象
*   分析对象头，找到对象实际的 Class
*   Class 结构中有 vtable
*   查询 vtable 找到方法的具体地址
*   执行方法的字节码

### 7）异常处理

**try-catch**

    public class Code_15_TryCatchTest {
    
        public static void main(String[] args) {
            int i = 0;
            try {
                i = 10;
            }catch (Exception e) {
                i = 20;
            }
        }
    
    }


对应字节码指令

    Code:
         stack=1, locals=3, args_size=1
            0: iconst_0
            1: istore_1
            2: bipush        10
            4: istore_1
            5: goto          12
            8: astore_2
            9: bipush        20
           11: istore_1
           12: return
         //多出来一个异常表
         Exception table:
            from    to  target type
                2     5     8   Class java/lang/Exception


*   可以看到多出来一个 Exception table 的结构，\[from, to) 是前闭后开（也就是检测 2~4 行）的检测范围，一旦这个范围内的字节码执行出现异常，则通过 type 匹配异常类型，如果一致，进入 target 所指示行号
*   8 行的字节码指令 astore\_2 是将异常对象引用存入局部变量表的 2 号位置（为 e ）

**多个 single-catch**

    public class Code_16_MultipleCatchTest {
    
        public static void main(String[] args) {
            int i = 0;
            try {
                i = 10;
            }catch (ArithmeticException e) {
                i = 20;
            }catch (Exception e) {
                i = 30;
            }
        }
    }


​    
​    

对应的字节码

    Code:
         stack=1, locals=3, args_size=1
            0: iconst_0
            1: istore_1
            2: bipush        10
            4: istore_1
            5: goto          19
            8: astore_2
            9: bipush        20
           11: istore_1
           12: goto          19
           15: astore_2
           16: bipush        30
           18: istore_1
           19: return
         Exception table:
            from    to  target type
                2     5     8   Class java/lang/ArithmeticException
                2     5    15   Class java/lang/Exception


*   因为异常出现时，只能进入 Exception table 中一个分支，所以局部变量表 slot 2 位置被共用

**finally**

    public class Code_17_FinallyTest {
        
        public static void main(String[] args) {
            int i = 0;
            try {
                i = 10;
            } catch (Exception e) {
                i = 20;
            } finally {
                i = 30;
            }
        }
    }


​    

对应字节码

    Code:
         stack=1, locals=4, args_size=1
            0: iconst_0
            1: istore_1
            // try块
            2: bipush        10
            4: istore_1
            // try块执行完后，会执行finally    
            5: bipush        30
            7: istore_1
            8: goto          27
           // catch块     
           11: astore_2 // 异常信息放入局部变量表的2号槽位
           12: bipush        20
           14: istore_1
           // catch块执行完后，会执行finally        
           15: bipush        30
           17: istore_1
           18: goto          27
           // 出现异常，但未被 Exception 捕获，会抛出其他异常，这时也需要执行 finally 块中的代码   
           21: astore_3
           22: bipush        30
           24: istore_1
           25: aload_3
           26: athrow  // 抛出异常
           27: return
         Exception table:
            from    to  target type
                2     5    11   Class java/lang/Exception
                2     5    21   any
               11    15    21   any


可以看到 ﬁnally 中的代码被复制了 3 份，分别放入 try 流程，catch 流程以及 catch 剩余的异常类型流程  
注意：虽然从字节码指令看来，每个块中都有 finally 块，但是 finally 块中的代码只会被执行一次

**finally 中的 return**

    public class Code_18_FinallyReturnTest {
    
        public static void main(String[] args) {
            int i = Code_18_FinallyReturnTest.test();
            // 结果为 20
            System.out.println(i);
        }
    
        public static int test() {
            int i;
            try {
                i = 10;
                return i;
            } finally {
                i = 20;
                return i;
            }
        }
    }


对应字节码

    Code:
         stack=1, locals=3, args_size=0
            0: bipush        10
            2: istore_0
            3: iload_0
            4: istore_1  // 暂存返回值
            5: bipush        20
            7: istore_0
            8: iload_0
            9: ireturn	// ireturn 会返回操作数栈顶的整型值 20
           // 如果出现异常，还是会执行finally 块中的内容，没有抛出异常
           10: astore_2
           11: bipush        20
           13: istore_0
           14: iload_0
           15: ireturn	// 这里没有 athrow 了，也就是如果在 finally 块中如果有返回操作的话，且 try 块中出现异常，会吞掉异常！
         Exception table:
            from    to  target type
                0     5    10   any


*   由于 ﬁnally 中的 ireturn 被插入了所有可能的流程，因此返回结果肯定以ﬁnally的为准
*   至于字节码中第 2 行，似乎没啥用，且留个伏笔，看下个例子
*   跟上例中的 ﬁnally 相比，发现没有 athrow 了，这告诉我们：如果在 ﬁnally 中出现了 return，会吞掉异常
*   所以不要在finally中进行返回操作

**被吞掉的异常**

    public static int test() {
          int i;
          try {
             i = 10;
             //  这里应该会抛出异常
             i = i/0;
             return i;
          } finally {
             i = 20;
             return i;
          }
       }


会发现打印结果为 20 ，并未抛出异常

**finally 不带 return**

    public static int test() {
    		int i = 10;
    		try {
    			return i;
    		} finally {
    			i = 20;
    		}
    	}


对应字节码

    Code:
         stack=1, locals=3, args_size=0
            0: bipush        10
            2: istore_0 // 赋值给i 10
            3: iload_0	// 加载到操作数栈顶
            4: istore_1 // 加载到局部变量表的1号位置
            5: bipush        20
            7: istore_0 // 赋值给i 20
            8: iload_1 // 加载局部变量表1号位置的数10到操作数栈
            9: ireturn // 返回操作数栈顶元素 10
           10: astore_2
           11: bipush        20
           13: istore_0
           14: aload_2 // 加载异常
           15: athrow // 抛出异常
         Exception table:
            from    to  target type
                3     5    10   any


### 8）Synchronized

    public class Code_19_SyncTest {
    
        public static void main(String[] args) {
            Object lock = new Object();
            synchronized (lock) {
                System.out.println("ok");
            }
        }
    
    }


​    

对应字节码

    Code:
          stack=2, locals=4, args_size=1
             0: new           #2                  // class java/lang/Object
             3: dup // 复制一份栈顶，然后压入栈中。用于函数消耗
             4: invokespecial #1                  // Method java/lang/Object."<init>":()V
             7: astore_1 // 将栈顶的对象地址方法 局部变量表中 1 中
             8: aload_1 // 加载到操作数栈
             9: dup // 复制一份，放到操作数栈，用于加锁时消耗
            10: astore_2 // 将操作数栈顶元素弹出，暂存到局部变量表的 2 号槽位。这时操作数栈中有一份对象的引用
            11: monitorenter // 加锁
            12: getstatic     #3                  // Field java/lang/System.out:Ljava/io/PrintStream;
            15: ldc           #4                  // String ok
            17: invokevirtual #5                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
            20: aload_2 // 加载对象到栈顶
            21: monitorexit // 释放锁
            22: goto          30
            // 异常情况的解决方案 释放锁！
            25: astore_3
            26: aload_2
            27: monitorexit
            28: aload_3
            29: athrow
            30: return
            // 异常表！
          Exception table:
             from    to  target type
                12    22    25   any
                25    28    25   any


​    

3、编译期处理
-------

所谓的 **语法糖** ，其实就是指 java 编译器把 .java 源码编译为 .class 字节码的过程中，自动生成和转换的一些代码，主要是为了减轻程序员的负担，算是 java 编译器给我们的一个额外福利  
**注意**，以下代码的分析，借助了 javap 工具，idea 的反编译功能，idea 插件 jclasslib 等工具。另外， 编译器转换的**结果直接就是 class 字节码**，只是为了便于阅读，给出了 几乎等价 的 java 源码方式，并不是编译器还会转换出中间的 java 源码，切记。

### 1）默认构造器

    public class Candy1 {
    
    }


经过编译期优化后

    public class Candy1 {
       // 这个无参构造器是java编译器帮我们加上的
       public Candy1() {
          // 即调用父类 Object 的无参构造方法，即调用 java/lang/Object." <init>":()V
          super();
       }
    }


### 2）自动拆装箱

基本类型和其包装类型的相互转换过程，称为拆装箱  
在 JDK 5 以后，它们的转换可以在编译期自动完成

    public class Candy2 {
       public static void main(String[] args) {
          Integer x = 1;
          int y = x;
       }
    }


转换过程如下

    public class Candy2 {
       public static void main(String[] args) {
          // 基本类型赋值给包装类型，称为装箱
          Integer x = Integer.valueOf(1);
          // 包装类型赋值给基本类型，称谓拆箱
          int y = x.intValue();
       }
    }


### 3）泛型集合取值

泛型也是在 JDK 5 开始加入的特性，但 java 在编译泛型代码后会执行泛型擦除的动作，即泛型信息在编译为字节码之后就丢失了，实际的类型都当做了 Object 类型来处理：

    public class Candy3 {
       public static void main(String[] args) {
          List<Integer> list = new ArrayList<>();
          list.add(10);
          Integer x = list.get(0);
       }
    }


对应字节码

    Code:
        stack=2, locals=3, args_size=1
           0: new           #2                  // class java/util/ArrayList
           3: dup
           4: invokespecial #3                  // Method java/util/ArrayList."<init>":()V
           7: astore_1
           8: aload_1
           9: bipush        10
          11: invokestatic  #4                  // Method java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
          // 这里进行了泛型擦除，实际调用的是add(Objcet o)
          14: invokeinterface #5,  2            // InterfaceMethod java/util/List.add:(Ljava/lang/Object;)Z
    
          19: pop
          20: aload_1
          21: iconst_0
          // 这里也进行了泛型擦除，实际调用的是get(Object o)   
          22: invokeinterface #6,  2            // InterfaceMethod java/util/List.get:(I)Ljava/lang/Object;
    // 这里进行了类型转换，将 Object 转换成了 Integer
          27: checkcast     #7                  // class java/lang/Integer
          30: astore_2
          31: return


所以调用 get 函数取值时，有一个类型转换的操作。

    Integer x = (Integer) list.get(0);


如果要将返回结果赋值给一个 int 类型的变量，则还有自动拆箱的操作

    int x = (Integer) list.get(0).intValue();


使用反射可以得到，参数的类型以及泛型类型。泛型反射代码如下：


        public static void main(String[] args) throws NoSuchMethodException {
            // 1. 拿到方法
            Method method = Code_20_ReflectTest.class.getMethod("test", List.class, Map.class);
            // 2. 得到泛型参数的类型信息
            Type[] types = method.getGenericParameterTypes();
            for(Type type : types) {
                // 3. 判断参数类型是否，带泛型的类型。
                if(type instanceof ParameterizedType) {
                    ParameterizedType parameterizedType = (ParameterizedType) type;
    
                    // 4. 得到原始类型
                    System.out.println("原始类型 - " + parameterizedType.getRawType());
                    // 5. 拿到泛型类型
                    Type[] arguments = parameterizedType.getActualTypeArguments();
                    for(int i = 0; i < arguments.length; i++) {
                        System.out.printf("泛型参数[%d] - %s\n", i, arguments[i]);
                    }
                }
            }
        }
    
        public Set<Integer> test(List<String> list, Map<Integer, Object> map) {
            return null;
        }


输出：

    原始类型 - interface java.util.List
    泛型参数[0] - class java.lang.String
    原始类型 - interface java.util.Map
    泛型参数[0] - class java.lang.Integer
    泛型参数[1] - class java.lang.Object


### 4）可变参数

可变参数也是 JDK 5 开始加入的新特性： 例如：

    public class Candy4 {
       public static void foo(String... args) {
          // 将 args 赋值给 arr ，可以看出 String... 实际就是 String[]  
          String[] arr = args;
          System.out.println(arr.length);
       }
    
       public static void main(String[] args) {
          foo("hello", "world");
       }
    }


可变参数 String… args 其实是一个 String\[\] args ，从代码中的赋值语句中就可以看出来。 同 样 java 编译器会在编译期间将上述代码变换为：

    public class Candy4 {
       public Candy4 {}
       public static void foo(String[] args) {
          String[] arr = args;
          System.out.println(arr.length);
       }
    
       public static void main(String[] args) {
          foo(new String[]);
       }
    }


注意，如果调用的是 foo() ，即未传递参数时，等价代码为 foo(new String\[\]{}) ，创建了一个空数组，而不是直接传递的 null .

### 5）foreach 循环

仍是 JDK 5 开始引入的语法糖，数组的循环：

    public class Candy5 {
    	public static void main(String[] args) {
            // 数组赋初值的简化写法也是一种语法糖。
    		int[] arr = {1, 2, 3, 4, 5};
    		for(int x : arr) {
    			System.out.println(x);
    		}
    	}
    }


编译器会帮我们转换为

    public class Candy5 {
        public Candy5() {}
    
    	public static void main(String[] args) {
    		int[] arr = new int[]{1, 2, 3, 4, 5};
    		for(int i = 0; i < arr.length; ++i) {
    			int x = arr[i];
    			System.out.println(x);
    		}
    	}
    }


如果是集合使用 foreach

    public class Candy5 {
       public static void main(String[] args) {
          List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);
          for (Integer x : list) {
             System.out.println(x);
          }
       }


​    

集合要使用 foreach ，需要该集合类实现了 Iterable 接口，因为集合的遍历需要用到迭代器 Iterator.

    public class Candy5 {
        public Candy5(){}
        
       public static void main(String[] args) {
          List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);
          // 获得该集合的迭代器
          Iterator<Integer> iterator = list.iterator();
          while(iterator.hasNext()) {
             Integer x = iterator.next();
             System.out.println(x);
          }
       }
    }


### 6）switch 字符串

从 JDK 7 开始，switch 可以作用于字符串和枚举类，这个功能其实也是语法糖，例如：

    public class Cnady6 {
       public static void main(String[] args) {
          String str = "hello";
          switch (str) {
             case "hello" :
                System.out.println("h");
                break;
             case "world" :
                System.out.println("w");
                break;
             default:
                break;
          }
       }
    }


在编译器中执行的操作

    public class Candy6 {
       public Candy6() {
          
       }
       public static void main(String[] args) {
          String str = "hello";
          int x = -1;
          // 通过字符串的 hashCode + value 来判断是否匹配
          switch (str.hashCode()) {
             // hello 的 hashCode
             case 99162322 :
                // 再次比较，因为字符串的 hashCode 有可能相等
                if(str.equals("hello")) {
                   x = 0;
                }
                break;
             // world 的 hashCode
             case 11331880 :
                if(str.equals("world")) {
                   x = 1;
                }
                break;
             default:
                break;
          }
    
          // 用第二个 switch 在进行输出判断
          switch (x) {
             case 0:
                System.out.println("h");
                break;
             case 1:
                System.out.println("w");
                break;
             default:
                break;
          }
       }
    }


过程说明：

*   在编译期间，单个的 switch 被分为了两个
    *   第一个用来匹配字符串，并给 x 赋值
        *   字符串的匹配用到了字符串的 hashCode ，还用到了 equals 方法
        *   使用 hashCode 是为了提高比较效率，使用 equals 是防止有 hashCode 冲突（如 BM 和 C .）
    *   第二个用来根据x的值来决定输出语句

### 7）switch 枚举

    enum SEX {
       MALE, FEMALE;
    }
    public class Candy7 {
       public static void main(String[] args) {
          SEX sex = SEX.MALE;
          switch (sex) {
             case MALE:
                System.out.println("man");
                break;
             case FEMALE:
                System.out.println("woman");
                break;
             default:
                break;
          }
       }
    }


编译器中执行的代码如下

    enum SEX {
       MALE, FEMALE;
    }
    
    public class Candy7 {
       /**     
        * 定义一个合成类（仅 jvm 使用，对我们不可见）     
        * 用来映射枚举的 ordinal 与数组元素的关系     
        * 枚举的 ordinal 表示枚举对象的序号，从 0 开始     
        * 即 MALE 的 ordinal()=0，FEMALE 的 ordinal()=1     
        */ 
       static class $MAP {
          // 数组大小即为枚举元素个数，里面存放了 case 用于比较的数字
          static int[] map = new int[2];
          static {
             // ordinal 即枚举元素对应所在的位置，MALE 为 0 ，FEMALE 为 1
             map[SEX.MALE.ordinal()] = 1;
             map[SEX.FEMALE.ordinal()] = 2;
          }
       }
    
       public static void main(String[] args) {
          SEX sex = SEX.MALE;
          // 将对应位置枚举元素的值赋给 x ，用于 case 操作
          int x = $MAP.map[sex.ordinal()];
          switch (x) {
             case 1:
                System.out.println("man");
                break;
             case 2:
                System.out.println("woman");
                break;
             default:
                break;
          }
       }
    }


### 8）枚举类

JDK 7 新增了枚举类，以前面的性别枚举为例：

    enum SEX {
       MALE, FEMALE;
    }


转换后的代码

    public final class Sex extends Enum<Sex> {   
       // 对应枚举类中的元素
       public static final Sex MALE;    
       public static final Sex FEMALE;    
       private static final Sex[] $VALUES;
       
        static {       
        	// 调用构造函数，传入枚举元素的值及 ordinal
        	MALE = new Sex("MALE", 0);    
            FEMALE = new Sex("FEMALE", 1);   
            $VALUES = new Sex[]{MALE, FEMALE}; 
       }
     	
       // 调用父类中的方法
        private Sex(String name, int ordinal) {     
            super(name, ordinal);    
        }
       
        public static Sex[] values() {  
            return $VALUES.clone();  
        }
        public static Sex valueOf(String name) { 
            return Enum.valueOf(Sex.class, name);  
        } 
       
    }


### 9）try-with-resources

JDK 7 开始新增了对需要关闭的资源处理的特殊语法，‘try-with-resources’

    try(资源变量 = 创建资源对象) {
    	
    } catch() {
    
    }


其中资源对象需要实现 AutoCloseable 接口，例如 InputStream 、 OutputStream 、 Connection 、 Statement 、 ResultSet 等接口都实现了 AutoCloseable ，使用 try-with- resources 可以不用写 finally 语句块，编译器会帮助生成关闭资源代码，例如：

    public class Candy9 { 
    	public static void main(String[] args) {
    		try(InputStream is = new FileInputStream("d:\\1.txt")){	
    			System.out.println(is); 
    		} catch (IOException e) { 
    			e.printStackTrace(); 
    		} 
    	} 
    }


会被转换为：

    public class Candy9 { 
        
        public Candy9() { }
       
        public static void main(String[] args) { 
            try {
                InputStream is = new FileInputStream("d:\\1.txt");
                Throwable t = null; 
                try {
                    System.out.println(is); 
                } catch (Throwable e1) { 
                    // t 是我们代码出现的异常 
                    t = e1; 
                    throw e1; 
                } finally {
                    // 判断了资源不为空 
                    if (is != null) { 
                        // 如果我们代码有异常
                        if (t != null) { 
                            try {
                                is.close(); 
                            } catch (Throwable e2) { 
                                // 如果 close 出现异常，作为被压制异常添加
                                t.addSuppressed(e2); 
                            } 
                        } else { 
                            // 如果我们代码没有异常，close 出现的异常就是最后 catch 块中的 e 
                            is.close(); 
                        } 
                    } 
                } 
            } catch (IOException e) {
                e.printStackTrace(); 
            } 
        }
    }


为什么要设计一个 addSuppressed(Throwable e) （添加被压制异常）的方法呢？是为了防止异常信息的丢失（想想 try-with-resources 生成的 fianlly 中如果抛出了异常）：

    public class Test6 { 
    	public static void main(String[] args) { 
    		try (MyResource resource = new MyResource()) { 
    			int i = 1/0; 
    		} catch (Exception e) { 
    			e.printStackTrace(); 
    		} 
    	} 
    }
    class MyResource implements AutoCloseable { 
    	public void close() throws Exception { 
    		throw new Exception("close 异常"); 
    	} 
    }


输出：

    java.lang.ArithmeticException: / by zero 
    	at test.Test6.main(Test6.java:7) 
    	Suppressed: java.lang.Exception: close 异常 
    		at test.MyResource.close(Test6.java:18) 
    		at test.Test6.main(Test6.java:6)


### 10）方法重写时的桥接方法

我们都知道，方法重写时对返回值分两种情况：  
\- 父子类的返回值完全一致  
\- 子类返回值可以是父类返回值的子类（比较绕口，见下面的例子）

    class A { 
    	public Number m() { 
    		return 1; 
    	} 
    }
    class B extends A { 
    	@Override 
    	// 子类 m 方法的返回值是 Integer 是父类 m 方法返回值 Number 的子类 	
    	public Integer m() { 
    		return 2; 
    	} 
    }


对于子类，java 编译器会做如下处理：

    class B extends A { 
    	public Integer m() { 
    		return 2; 
    	}
    	// 此方法才是真正重写了父类 public Number m() 方法 
    	public synthetic bridge Number m() { 
    		// 调用 public Integer m() 
    		return m(); 
    	} 
    }


其中桥接方法比较特殊，仅对 java 虚拟机可见，并且与原来的 public Integer m() 没有命名冲突，可以  
用下面反射代码来验证：

    public static void main(String[] args) {
            for(Method m : B.class.getDeclaredMethods()) {
                System.out.println(m);
            }
        }


结果：

    public java.lang.Integer cn.ali.jvm.test.B.m()
    public java.lang.Number cn.ali.jvm.test.B.m()


### 11）匿名内部类

    public class Candy10 {
       public static void main(String[] args) {
          Runnable runnable = new Runnable() {
             @Override
             public void run() {
                System.out.println("running...");
             }
          };
       }
    }


​    

转换后的代码

    public class Candy10 {
       public static void main(String[] args) {
          // 用额外创建的类来创建匿名内部类对象
          Runnable runnable = new Candy10$1();
       }
    }
    
    // 创建了一个额外的类，实现了 Runnable 接口
    final class Candy10$1 implements Runnable {
       public Demo8$1() {}
    
       @Override
       public void run() {
          System.out.println("running...");
       }
    }


引用局部变量的匿名内部类，源代码：

    public class Candy11 { 
    	public static void test(final int x) { 
    		Runnable runnable = new Runnable() { 
    			@Override 
    			public void run() { 	
    				System.out.println("ok:" + x); 
    			} 
    		}; 
    	} 
    }


转换后代码：

    // 额外生成的类 
    final class Candy11$1 implements Runnable { 
    	int val$x; 
    	Candy11$1(int x) { 
    		this.val$x = x; 
    	}
    	public void run() { 
    		System.out.println("ok:" + this.val$x); 
    	} 
    }
    
    public class Candy11 { 
    	public static void test(final int x) { 
    		Runnable runnable = new Candy11$1(x); 
    	} 
    }


注意：这同时解释了为什么匿名内部类引用局部变量时，局部变量必须是 final 的：因为在创建 Candy11$1 对象时，将 x 的值赋值给了 Candy11$1 对象的 值后，如果不是 final 声明的 x 值发生了改变，匿名内部类则值不一致。

4、类加载阶段
-------

### 1）加载

*   将类的字节码载入方法区（1.8后为元空间，在本地内存中）中，内部采用 C++ 的 instanceKlass 描述 java 类，它的重要 ﬁeld 有：
    *   \_java\_mirror 即 java 的类镜像，例如对 String 来说，它的镜像类就是 String.class，作用是把 klass 暴露给 java 使用
    *   \_super 即父类
    *   \_ﬁelds 即成员变量
    *   \_methods 即方法
    *   \_constants 即常量池
    *   \_class\_loader 即类加载器
    *   \_vtable 虚方法表
    *   \_itable 接口方法
*   如果这个类还有父类没有加载，先加载父类
*   加载和链接可能是交替运行的  
    ![](https://img-blog.csdnimg.cn/20210211160212124.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)
*   instanceKlass保存在方法区。JDK 8以后，方法区位于元空间中，而元空间又位于本地内存中
*   \_java\_mirror则是保存在堆内存中
*   InstanceKlass和\*.class(JAVA镜像类)互相保存了对方的地址
*   类的对象在对象头中保存了\*.class的地址。让对象可以通过其找到方法区中的instanceKlass，从而获取类的各种信息

**注意**

*   instanceKlass 这样的【元数据】是存储在方法区（1.8 后的元空间内），但 \_java\_mirror 是存储在堆中
*   可以通过前面介绍的 HSDB 工具查看

### 2）连接

**验证**  
验证类是否符合 JVM规范，安全性检查  
用 UE 等支持二进制的编辑器修改 HelloWorld.class 的魔数，在控制台运行  
**准备**  
为 static 变量分配空间，设置默认值

*   static 变量在 JDK 7 之前存储于 instanceKlass 末尾，从 JDK 7 开始，存储于 \_java\_mirror 末尾
*   static 变量分配空间和赋值是两个步骤，分配空间在准备阶段完成，赋值在初始化阶段完成
*   如果 static 变量是 final 的基本类型，以及字符串常量，那么编译阶段值就确定了，赋值在准备阶段完成
*   如果 static 变量是 final 的，但属于引用类型，那么赋值也会在初始化阶段完成将常量池中的符号引用解析为直接引用

    public class Code_22_AnalysisTest {
    
    
        public static void main(String[] args) throws ClassNotFoundException, IOException {
            ClassLoader classLoader = Code_22_AnalysisTest.class.getClassLoader();
            Class<?> c = classLoader.loadClass("cn.ali.jvm.test.C");
        
            // new C();
            System.in.read();
        }
    
    }
    
    class C {
        D d = new D();
    }
    
    class D {
    
    }
    

### 3）初始化

#### <cinit>()v 方法

初始化即调用 <cinit>()V ，虚拟机会保证这个类的『构造方法』的线程安全

#### 发生的时机

概括得说，类初始化是【懒惰的】

*   main 方法所在的类，总会被首先初始化
*   首次访问这个类的静态变量或静态方法时
*   子类初始化，如果父类还没初始化，会引发
*   子类访问父类的静态变量，只会触发父类的初始化
*   Class.forName
*   new 会导致初始化

不会导致类初始化的情况

*   访问类的 static final 静态常量（基本类型和字符串）不会触发初始化
*   类对象.class 不会触发初始化
*   创建该类的数组不会触发初始化

    public class Load1 {
        static {
            System.out.println("main init");
        }
        public static void main(String[] args) throws ClassNotFoundException {
            // 1. 静态常量（基本类型和字符串）不会触发初始化
    //         System.out.println(B.b);
            // 2. 类对象.class 不会触发初始化
    //         System.out.println(B.class);
            // 3. 创建该类的数组不会触发初始化
    //         System.out.println(new B[0]);
            // 4. 不会初始化类 B，但会加载 B、A
    //         ClassLoader cl = Thread.currentThread().getContextClassLoader();
    //         cl.loadClass("cn.ali.jvm.test.classload.B");
            // 5. 不会初始化类 B，但会加载 B、A
    //         ClassLoader c2 = Thread.currentThread().getContextClassLoader();
    //         Class.forName("cn.ali.jvm.test.classload.B", false, c2);
    
    
            // 1. 首次访问这个类的静态变量或静态方法时
    //         System.out.println(A.a);
            // 2. 子类初始化，如果父类还没初始化，会引发
    //         System.out.println(B.c);
            // 3. 子类访问父类静态变量，只触发父类初始化
    //         System.out.println(B.a);
            // 4. 会初始化类 B，并先初始化类 A
    //         Class.forName("cn.ali.jvm.test.classload.B");
        }
    
    }
    
    
    class A {
        static int a = 0;
        static {
            System.out.println("a init");
        }
    }
    class B extends A {
        final static double b = 5.0;
        static boolean c = false;
        static {
            System.out.println("b init");
        }
    }
    

### 4）练习

从字节码分析，使用 a，b，c 这三个常量是否会导致 E 初始化

    public class Load2 {
    
        public static void main(String[] args) {
            System.out.println(E.a);
            System.out.println(E.b);
            // 会导致 E 类初始化，因为 Integer 是包装类
            System.out.println(E.c);
        }
    }
    
    class E {
        public static final int a = 10;
        public static final String b = "hello";
        public static final Integer c = 20;
    
        static {
            System.out.println("E cinit");
        }
    }


​    

典型应用 - 完成懒惰初始化单例模式

    public class Singleton {
    
        private Singleton() { } 
        // 内部类中保存单例
        private static class LazyHolder { 
            static final Singleton INSTANCE = new Singleton(); 
        }
        // 第一次调用 getInstance 方法，才会导致内部类加载和初始化其静态成员 
        public static Singleton getInstance() { 
            return LazyHolder.INSTANCE; 
        }
    }


​    

以上的实现特点是：

*   懒惰实例化
*   初始化时的线程安全是有保障的

5、类加载器
------

类加载器虽然只用于实现类的加载动作，但它在Java程序中起到的作用却远超类加载阶段  
对于任意一个类，都必须由加载它的类加载器和这个类本身一起共同确立其在 Java 虚拟机中的唯一性，每一个类加载器，都拥有一个独立的类名称空间。这句话可以表达得更通俗一些：比较两个类是否“相等”，只有在这两个类是由同一个类加载器加载的前提下才有意义，否则，即使这两个类来源于同一个 Class 文件，被同一个 Java 虚拟机加载，只要加载它们的类加载器不同，那这两个类就必定不相等！  
以JDK 8为例

名称

加载的类

说明

Bootstrap ClassLoader（启动类加载器）

JAVA\_HOME/jre/lib

无法直接访问

Extension ClassLoader(拓展类加载器)

JAVA\_HOME/jre/lib/ext

上级为Bootstrap，显示为null

Application ClassLoader(应用程序类加载器)

classpath

上级为Extension

自定义类加载器

自定义

上级为Application

### 1）启动类的加载器

可通过在控制台输入指令，使得类被启动类加器加载

### 2）扩展类的加载器

如果 classpath 和 JAVA\_HOME/jre/lib/ext 下有同名类，加载时会使用拓展类加载器加载。当应用程序类加载器发现拓展类加载器已将该同名类加载过了，则不会再次加载。

### 3）双亲委派模式

双亲委派模式，即调用类加载器ClassLoader 的 loadClass 方法时，查找类的规则。  
loadClass源码

    protected Class<?> loadClass(String name, boolean resolve)
        throws ClassNotFoundException
    {
        synchronized (getClassLoadingLock(name)) {
            // 首先查找该类是否已经被该类加载器加载过了
            Class<?> c = findLoadedClass(name);
            // 如果没有被加载过
            if (c == null) {
                long t0 = System.nanoTime();
                try {
                    // 看是否被它的上级加载器加载过了 Extension 的上级是Bootstarp，但它显示为null
                    if (parent != null) {
                        c = parent.loadClass(name, false);
                    } else {
                        // 看是否被启动类加载器加载过
                        c = findBootstrapClassOrNull(name);
                    }
                } catch (ClassNotFoundException e) {
                    // ClassNotFoundException thrown if class not found
                    // from the non-null parent class loader
                    //捕获异常，但不做任何处理
                }
    
                if (c == null) {
                    // 如果还是没有找到，先让拓展类加载器调用 findClass 方法去找到该类，如果还是没找到，就抛出异常
                    // 然后让应用类加载器去找 classpath 下找该类
                    long t1 = System.nanoTime();
                    c = findClass(name);
    
                    // 记录时间
                    sun.misc.PerfCounter.getParentDelegationTime().addTime(t1 - t0);
                    sun.misc.PerfCounter.getFindClassTime().addElapsedTimeFrom(t1);
                    sun.misc.PerfCounter.getFindClasses().increment();
                }
            }
            if (resolve) {
                resolveClass(c);
            }
            return c;
        }
    }


### 4）自定义类加载器

**使用场景**

*   想加载非 classpath 随意路径中的类文件
*   通过接口来使用实现，希望解耦时，常用在框架设计
*   这些类希望予以隔离，不同应用的同名类都可以加载，不冲突，常见于 tomcat 容器

**步骤**

*   继承 ClassLoader 父类
*   要遵从双亲委派机制，重写 ﬁndClass 方法  
    不是重写 loadClass 方法，否则不会走双亲委派机制
*   读取类文件的字节码
*   调用父类的 deﬁneClass 方法来加载类
*   使用者调用该类加载器的 loadClass 方法

**破坏双亲委派模式**

*   双亲委派模型的第一次“被破坏”其实发生在双亲委派模型出现之前——即JDK1.2面世以前的“远古”时代
    *   建议用户重写findClass()方法，在类加载器中的loadClass()方法中也会调用该方法
*   双亲委派模型的第二次“被破坏”是由这个模型自身的缺陷导致的
    *   如果有基础类型又要调用回用户的代码，此时也会破坏双亲委派模式
*   双亲委派模型的第三次“被破坏”是由于用户对程序动态性的追求而导致的
    *   这里所说的“动态性”指的是一些非常“热”门的名词：代码热替换（Hot Swap）、模块热部署（Hot Deployment）等

6、运行期优化
-------

### 1）即时编译

**分层编译**  
JVM 将执行状态分成了 5 个层次：

*   0层：解释执行，用解释器将字节码翻译为机器码
*   1层：使用 C1 即时编译器编译执行（不带 proﬁling）
*   2层：使用 C1 即时编译器编译执行（带基本的profiling）
*   3层：使用 C1 即时编译器编译执行（带完全的profiling）
*   4层：使用 C2 即时编译器编译执行

proﬁling 是指在运行过程中收集一些程序执行状态的数据，例如【方法的调用次数】，【循环的 回边次数】等

即时编译器（JIT）与解释器的区别

*   解释器
    *   将字节码解释为机器码，下次即使遇到相同的字节码，仍会执行重复的解释
    *   是将字节码解释为针对所有平台都通用的机器码
*   即时编译器
    *   将一些字节码编译为机器码，并存入 Code Cache，下次遇到相同的代码，直接执行，无需再编译
    *   根据平台类型，生成平台特定的机器码

对于大部分的不常用的代码，我们无需耗费时间将其编译成机器码，而是采取解释执行的方式运行；另一方面，对于仅占据小部分的热点代码，我们则可以将其编译成机器码，以达到理想的运行速度。 执行效率上简单比较一下 Interpreter < C1 < C2，总的目标是发现热点代码（hotspot名称的由 来），并优化这些热点代码。  
**逃逸分析**  
逃逸分析（Escape Analysis）简单来讲就是，Java Hotspot 虚拟机可以分析新创建对象的使用范围，并决定是否在 Java 堆上分配内存的一项技术

逃逸分析的 JVM 参数如下：

*   开启逃逸分析：-XX:+DoEscapeAnalysis
*   关闭逃逸分析：-XX:-DoEscapeAnalysis
*   显示分析结果：-XX:+PrintEscapeAnalysis

逃逸分析技术在 Java SE 6u23+ 开始支持，并默认设置为启用状态，可以不用额外加这个参数

对象逃逸状态

全局逃逸（GlobalEscape）

*   即一个对象的作用范围逃出了当前方法或者当前线程，有以下几种场景：
    *   对象是一个静态变量
    *   对象是一个已经发生逃逸的对象
    *   对象作为当前方法的返回值

参数逃逸（ArgEscape）

*   即一个对象被作为方法参数传递或者被参数引用，但在调用过程中不会发生全局逃逸，这个状态是通过被调方法的字节码确定的

没有逃逸

*   即方法中的对象没有发生逃逸

**逃逸分析优化**  
针对上面第三点，当一个对象没有逃逸时，可以得到以下几个虚拟机的优化

**锁消除**  
我们知道线程同步锁是非常牺牲性能的，当编译器确定当前对象只有当前线程使用，那么就会移除该对象的同步锁  
例如，StringBuffer 和 Vector 都是用 synchronized 修饰线程安全的，但大部分情况下，它们都只是在当前线程中用到，这样编译器就会优化移除掉这些锁操作  
锁消除的 JVM 参数如下：

*   开启锁消除：-XX:+EliminateLocks
*   关闭锁消除：-XX:-EliminateLocks

锁消除在 JDK8 中都是默认开启的，并且锁消除都要建立在逃逸分析的基础上

**标量替换**  
首先要明白标量和聚合量，基础类型和对象的引用可以理解为标量，它们不能被进一步分解。而能被进一步分解的量就是聚合量，比如：对象  
对象是聚合量，它又可以被进一步分解成标量，将其成员变量分解为分散的变量，这就叫做标量替换。

这样，如果一个对象没有发生逃逸，那压根就不用创建它，只会在栈或者寄存器上创建它用到的成员标量，节省了内存空间，也提升了应用程序性能  
标量替换的 JVM 参数如下：

*   开启标量替换：-XX:+EliminateAllocations
*   关闭标量替换：-XX:-EliminateAllocations
*   显示标量替换详情：-XX:+PrintEliminateAllocations

标量替换同样在 JDK8 中都是默认开启的，并且都要建立在逃逸分析的基础上

**栈上分配**  
当对象没有发生逃逸时，该对象就可以通过标量替换分解成成员标量分配在栈内存中，和方法的生命周期一致，随着栈帧出栈时销毁，减少了 GC 压力，提高了应用程序性能

**方法内联**  
**内联函数**  
内联函数就是在程序编译时，编译器将程序中出现的内联函数的调用表达式用内联函数的函数体来直接进行替换

**JVM内联函数**  
C++ 是否为内联函数由自己决定，Java 由编译器决定。Java 不支持直接声明为内联函数的，如果想让他内联，你只能够向编译器提出请求: 关键字 final 修饰 用来指明那个函数是希望被 JVM 内联的，如

    public final void doSomething() {  
            // to do something  
    }


总的来说，一般的函数都不会被当做内联函数，只有声明了final后，编译器才会考虑是不是要把你的函数变成内联函数

JVM内建有许多运行时优化。首先短方法更利于JVM推断。流程更明显，作用域更短，副作用也更明显。如果是长方法JVM可能直接就跪了。

第二个原因则更重要：方法内联

如果JVM监测到一些小方法被频繁的执行，它会把方法的调用替换成方法体本身，如：

    private int add4(int x1, int x2, int x3, int x4) { 
    		//这里调用了add2方法
            return add2(x1, x2) + add2(x3, x4);  
        }  
    
        private int add2(int x1, int x2) {  
            return x1 + x2;  
        }


方法调用被替换后

    private int add4(int x1, int x2, int x3, int x4) {  
        	//被替换为了方法本身
            return x1 + x2 + x3 + x4;  
        }


### 2）反射优化

    public class Reflect1 {
       public static void foo() {
          System.out.println("foo...");
       }
    
       public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
          Method foo = Demo3.class.getMethod("foo");
          for(int i = 0; i<=16; i++) {
             foo.invoke(null);
          }
       }
    }


foo.invoke 前面 0 ~ 15 次调用使用的是 MethodAccessor 的 NativeMethodAccessorImpl 实现  
invoke 方法源码

    @CallerSensitive
    public Object invoke(Object obj, Object... args)
        throws IllegalAccessException, IllegalArgumentException,
           InvocationTargetException
    {
        if (!override) {
            if (!Reflection.quickCheckMemberAccess(clazz, modifiers)) {
                Class<?> caller = Reflection.getCallerClass();
                checkAccess(caller, clazz, obj, modifiers);
            }
        }
        //MethodAccessor是一个接口，有3个实现类，其中有一个是抽象类
        MethodAccessor ma = methodAccessor;             // read volatile
        if (ma == null) {
            ma = acquireMethodAccessor();
        }
        return ma.invoke(obj, args);
    }


![](https://img-blog.csdnimg.cn/20210211225135924.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)  
会由 DelegatingMehodAccessorImpl 去调用 NativeMethodAccessorImpl  
NativeMethodAccessorImpl 源码

    class NativeMethodAccessorImpl extends MethodAccessorImpl {
        private final Method method;
        private DelegatingMethodAccessorImpl parent;
        private int numInvocations;
    
        NativeMethodAccessorImpl(Method var1) {
            this.method = var1;
        }
    	
    	//每次进行反射调用，会让numInvocation与ReflectionFactory.inflationThreshold的值（15）进行比较，并使使得numInvocation的值加一
    	//如果numInvocation>ReflectionFactory.inflationThreshold，则会调用本地方法invoke0方法
        public Object invoke(Object var1, Object[] var2) throws IllegalArgumentException, InvocationTargetException {
            if (++this.numInvocations > ReflectionFactory.inflationThreshold() && !ReflectUtil.isVMAnonymousClass(this.method.getDeclaringClass())) {
                MethodAccessorImpl var3 = (MethodAccessorImpl)(new MethodAccessorGenerator()).generateMethod(this.method.getDeclaringClass(), this.method.getName(), this.method.getParameterTypes(), this.method.getReturnType(), this.method.getExceptionTypes(), this.method.getModifiers());
                this.parent.setDelegate(var3);
            }
    
            return invoke0(this.method, var1, var2);
        }
    
        void setParent(DelegatingMethodAccessorImpl var1) {
            this.parent = var1;
        }
    
        private static native Object invoke0(Method var0, Object var1, Object[] var2);
    }


    //ReflectionFactory.inflationThreshold()方法的返回值
    private static int inflationThreshold = 15;


*   一开始if条件不满足，就会调用本地方法 invoke0
*   随着 numInvocation 的增大，当它大于 ReflectionFactory.inflationThreshold 的值 16 时，就会本地方法访问器替换为一个运行时动态生成的访问器，来提高效率
    *   这时会从反射调用变为正常调用，即直接调用 Reflect1.foo()

![](https://img-blog.csdnimg.cn/20210211225248176.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl81MDI4MDU3Ng==,size_16,color_FFFFFF,t_70)

阿里开源工具：arthas-boot
