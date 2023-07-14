 

JVM-内存结构
========

本文章参考：[黑马程序员JVM](https://www.bilibili.com/video/BV1yE411Z7AP?from=search&seid=13392535664451499162&spm_id_from=333.337.0.0)

**整体架构**：

![](https://img-blog.csdnimg.cn/img_convert/bbd05cdb71e1f11768047912d80203b7.png)

1.程序计数器
-------

### 1-1 定义

Program Counter Register 程序计数器（寄存器）

### 1-2 作用

用于保存JVM中下一条所要执行的指令的地址。

PC 寄存器用来存储指向下一条指令的地址，即将要执行的指令代码。由执行引擎读取下一条指令。

### 1-3 特点

*   **是线程私有的**
    *   CPU会为每个线程分配时间片，当当前线程的时间片使用完以后，CPU就会去执行另一个线程中的代码
    *   程序计数器是每个线程所私有的，当另一个线程的时间片用完，又返回来执行当前线程的代码时，通过程序计数器可以知道应该执行哪一句指令
*   **不会存在内存溢出**

2.虚拟机栈
------

### 2-1 定义

*   每个**线程**运行需要的内存空间，称为**虚拟机栈**
*   每个栈由多个**栈帧**组成，对应着每次方法调用时所占用的内存空间
*   每个线程只能有一个**活动栈帧**，对应当前正在执行的那个方法

![](https://img-blog.csdnimg.cn/9c43f6c6da6a48988a67bdd9928b8cad.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

### 2-2 演示

```java
public class main1 {
    public static void main(String[] args) {
        method1();
    }
    
    public static void method1() {
        method2(1, 2);
    }
    
    public static int method2(int a, int b) {
        int c = a + b;
        return c;
    }
}
```


 


![](https://img-blog.csdnimg.cn/92278128d3734a0a9779673dd7b791b3.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

### 2-3 常见问题

1.  垃圾回收是否涉及栈内存？
    
    **不需要**。因为虚拟机栈中是由一个个栈帧组成的，在方法执行完毕后，对应的栈帧就会被弹出栈。所以无需通过垃圾回收机制去回收内存。
    
2.  栈内存分配越大越好吗？
    
    不是。因为**物理内存是一定的**，栈内存越大，可以支持更多的递归调用，但是可执行的线程数就会越少。
    
3.  方法内的局部变量是否线程安全？
    
    *   如果方法内部**局部变量没有逃离方法的作用访问**，它是线程安全的
    *   如果是**局部变量引用了对象**，并**逃离方法的范围**，需要考虑线程安全问题
    
    例如：
    
        public class main1 {
            public static void main(String[] args) {
        
            }
            //下面各个方法会不会造成线程安全问题？
        
            //不会
            public static void m1() {
                StringBuilder sb = new StringBuilder();
                sb.append(1);
                sb.append(2);
                sb.append(3);
                System.out.println(sb.toString());
            }
        
            //会，可能会有其他线程使用这个对象
            public static void m2(StringBuilder sb) {
                sb.append(1);
                sb.append(2);
                sb.append(3);
                System.out.println(sb.toString());
            }
        
            //会，其他线程可能会拿到这个线程的引用
            public static StringBuilder m3() {
                StringBuilder sb = new StringBuilder();
                sb.append(1);
                sb.append(2);
                sb.append(3);
                return sb;
            }
            
        }
    
    

### 2-4 栈内存溢出

**`Java.lang.stackOverflowError`** 栈内存溢出

**导致栈内存溢出的情况**：

*   **栈帧过多**导致栈内存溢出
*   **栈帧过大**导致栈内存溢出

**设置虚拟机栈内存大小**：

![](https://img-blog.csdnimg.cn/d808329794ad4f1ea70a113f8c408760.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

### 2-5 线程运行诊断

案例：CPU占用过高

Linux环境下运行某些程序的时候，可能导致CPU的占用过高，这时需要定位占用CPU过高的线程

*   用`top`定位哪个进程对cpu的占用过高
*   `ps H -eo pid,tid,%cpu | grep 进程id` ，刚才通过top查到的进程号，用ps命令进一步定位是哪个线程引起的cpu占用过高
*   `jstack 进程id`，通过查看进程中的线程的nid，刚才通过ps命令看到的tid来**对比定位**，注意jstack查找出的线程id是**16进制的**，**需要转换**

3.本地方法栈
-------

一些带有**native关键字**的方法就是需要JAVA去调用本地的C或者C++方法，因为JAVA有时候没法直接和操作系统底层交互，所以需要用到本地方法。

4.堆
---

### 4-1 定义

通过**new关键字创建的对象**都会使用堆内存

### 4-2 特点

*   它是**线程共享**的，堆中对象都需要考虑线程安全的问题
*   有垃圾回收机制

### 4-3 堆内存溢出

`java.lang.OutofMemoryError ：java heap space` 堆内存溢出

案例：

```java
/**
 * 演示堆内存溢出 java.lang.OutOfMemoryError: Java heap space
 * -Xmx8m ，最大堆空间的jvm虚拟机参数，默认是4g
 */
public class main1 {
    public static void main(String[] args) {
        int i = 0;

        try {
            ArrayList<String> list = new ArrayList<>();// new 一个list 存入堆中
            String a = "hello";
            while (true) {
                list.add(a);// 不断地向list 中添加 a
                a = a + a;
                i++;
            }
        } catch (Throwable e) {// list 使用结束，被jc 垃圾回收
            e.printStackTrace();
            System.out.println(i);
        }
    }
}
```


结果：

    java.lang.OutOfMemoryError: Java heap space
    	at java.util.Arrays.copyOf(Arrays.java:3332)
    	at java.lang.AbstractStringBuilder.ensureCapacityInternal(AbstractStringBuilder.java:124)
    	at java.lang.AbstractStringBuilder.append(AbstractStringBuilder.java:448)
    	at java.lang.StringBuilder.append(StringBuilder.java:136)
    	at com.itcast.itheima.xpp.main1.main(main1.java:14)
    22


### 4-4 堆内存诊断

1.  **jps 工具**
    
    查看当前系统中有哪些 java 进程
    
2.  **jmap 工具**
    
    查看堆内存占用情况 `jmap - heap 进程id`
    
3.  **jconsole 工具**
    
    图形界面的，多功能的监测工具，可以连续监测
    

5.方法区
-----

### 5-1 定义

方法区是各个**线程共享**的内存区域，它用于\*\*存储已被虚拟机加载的类信息(比如class文件)、常量、静态变量、即时编译器编译后的代码等数据。（\*\*什么是类信息：**类版本号、方法、接口**。）

### 5-2 结构

*   **永久代**用的**堆内存**
*   **元空间**用的**本地内存**

![](https://img-blog.csdnimg.cn/img_convert/659c8b4c3800faded359f155b7a85e40.png)

### 5-3 方法区内存溢出

*   1.8以前会导致**永久代**内存溢出`java.lang.OutOfMemoryError: PermGen space`
*   1.8以后会导致**元空间**内存溢出`java.lang.OutOfMemoryError: Metaspace`

案例：

调整虚拟机参数：

![](https://img-blog.csdnimg.cn/be7ce1de079c435896a613cd7fb3dc99.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

    /**
     * 演示元空间内存溢出:java.lang.OutOfMemoryError: Metaspace
     * -XX:MaxMetaspaceSize=8m
     */
    public class main1 extends ClassLoader {//可以用来加载类的二进制字节码
    
        public static void main(String[] args) {
            int j = 0;
            try {
                main1 test = new main1();
                for (int i = 0; i < 10000; i++,j++) {
                    //ClassWriter 作用是生产类的二进制字节码
                    ClassWriter cw = new ClassWriter(0);
                    //版本号，public，类名
                    cw.visit(Opcodes.V1_8, Opcodes.ACC_PUBLIC, "Class" + i, null, "java/lang/Object", null);
                    //返回 byte[]
                    byte[] code = cw.toByteArray();
                    //执行类的加载
                    test.defineClass("Class" + i, code, 0, code.length);
                }
            } finally {
                System.out.println(j);
            }
        }
    }


    Exception in thread "main" java.lang.OutOfMemoryError: Metaspace
    	at java.lang.ClassLoader.defineClass1(Native Method)
    	at java.lang.ClassLoader.defineClass(ClassLoader.java:763)
    	at java.lang.ClassLoader.defineClass(ClassLoader.java:642)
    	at com.itcast.itheima.xpp.main1.main(main1.java:26)
    4865
    
    Process finished with exit code 1


### 5-4 通过[反编译](https://so.csdn.net/so/search?q=%E5%8F%8D%E7%BC%96%E8%AF%91&spm=1001.2101.3001.7020)来查看类的信息

*   获得对应类的.class文件，`javac xxx.java`
    
    *   在JDK对应的bin目录下运行cmd，**也可以在IDEA控制台输入**
        
        ![](https://img-blog.csdnimg.cn/3bcff13749ae4090ab86f56527255eda.png)
        
    *   输入 **javac 对应类的绝对路径**
        
            F:\JAVA\JDK8.0\bin>javac F:\Thread_study\src\com\nyima\JVM\day01\Main.java
        
        
        输入完成后，对应的目录下就会出现类的.class文件
    
*   在控制台输入 `javap -v 类的绝对路径`
    
        javap -v F:\Thread_study\src\com\nyima\JVM\day01\Main.class
    
*   然后能在控制台看到反编译以后类的信息了
    
    *   类的基本信息
        
        ![](https://img-blog.csdnimg.cn/img_convert/8d75911e6449a7a80652df58c26a5510.png)
        
    *   常量池
        
        ![](https://img-blog.csdnimg.cn/img_convert/1bf3e06fe2698663b7c2a4f2afff77f6.png)
        
        ![](https://img-blog.csdnimg.cn/img_convert/30090163055fd78171c1248282fe2c81.png)
        
    *   虚拟机中执行编译的方法（框内的是真正编译执行的内容，**#号的内容需要在常量池中查找**）
        
        ![](https://img-blog.csdnimg.cn/img_convert/d73eaadde871678992f577199ae90522.png)
        

### 5-5 运行时常量池

*   **常量池**：就是一张表，虚拟机指令根据这张常量表找到要执行的类名、方法名、参数类型、字面量等信息
*   **运行时常量池**：常量池是 \*.class 文件中的，当该类被加载，它的常量池信息就会放入运行时常量池，并把里面的符号地址变为真实地址

### 5-6 常量池与串池StringTable的关系

**StringTable 特性**

*   常量池中的字符串仅是符号，只有**在被用到时才会转化为对象**
*   利用串池的机制，来避免重复创建字符串对象
*   字符串**变量**拼接的原理是**StringBuilder**
*   字符串**常量**拼接的原理是**编译器优化**
*   可以使用**intern方法**，主动将串池中还没有的字符串对象放入串池中
    *   1.8 将这个字符串对象尝试放入串池，如果有则并不会放入，如果没有则放入串池，会把串池中的对象返回
    *   1.6 将这个字符串对象尝试放入串池，如果有则并不会放入，如果没有会把此对象复制一份，放入串池，会把串池中的对象返回

**栗子1**：

    public class StringTableStudy {
    	public static void main(String[] args) {
    		String a = "a"; 
    		String b = "b";
    		String ab = "ab";
    	}
    }


常量池中的信息，都会被加载到运行时常量池中，但这是a b ab 仅是常量池中的符号，**还没有成为java字符串**

    0: ldc           #2                  // String a
    2: astore_1
    3: ldc           #3                  // String b
    5: astore_2
    6: ldc           #4                  // String ab
    8: astore_3
    9: return


当执行到 ldc #2 时，会把符号 a 变为 “a” 字符串对象，**并放入串池中**（hashtable结构 不可扩容）

当执行到 ldc #3 时，会把符号 b 变为 “b” 字符串对象，并放入串池中

当执行到 ldc #4 时，会把符号 ab 变为 “ab” 字符串对象，并放入串池中

最终**StringTable \[“a”, “b”, “ab”\]**

**注意**：字符串对象的创建都是**懒惰的**，只有当运行到那一行字符串且在串池中不存在的时候（如 ldc #2）时，该字符串才会被创建并放入串池中。

**栗子2**：使用拼接**字符串变量对象**创建字符串的过程

    public class HelloWorld {
        public static void main(String[] args) {
            String s1 = "a";
            String s2 = "b";
            String s3 = "ab";
            String s4=s1+s2;//new StringBuilder().append("a").append("2").toString()  new String("ab")
            System.out.println(s3==s4);//false
    //结果为false,因为s3是存在于串池之中，s4是由StringBuffer的toString方法所返回的一个对象，存在于堆内存之中
        }
    }


反编译后的结果

    	 Code:
          stack=2, locals=5, args_size=1
             0: ldc           #2                  // String a
             2: astore_1
             3: ldc           #3                  // String b
             5: astore_2
             6: ldc           #4                  // String ab
             8: astore_3
             9: new           #5                  // class java/lang/StringBuilder
            12: dup
            13: invokespecial #6                  // Method java/lang/StringBuilder."<init>":()V
            16: aload_1
            17: invokevirtual #7                  // Method java/lang/StringBuilder.append:(Ljava/lang/String
    ;)Ljava/lang/StringBuilder;
            20: aload_2
            21: invokevirtual #7                  // Method java/lang/StringBuilder.append:(Ljava/lang/String
    ;)Ljava/lang/StringBuilder;
            24: invokevirtual #8                  // Method java/lang/StringBuilder.toString:()Ljava/lang/Str
    ing;
            27: astore        4
            29: return


*   通过拼接的方式来创建字符串的**过程**是：`StringBuilder().append(“a”).append(“b”).toString()`
*   最后的toString方法的返回值是一个**新的字符串**，但字符串的**值**和拼接的字符串一致，但是两个不同的字符串，**一个存在于串池之中，一个存在于堆内存之中**

**栗子3**：使用**拼接字符串常量对象**的方法创建字符串

    public class HelloWorld {
        public static void main(String[] args) {
            String s1 = "a";
            String s2 = "b";
            String s3 = "ab";
            String s4=s1+s2;//new StringBuilder().a|ppend("a").append("2").toString()  new String("ab")
            String s5="a"+"b";
            System.out.println(s5==s3);//true
        }
    }


反编译后的结果

     	  Code:
          stack=2, locals=6, args_size=1
             0: ldc           #2                  // String a
             2: astore_1
             3: ldc           #3                  // String b
             5: astore_2
             6: ldc           #4                  // String ab
             8: astore_3
             9: new           #5                  // class java/lang/StringBuilder
            12: dup
            13: invokespecial #6                  // Method java/lang/StringBuilder."<init>":()V
            16: aload_1
            17: invokevirtual #7                  // Method java/lang/StringBuilder.append:(Ljava/lang/String
    ;)Ljava/lang/StringBuilder;
            20: aload_2
            21: invokevirtual #7                  // Method java/lang/StringBuilder.append:(Ljava/lang/String
    ;)Ljava/lang/StringBuilder;
            24: invokevirtual #8                  // Method java/lang/StringBuilder.toString:()Ljava/lang/Str
    ing;
            27: astore        4
            //ab3初始化时直接从串池中获取字符串
            29: ldc           #4                  // String ab
            31: astore        5
            33: return


*   使用**拼接字符串常量**的方法来创建新的字符串时，因为**内容是常量，javac在编译期会进行优化，结果已在编译期确定为ab**，而创建ab的时候已经在串池中放入了“ab”，所以s5直接从串池中获取值，所以进行的操作和 s3= “ab” 一致。
*   使用**拼接字符串变量**的方法来创建新的字符串时，因为内容是变量，只能**在运行期确定它的值，所以需要使用StringBuilder来创建**

**intern方法 1.8**：

调用字符串对象的intern方法，会将该字符串对象尝试放入到串池中

*   如果串池中没有该字符串对象，则放入成功
*   如果有该字符串对象，则放入失败

无论放入是否成功，都会返回**串池中**的字符串对象

例子：

    public class HelloWorld {
    
        public static void main(String[] args) {
            String x = "ab";
            String s = new String("a") + new String("b");
    
            String s2 = s.intern();//将这个字符串对象尝试放入串池，如果有则并不会放入，如果没有则放入串池，这两种情况都会把串池中的对象返回
            System.out.println(s2 == x);//true
            System.out.println(s == x);//false
        }
    }


​    

**intern方法 1.6**：

调用字符串对象的intern方法，会将该字符串对象尝试放入到串池中

*   如果串池中没有该字符串对象，会将该字符串对象复制一份，再放入到串池中
*   如果有该字符串对象，则放入失败

无论放入是否成功，都会返回**串池中**的字符串对象

**面试题（1.8）**：

    package com.itcast.itheima.xpp;
    
    public class main {
        public static void main(String[] args) {
    
            String s1="a";
            String s2="b";
            String s3="a"+"b";
            String s4=s1+s2;
            String s5="ab";
            String s6=s4.intern();
            System.out.println(s3==s4);//false
            System.out.println(s3==s5);//true
            System.out.println(s3==s6);//true
    
            String x2=new String("c")+new String("d");
            String x1="cd";
            x2.intern();
            System.out.println(x1==x2);//false


​    
​            String x4=new String("e")+new String("f");
​            x4.intern();
​            String x3="ef";
​            System.out.println(x3==x4);//true
​    
        }
    }


### 5-7 StringTable 位置

![](https://img-blog.csdnimg.cn/e85e315602a7467a8a6b127f9aea0847.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

*   JDK1.6 时，StringTable是属于**常量池**的一部分。
*   JDK1.8 以后，StringTable是放在**堆**中的。

### 5-8 StringTable 垃圾回收

StringTable在内存紧张时，会发生垃圾回收

### 5-9 StringTable 性能调优

*   因为StringTable是由HashTable实现的，所以可以**适当增加HashTable桶的个数**，来减少字符串放入串池所需要的时间
    
        -XX:StringTableSize=xxxx
        //最低为1009
    
*   考虑是否将字符串对象入池
    
    可以通过**intern方法减少重复入池**，保证相同的地址在StringTable中只存储一份
    

6.直接内存
------

### 6-1 定义

*   属于操作系统，常见于NIO操作时，用于数据缓冲区
*   分配回收成本较高，但读写性能高
*   不受JVM内存回收管理

### 6-2 分配和回收原理

**文件读写过程**：

![](https://img-blog.csdnimg.cn/img_convert/df3797a04274c787028be7b10116d731.png)

**使用了DirectBuffer**：

![](https://img-blog.csdnimg.cn/img_convert/f688365b60531f8660b229a9cf6e232d.png)

直接内存是操作系统和Java代码**都可以访问的一块区域**，无需将代码从系统内存复制到Java堆内存，从而提高了效率

**直接内存也会导致内存溢出**

```java
public class Main {
    static int _100MB = 1024 * 1024 * 100;

    public static void main(String[] args) throws IOException {
        List<ByteBuffer> list = new ArrayList<>();
        int i = 0;
        try {
            while (true) {
                ByteBuffer byteBuffer = ByteBuffer.allocateDirect(_100MB);
                list.add(byteBuffer);
                i++;
            }
        } finally {
            System.out.println(i);
        }

    }
}
//输出：
2
Exception in thread "main" java.lang.OutOfMemoryError: Direct buffer memory
	at java.nio.Bits.reserveMemory(Bits.java:694)
	at java.nio.DirectByteBuffer.<init>(DirectByteBuffer.java:123)
	at java.nio.ByteBuffer.allocateDirect(ByteBuffer.java:311)
	at main.Main.main(Main.java:19)
```

**直接内存释放原理**：

直接内存的回收不是通过JVM的垃圾回收来释放的，而是通过`unsafe.freeMemory`来手动释放

通过申请直接内存，但JVM并不能回收直接内存中的内容，它是如何实现回收的呢？

    //通过ByteBuffer申请1M的直接内存
    ByteBuffer byteBuffer = ByteBuffer.allocateDirect(_1M);


**allocateDirect的实现**：

    public static ByteBuffer allocateDirect(int capacity) {
        return new DirectByteBuffer(capacity);
    }


**DirectByteBuffer类**：

    DirectByteBuffer(int cap) {   // package-private
    
        super(-1, 0, cap, cap);
        boolean pa = VM.isDirectMemoryPageAligned();
        int ps = Bits.pageSize();
        long size = Math.max(1L, (long)cap + (pa ? ps : 0));
        Bits.reserveMemory(size, cap);
    
        long base = 0;
        try {
            base = unsafe.allocateMemory(size); //申请内存
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
        cleaner = Cleaner.create(this, new Deallocator(base, size, cap)); //通过虚引用，来实现直接内存的释放，this为虚引用的实际对象
        att = null;
    }


这里调用了一个Cleaner的create方法，且后台线程还会对虚引用的对象监测，如果虚引用的实际对象（这里是DirectByteBuffer）被回收以后，就会调用Cleaner的clean方法，来清除直接内存中占用的内存

    public void clean() {
        if (remove(this)) {
            try {
                this.thunk.run(); //调用run方法
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


**run方法**：

    public void run() {
        if (address == 0) {
            // Paranoia
            return;
        }
        unsafe.freeMemory(address); //释放直接内存中占用的内存
        address = 0;
        Bits.unreserveMemory(size, capacity);
    }


**直接内存的回收机制总结**：

* 使用了 `Unsafe` 对象完成直接内存的分配回收，并且回收需要主动调用 `freeMemory` 方法

* `ByteBuffer` 的实现类内部，使用了 `Cleaner` （虚引用）来监测 ByteBuffer 对象，一旦 ByteBuffer 对象被垃圾回收，那么就会由 `ReferenceHandler` 线程通过 Cleaner 的 clean 方法调 用 freeMemory 来释放直接内存

  

JVM-垃圾回收
========

本文章参考：[黑马程序员JVM](https://www.bilibili.com/video/BV1yE411Z7AP?from=search&seid=1095777430746967320&spm_id_from=333.337.0.0)

1.如何判断对象可以回收
------------

### 1-1 引用计数法

*   当一个对象被其他变量引用，该对象计数加一，当某个变量不在引用该对象，其计数减一
*   当一个对象引用没有被其他变量引用时，即计数变为0时，该对象就可以被回收

**缺点**：循环引用时，两个对象的计数都为1，导致两个对象都无法被释放

![](https://img-blog.csdnimg.cn/img_convert/e9fea701505de0721018388d2a8f2ac2.png)

### 1-2 可达性分析算法

*   JVM中的垃圾回收器通过**可达性分析**来探索所有存活的对象
*   扫描堆中的对象，看能否沿着**GC Root**对象为起点的引用链找到该对象，如果**找不到**，则表示**可以回收**
*   可以作为**GC Root**的对象
    *   虚拟机栈（栈帧中的本地变量表）中引用的对象。
    *   方法区中类静态属性引用的对象
    *   方法区中常量引用的对象
    *   本地方法栈中JNI（即一般说的Native方法）引用的对象
    *   所有被同步锁（synchronized关键字）持有的对象。

### 1-3 五种引用

![](https://img-blog.csdnimg.cn/img_convert/ed9053cdd13ed0501843405e622f97e5.png)

1.  **强引用**
    *   只有所有 GC Roots 对象都不通过【强引用】引用该对象，该对象才能被垃圾回收
2.  **软引用**
    *   仅有【软引用】引用该对象时，在垃圾回收后，**内存仍不足**时会再次出发垃圾回收，回收软引用对象
    *   可以配合【引用队列】来释放软引用自身
3.  **弱引用**
    *   仅有【弱引用】引用该对象时，在垃圾回收时，**无论内存是否充足**，都会回收弱引用对象
    *   可以配合【引用队列】来释放弱引用自身
4.  **虚引用**
    *   必须配合【引用队列】使用，主要配合 `ByteBuffer` 使用，被引用对象回收时，会将【虚引用】入队， 由 `Reference Handler` 线程调用虚引用相关方法释放【直接内存】
    *   如上图，B对象不再引用`ByteBuffer`对象，`ByteBuffer`就会被回收。但是直接内存中的内存还未被回收。这时需要将虚引用对象`Cleaner`放入引用队列中，然后调用它的`clean`方法来释放直接内存
5.  **终结器引用**
    *   无需手动编码，但其内部配合【引用队列】使用，在垃圾回收时，【终结器引用】入队（被引用对象暂时没有被回收），再由 `Finalizer` 线程通过【终结器引用】找到被引用对象并调用它的 `finalize` 方法，第二次 GC 时才能回收被引用对象
    *   如上图，B对象不再引用A4对象。这时终结器对象就会被放入引用队列中，引用队列会根据它，找到它所引用的对象。然后调用被引用对象的`finalize`方法。调用以后，该对象就可以被垃圾回收了

**软引用使用**：

    public class Demo1 {
    	public static void main(String[] args) {
    		final int _4M = 4*1024*1024;
    		//使用软引用对象 list和SoftReference是强引用，而SoftReference和byte数组则是软引用
    		List<SoftReference<byte[]>> list = new ArrayList<>();
    		SoftReference<byte[]> ref= new SoftReference<>(new byte[_4M]);
    	}
    }


**软引用\_引用队列使用**：

    public static void main(String[] args) throws IOException {
        ///使用引用队列，用于移除引用为空的软引用对象
        ReferenceQueue<byte[]> queue=new ReferenceQueue<>();
    	//使用软引用对象 list和SoftReference是强引用，而SoftReference和byte数组则是软引用
        List<SoftReference<byte[]>> list = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            //关联了引用队列,当软引用所关联的byte数组被回收时，软引用自己就会加入到引用队列queue 中去
            SoftReference<byte[]> ref = new SoftReference<>(new byte[_4MB],queue);
            System.out.println(ref.get());
            list.add(ref);
            System.out.println(list.size());
        }
        //获取队列中第一个软引用对象
        Reference<? extends byte[]> poll = queue.poll();
    	//遍历引用队列，如果有元素，则移除
        while(poll!=null){
            list.remove(poll);
            poll=queue.poll();
        }
        System.out.println("=============");
        System.out.println("循环结束：" + list.size());
        for (SoftReference<byte[]> ref : list) {
            System.out.println(ref.get());
        }
    }


**弱引用使用**：

弱引用的使用和软引用类似，只是将 `SoftReference` 换为了 `WeakReference`

    public static void main(String[] args) {
        //使用弱引用对象 list和SoftReference是强引用，而SoftReference和byte数组则是弱引用
        List<WeakReference<byte[]>> list=new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            WeakReference<byte[]> ref=new WeakReference<>(new byte[_4MB]);
            list.add(ref);
            for (WeakReference<byte[]> w : list) {
                System.out.print(w.get()+" ");
            }
            System.out.println();
        }
        System.out.println("循环结束："+list.size());
    }


2.垃圾回收算法
--------

### 2-1 标记清除

![](https://img-blog.csdnimg.cn/img_convert/69b7ae20aa310b766cc85271fc0bbcfc.png)

**定义**：在虚拟机执行垃圾回收的过程中，先采用标记算法确定可回收对象，然后垃圾收集器根据标识清除相应的内容，给堆内存腾出相应的空间

> 注意：这里的清除并不是将内存空间字节清零，而是记录这段内存的起始地址，下次分配内存的时候，会直接覆盖这段内存。

**优点**：速度快

**缺点**：容易产生内存碎片。一旦分配较大内存的对象，由于内存不连续，导致无法分配，最后就会造成内存溢出问题

### 2-2 标记整理

![](https://img-blog.csdnimg.cn/img_convert/5e21d908dbaab757a4188acd230fc380.png)

**定义**：在虚拟机执行垃圾回收的过程中，先采用标记算法确定可回收对象，然后整理剩余的对象，将可用的对象移动到一起，使内存更加紧凑，连续的空间就更多。

**优点**：不会有内存碎片

**缺点**：速度慢

### 2-3 复制

![](https://img-blog.csdnimg.cn/img_convert/90d6a4abbff4ea9e22f35256cb975292.png)

![](https://img-blog.csdnimg.cn/img_convert/5749a082831cd48518786ee35721a72f.png)

![](https://img-blog.csdnimg.cn/img_convert/fffe0a24b3937a6650eeab2f26936ea0.png)

**定义**：将内存分为等大小的两个区域，FROM和TO（TO中为空）。将被GC Root引用的对象从FROM放入TO中，再回收不被GC Root引用的对象。然后交换FROM和TO。这样也可以避免内存碎片的问题，但是会占用双倍的内存空间。

**优点**：不会有内存碎片

**缺点**：会占用双倍的内存空间。

3.分代垃圾回收
--------

将堆内存分为**新生代**和**老年代**，新生代有划分为**伊甸园**，**幸存区To**，**幸存区From**。

![](https://img-blog.csdnimg.cn/img_convert/352c08f943bc534b07c8c30c74efc7da.png)

### 3-1 回收流程

对象首先分配在伊甸园区域

![](https://img-blog.csdnimg.cn/img_convert/7160ddb159db9b6b3d557a9551fa1766.png)

新生代空间不足时，触发 **Minor GC**，伊甸园和 from 存活的对象使用 copy 复制到 to 中，存活的对象**年龄加 1**并且交换 from to

![](https://img-blog.csdnimg.cn/img_convert/6b80309437d5a923475fa2e127525cc9.png)

![](https://img-blog.csdnimg.cn/img_convert/b759fea8df6ea38c3ba5d8bcf2f1da55.png)

![](https://img-blog.csdnimg.cn/img_convert/0a181de109826d2d5738f305f89745c0.png)

再次创建对象，若新生代的伊甸园又满了，则会再次触发 **Minor GC**（minor gc 会引发 **stop the world**，暂停其它用户的线程，等垃圾回收结束，用户线程才恢复运行），这时不仅会回收伊甸园中的垃圾，**还会回收幸存区中的垃圾**，再将活跃对象复制到幸存区TO中。回收以后会交换两个幸存区，并让幸存区中的对象**寿命加1**

![](https://img-blog.csdnimg.cn/19042c9475644bf7ad94917d9aeea202.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

当对象寿命超过阈值时，会晋升至老年代，最大寿命是**15**（4bit）

![](https://img-blog.csdnimg.cn/img_convert/f6633c908df8bfea0fcd49b24186fb5a.png)

当老年代空间不足，会先尝试触发**Minor GC**，如果之后空间仍不足，那么触发 **Full GC**，**stop the world**的时间更长

### 3-2 GC 分析

**相关VM参数**

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

XX:+ScavengeBeforeFullGC

**大对象处理策略**

遇到一个较大的对象时，就算新生代的伊甸园为空，也**无法容纳该对象**时，会将该对象**直接晋升为老年代**

    /**
     *  演示内存的分配策略
     */
    public class Main {
        private static final int _512KB = 512 * 1024;
        private static final int _1MB = 1024 * 1024;
        private static final int _6MB = 6 * 1024 * 1024;
        private static final int _7MB = 7 * 1024 * 1024;
        private static final int _8MB = 8 * 1024 * 1024;
        // -Xms20M -Xmx20M -Xmn10M -XX:+UseSerialGC -XX:+PrintGCDetails -verbose:gc -XX:-ScavengeBeforeFullGC
        public static void main(String[] args) throws InterruptedException {
            ArrayList<byte[]> list=new ArrayList<>();
            list.add(new byte[_8MB]);
        }
    
    }


![](https://img-blog.csdnimg.cn/bd78d63c2df94a47a284767572698951.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**线程内存溢出**

某个线程的内存溢出了而抛异常（out of memory），不会让其他的线程结束运行。这是因为当一个线程**抛出OOM异常后**，**它所占据的内存资源会全部被释放掉**，从而不会影响其他线程的运行，**进程依然正常**

```java
/**
 * 演示内存的分配策略
 */
public class Main {
    private static final int _512KB = 512 * 1024;
    private static final int _1MB = 1024 * 1024;
    private static final int _6MB = 6 * 1024 * 1024;
    private static final int _7MB = 7 * 1024 * 1024;
    private static final int _8MB = 8 * 1024 * 1024;

    // -Xms20M -Xmx20M -Xmn10M -XX:+UseSerialGC -XX:+PrintGCDetails -verbose:gc -XX:-ScavengeBeforeFullGC
    public static void main(String[] args) throws InterruptedException {
        new Thread(() -> {
            ArrayList<byte[]> list = new ArrayList<>();
            list.add(new byte[_8MB]);
            list.add(new byte[_8MB]);
        }).start();
		//主线程还是会正常执行
        System.out.println("sleep....");
        Thread.sleep(1000L);
    }
}
```


![](https://img-blog.csdnimg.cn/329598bd19874f9283c9da019b7eaaf7.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

4.垃圾回收器
-------

**相关概念**：

*   **并行收集**：指多条垃圾收集线程并行工作，但此时**用户线程仍处于等待状态**
*   **并发收集**：指用户线程与垃圾收集线程**同时工作**（不一定是并行的可能会交替执行）。用户程序在继续运行，而垃圾收集程序运行在另一个CPU上
*   **吞吐量**：即CPU用于**运行用户代码的时间**与CPU**总消耗时间**的比值（吞吐量 = 运行用户代码时间 / ( 运行用户代码时间 + 垃圾收集时间 )），也就是。例如：虚拟机共运行100分钟，垃圾收集器花掉1分钟，那么吞吐量就是99%

### 4-1 串行

*   单线程
*   堆内存小，适合个人电脑

**开启串行回收器**：

`XX:+UseSerialGC = Serial + SerialOld`，新生代\*\*-Serial\*\* ，老年代-**SerialOld**

![](https://img-blog.csdnimg.cn/img_convert/4f2d92c88e2a93ce063586a61d85a72c.png)

**安全点**：让其他线程都在这个点停下来，以免垃圾回收时移动对象地址，使得其他线程找不到被移动的对象。

**阻塞**：因为是串行的，所以只有一个垃圾回收线程。且在该线程执行回收工作时，其他线程进入**阻塞**状态

**Serial 收集器**：

*   定义：Serial收集器是最基本的、发展历史最悠久的收集器
*   特点：**单线程**收集器。采用**复制**算法。工作在**新生代**

**Serial Old收集器**：

*   定义：Serial Old是Serial收集器的老年代版本
*   特点：**单线程**收集器。采用**标记-整理**算法。工作在**老年代**

### 4-2 [吞吐量](https://so.csdn.net/so/search?q=%E5%90%9E%E5%90%90%E9%87%8F&spm=1001.2101.3001.7020)优先

*   多线程
*   堆内存较大，多核cpu
*   让**单位时间内**暂停时间（STW）最短
*   **JDK1.8默认使用**的垃圾回收器

**开启吞吐量优先回收器**：

![](https://img-blog.csdnimg.cn/ecbbddea32824195ab53bd4d76d92757.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**Parallel 收集器**：

*   定义：与吞吐量关系密切，故也称为吞吐量优先收集器
*   特点：**并行的**，工作于**新生代**，采用**复制**算法

**Parallel Old 收集器**：

*   定义：是Parallel 收集器的老年代版本
*   特点：**并行的**，工作与**老年代**，采用**标记-整理算法**

### 4-3 响应时间优先

*   多线程
*   堆内存较大，多核cpu
*   尽可能让**单次的**暂停时间（STW）最短

![](https://img-blog.csdnimg.cn/img_convert/59307b3ead7530e2f9fedaaf71f5608f.png)

*   **初始标记**：标记GC Roots能直接到的对象。速度很快，存在**Stop The World**
*   **并发标记**：进行GC Roots Tracing 的过程，找出存活对象且用户线程可并发执行
*   **重新标记**：为了**修正并发标记期间**因用户程序继续运行而导致标记产生变动的那一部分对象的标记记录。存在**Stop The World**
*   **并发清理**：对标记的对象进行清除回收

**CMS收集器**：

*   定义：Concurrent Mark Sweep（并发，标记，清除）
*   特点：基于**标记-清除**算法的垃圾回收器。是并发的。工作在**老年代**。

**ParNew 收集器**：

*   定义：ParNew收集器其实就是Serial收集器的多线程版本
*   特点：工作在**新生代**，基于**复制**算法的垃圾回收器。

### 4-4 G1

**定义**：Garbage First

*   JDK 9以后默认使用，而且替代了CMS 收集器

**适用场景**：

*   同时注重**吞吐量（**Throughput）和**低延迟**（Low latency），默认的暂停目标是 200 ms
*   超大堆内存，会将堆划分为多个**大小相等**的 **Region**
*   整体上是 **标记+整理** 算法，两个区域之间是 **复制** 算法

**相关参数**：JDK8 并不是默认开启的，所需要参数开启

![](https://img-blog.csdnimg.cn/13cd5d33ad8c4ea18d2e76c2a706cc72.png)

**垃圾回收阶段**：

![](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608151109.png)

新生代伊甸园垃圾回收—–>内存不足，新生代回收+并发标记—–>混合收集，回收新生代伊甸园、幸存区、老年代内存——>新生代伊甸园垃圾回收（重新开始）

**Young Collection**：

存在**Stop The World**

**分区算法region**：分代是按对象的生命周期划分，分区则是将堆空间划分连续几个不同小区间，每一个小区间独立回收，可以控制一次回收多少个小区间，方便控制 GC 产生的停顿时间

E：伊甸园 S：幸存区 O：老年代

![](https://img-blog.csdnimg.cn/d2b225ae149b41619e41f675f6ff9125.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**Young Collection + CM**：

*   CM：并发标记
*   在 Young GC 时会**对 GC Root 进行初始标记**
*   在老年代**占用堆内存的比例**达到阈值时，对进行并发标记（不会STW），阈值可以根据用户来进行设定

![](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608151150.png)

**Mixed Collection**：

会对E S O 进行**全面的回收**

*   最终标记（Remark）会STW
*   拷贝存活（Evacuation）会STW
*   `-XX:MaxGCPauseMills:xxx` ：用于指定最长的停顿时间

> **问**：为什么有的老年代被拷贝了，有的没拷贝？
>
> 因为指定了最大停顿时间，如果对所有老年代都进行回收，耗时可能过高。为了保证时间不超过设定的停顿时间，会**回收最有价值的老年代**（回收后，能够得到更多内存）

![](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608151201.png)

**Full GC**：

*   **SerialGC**
    *   新生代内存不足发生的垃圾收集 - minor gc
    *   老年代内存不足发生的垃圾收集 - full gc
*   **ParallelGC**
    *   新生代内存不足发生的垃圾收集 - minor gc
    *   老年代内存不足发生的垃圾收集 - full gc
*   **CMS**
    *   新生代内存不足发生的垃圾收集 - minor gc
    *   老年代内存不足
*   **G1**
    *   新生代内存不足发生的垃圾收集 - minor gc
    *   老年代内存不足（老年代所占内存超过阈值）
        *   如果垃圾产生速度慢于垃圾回收速度，不会触发Full GC，还是并发地进行清理
        *   如果垃圾产生速度快于垃圾回收速度，便会触发Full GC

**Young Collection 跨代引用**：

新生代回收的跨代引用（老年代引用新生代）问题

![](https://img-blog.csdnimg.cn/6714d9e1997a456b98935a8788cd3173.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

*   卡表：老年代被划为一个个卡表
*   Remembered Set：Remembered Set 存在于E（新生代）中，用于保存新生代对象对应的脏卡
*   脏卡：O被划分为多个区域（一个区域512K），如果该区域引用了新生代对象，则该区域被称为脏卡
*   在引用变更时通过post-write barried + dirty card queue
*   concurrent refinement threads 更新 Remembered Set

![](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608151222.png)

**Remark**：

重新标记阶段

黑色：已被处理，需要保留的

灰色：正在处理中的

白色：还未处理的

![](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608151229.png)

但是在**并发标记过程中**，有可能A被处理了以后未引用C，但该处理过程还未结束，在处理过程结束之前A引用了C，这时就会用到remark

*   之前C未被引用，这时A引用了C，就会给C加一个写屏障，写屏障的指令会被执行，将C放入一个队列当中，并将C变为 处理中 状态
*   在**并发标记**阶段结束以后，重新标记阶段会STW，然后将放在该队列中的对象重新处理，发现有强引用引用它，就会处理它

![](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608151239.png)

**JDK 8u20 字符串去重**：

*   优点：节省大量内存
*   缺点：略微多占用了 cpu 时间，新生代回收时间略微增加

例如：

    String s1 = new String("hello"); // char[]{'h','e','l','l','o'}
    String s2 = new String("hello"); // char[]{'h','e','l','l','o'}


*   将所有新分配的字符串（底层是char\[\]）放入一个队列
*   当新生代回收时，G1并发检查是否有重复的字符串
*   如果字符串的值一样，就让他们**引用同一个字符串对象**
*   注意，其与String.intern的区别
    *   intern关注的是字符串对象
    *   字符串去重关注的是char\[\]
    *   在JVM内部，使用了不同的字符串表

**JDK 8u40 并发标记类卸载**：

所有对象都经过并发标记后，就能知道哪些类不再被使用，当一个类加载器的所有类都不再使用，则卸载它所加载的所有类 `-XX:+ClassUnloadingWithConcurrentMark` 默认启用

**JDK 8u60 回收巨型对象**：

*   JDK 8u60 回收巨型对象一个对象大于 region 的一半时，称之为巨型对象
*   G1 不会对巨型对象进行拷贝
*   回收时被优先考虑回收巨型对象
*   G1 会跟踪老年代所有 incoming 引用，这样老年代 incoming 引用为0的巨型对象就可以在新生代垃圾回收时处理掉

![](https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20200608151249.png)

**JDK 9 并发标记起始时间的调整**：

*   并发标记必须在堆空间占满前完成，否则退化为 FullGC
*   JDK 9 之前需要使用 `-XX:InitiatingHeapOccupancyPercent`
*   JDK 9 可以动态调整
    *   `-XX:InitiatingHeapOccupancyPercent` 用来设置初始值
    *   进行数据采样并动态调整
    *   总会添加一个安全的空档空间

5.垃圾回收调优
--------

### 5-1 调优领域

*   内存
*   锁竞争
*   CPU占用
*   IO
*   GC

### 5-2 确定目标

*   【低延迟】还是【高吞吐量】，选择合适的回收器
*   CMS，G1，ZGC （低延迟，响应时间优先）
*   ParallelGC
*   Zing

### 5-3 最快的 GC

**最快的GC是不发生GC**

查看**Full GC**前后的内存占用，考虑以下几个问题：

*   数据是不是太多？
    *   `resultSet = statement.executeQuery("select * from 大表")`
*   数据表示是否太臃肿？
    *   对象图
    *   对象大小
*   是否存在内存泄漏？

### 5-4 新生代调优

*   新生代的特点
    *   所有的new操作分配内存都是非常廉价的
        *   TLAB thread-local allocation buffer（可防止多个线程创建对象时的干扰）
    *   死亡对象回收零代价
    *   大部分对象用过即死（朝生夕死）
    *   MInor GC 所用时间远小于Full GC
*   新生代内存越大越好么？
    *   不是
        *   新生代内存太小：频繁触发Minor GC，会STW，会使得吞吐量下降
        *   新生代内存太大：老年代内存占比有所降低，会更频繁地触发Full GC。而且触发Minor GC时，清理新生代所花费的时间会更长
    *   新生代内存设置为能容纳\*\*\[并发量\*(请求-响应)\]\*\*的数据为宜
    *   幸存区大到能保留【当前活跃对象+需要晋升对象】
    *   晋升阈值配置得当，让长时间存活对象尽快晋升

### 5-5 老年代调优

以 CMS 为例 ：

*   CMS 的老年代内存越大越好
*   先尝试不做调优，如果没有 Full GC 那么已经…，否则先尝试调优新生代
*   观察发生 Full GC 时老年代内存占用，将老年代内存预设调大 1/4 ~ 1/3
    *   `-XX:CMSInitiatingOccupancyFraction=percent`



[JVM](https://so.csdn.net/so/search?q=JVM&spm=1001.2101.3001.7020)\-类加载与字节码技术
=============================================================================

![](https://img-blog.csdnimg.cn/img_convert/d6bebec086aa0797c2ff944865f05b79.png)  
本文章参考：[黑马程序员JVM](https://www.bilibili.com/video/BV1yE411Z7AP?from=search&seid=13392535664451499162&spm_id_from=333.337.0.0)

1.类文件结构
-------

一个简单的 `HelloWorld.java`

    // HelloWorld 示例
    public class HelloWorld {
        public static void main(String[] args) {
            System.out.println("hello world");
        }
    }


执行 `javac -parameters -d . HellowWorld.java`

编译为 `HelloWorld.class` 得到的**字节码文件**是这个样子的：

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


根据 JVM 规范，**类文件结构**如下

    u4 			 magic
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


### 1-1 魔数

对应[字节码](https://so.csdn.net/so/search?q=%E5%AD%97%E8%8A%82%E7%A0%81&spm=1001.2101.3001.7020)文件 0~3 字节，表示它是否是【class】类型的文件

0000000 **ca fe ba be** 00 00 00 34 00 23 0a 00 06 00 15 09

### 1-2 版本

对应字节码文件 4~7 字节，表示类的版本 00 34（52） 表示是 Java 8

0000000 ca fe ba be **00 00 00 34** 00 23 0a 00 06 00 15 09

### 1-3 [常量池](https://so.csdn.net/so/search?q=%E5%B8%B8%E9%87%8F%E6%B1%A0&spm=1001.2101.3001.7020)

太多，这里不便讲解，请参考官方文档：https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html#jvms-6.5

2.字节码指令
-------

### 2-1 javap工具

Oracle 提供了 javap 工具来反编译 class 文件

    javap -v 类名.class


    C:\Users\30287\IdeaProjects\paiXppLL\src\main>javap -v Main.class
    Classfile /C:/Users/30287/IdeaProjects/paiXppLL/src/main/Main.class
      Last modified 2021-10-14; size 419 bytes
      MD5 checksum eda2e7897356a975438fe5899c0b4a6c
      Compiled from "Main.java"
    public class main.Main
      minor version: 0
      major version: 52
      flags: ACC_PUBLIC, ACC_SUPER
    Constant pool:
       #1 = Methodref          #6.#15         // java/lang/Object."<init>":()V
       #2 = Fieldref           #16.#17        // java/lang/System.out:Ljava/io/PrintStream;
       #3 = String             #18            // hello world!
       #4 = Methodref          #19.#20        // java/io/PrintStream.println:(Ljava/lang/String;)V
       #5 = Class              #21            // main/Main
       #6 = Class              #22            // java/lang/Object
       #7 = Utf8               <init>
       #8 = Utf8               ()V
       #9 = Utf8               Code
      #10 = Utf8               LineNumberTable
      #11 = Utf8               main
      #12 = Utf8               ([Ljava/lang/String;)V
      #13 = Utf8               SourceFile
      #14 = Utf8               Main.java
      #15 = NameAndType        #7:#8          // "<init>":()V
      #16 = Class              #23            // java/lang/System
      #17 = NameAndType        #24:#25        // out:Ljava/io/PrintStream;
      #18 = Utf8               hello world!
      #19 = Class              #26            // java/io/PrintStream
      #20 = NameAndType        #27:#28        // println:(Ljava/lang/String;)V
      #21 = Utf8               main/Main
      #22 = Utf8               java/lang/Object
      #23 = Utf8               java/lang/System
      #24 = Utf8               out
      #25 = Utf8               Ljava/io/PrintStream;
      #26 = Utf8               java/io/PrintStream
      #27 = Utf8               println
      #28 = Utf8               (Ljava/lang/String;)V
    {
      public main.Main();
        descriptor: ()V
        flags: ACC_PUBLIC
        Code:
          stack=1, locals=1, args_size=1
             0: aload_0
             1: invokespecial #1                  // Method java/lang/Object."<init>":()V
             4: return
          LineNumberTable:
            line 13: 0
    
      public static void main(java.lang.String[]);
        descriptor: ([Ljava/lang/String;)V
        flags: ACC_PUBLIC, ACC_STATIC
        Code:
          stack=2, locals=1, args_size=1
             0: getstatic     #2                  // Field java/lang/System.out:Ljava/io/PrintStream;
             3: ldc           #3                  // String hello world!
             5: invokevirtual #4                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
             8: return
          LineNumberTable:
            line 15: 0
            line 16: 8
    }


### 2-2 图解方法执行流程

#### （1）原始 Java 代码

    /**
    * 演示 字节码指令 和 操作数栈、常量池的关系
    */
    public class Demo3_1 {   
    	public static void main(String[] args) {        
    		int a = 10;        
    		int b = Short.MAX_VALUE + 1;        
    		int c = a + b;        
    		System.out.println(c);   
        } 
    }


#### （2）编译后的字节码文件

    [root@localhost ~]# javap -v Demo3_1.class
    Classfile /root/Demo3_1.class
    Last modified Jul 7, 2019; size 665 bytes
    MD5 checksum a2c29a22421e218d4924d31e6990cfc5
    Compiled from "Demo3_1.java"
    public class cn.itcast.jvm.t3.bytecode.Demo3_1
    minor version: 0
    major version: 52
    flags: ACC_PUBLIC, ACC_SUPER
    Constant pool:
    #1 = Methodref #7.#26 // java/lang/Object."<init>":()V
    #2 = Class #27 // java/lang/Short
    #3 = Integer 32768
    #4 = Fieldref #28.#29 //
    java/lang/System.out:Ljava/io/PrintStream;
    #5 = Methodref #30.#31 // java/io/PrintStream.println:(I)V
    #6 = Class #32 // cn/itcast/jvm/t3/bytecode/Demo3_1
    #7 = Class #33 // java/lang/Object
    #8 = Utf8 <init>
    #9 = Utf8 ()V
    #10 = Utf8 Code
    #11 = Utf8 LineNumberTable
    #12 = Utf8 LocalVariableTable
    #13 = Utf8 this
    #14 = Utf8 Lcn/itcast/jvm/t3/bytecode/Demo3_1;
    #15 = Utf8 main
    #16 = Utf8 ([Ljava/lang/String;)V
    #17 = Utf8 args
    #18 = Utf8 [Ljava/lang/String;
    #19 = Utf8 a
    #22 = Utf8 c
    #23 = Utf8 MethodParameters
    #24 = Utf8 SourceFile
    #25 = Utf8 Demo3_1.java
    #26 = NameAndType #8:#9 // "<init>":()V
    #27 = Utf8 java/lang/Short
    #28 = Class #34 // java/lang/System
    #29 = NameAndType #35:#36 // out:Ljava/io/PrintStream;
    #30 = Class #37 // java/io/PrintStream
    #31 = NameAndType #38:#39 // println:(I)V
    #32 = Utf8 cn/itcast/jvm/t3/bytecode/Demo3_1
    #33 = Utf8 java/lang/Object
    #34 = Utf8 java/lang/System
    #35 = Utf8 out
    #36 = Utf8 Ljava/io/PrintStream;
    #37 = Utf8 java/io/PrintStream
    #38 = Utf8 println
    #39 = Utf8 (I)V
    {
    public cn.itcast.jvm.t3.bytecode.Demo3_1();
    descriptor: ()V
    flags: ACC_PUBLIC
    Code:
    stack=1, locals=1, args_size=1
    0: aload_0
    1: invokespecial #1 // Method java/lang/Object."
    <init>":()V
    4: return
    LineNumberTable:
    line 6: 0
    LocalVariableTable:
    Start Length Slot Name Signature
    0 5 0 this Lcn/itcast/jvm/t3/bytecode/Demo3_1;
    public static void main(java.lang.String[]);
    descriptor: ([Ljava/lang/String;)V
    flags: ACC_PUBLIC, ACC_STATIC
    Code:
    stack=2, locals=4, args_size=1
    0: bipush 10
    2: istore_1
    3: ldc #3 // int 32768
    5: istore_2
    6: iload_1
    7: iload_2
    8: iadd
    9: istore_3
    10: getstatic #4 // Field
    java/lang/System.out:Ljava/io/PrintStream;
    13: iload_3
    14: invokevirtual #5 // Method
    java/io/PrintStream.println:(I)V
    17: return
    LineNumberTable:
    line 8: 0
    line 9: 3
    line 12: 17
    LocalVariableTable:
    Start Length Slot Name Signature
    0 18 0 args [Ljava/lang/String;
    3 15 1 a I
    6 12 2 b I
    10 8 3 c I
    MethodParameters:
    Name Flags
    args
    }


#### （3）常量池载入运行时常量池

![](https://img-blog.csdnimg.cn/0f50447e041446709800dcda1566e38d.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （4）方法字节码载入方法区

![](https://img-blog.csdnimg.cn/a8c0ad7fe58d46d4a0be33d38f124315.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （5）main 线程开始运行，分配[栈帧](https://so.csdn.net/so/search?q=%E6%A0%88%E5%B8%A7&spm=1001.2101.3001.7020)内存

stack=2，locals=4） 对应操作数栈有2个空间（每个空间4个字节），局部变量表中有4个槽位

![](https://img-blog.csdnimg.cn/img_convert/d74d535e92a2f945e55fa8a7fea94ab7.png)

#### （6）执行引擎开始执行字节码

**bipush 10**：

*   将一个 byte 压入操作数栈（其长度会补齐 4 个字节），类似的指令还有
    *   **sipush** 将一个 short 压入操作数栈（其长度会补齐 4 个字节）
    *   **ldc** 将一个 int 压入操作数栈
    *   **ldc2\_w** 将一个 long 压入操作数栈（**分两次压入**，因为 long 是 8 个字节）
    *   这里小的数字都是和字节码指令存在一起，**超过 short 范围的数字存入了常量池**

![](https://img-blog.csdnimg.cn/a89ab19cccc140fbac04e8c9d0b29257.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**istore 1**：

*   将操作数栈栈顶元素弹出，放入局部变量表的slot 1中

![](https://img-blog.csdnimg.cn/b36059f2981949069cf2a2929a4cf708.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**ldc #3**：

*   从常量池加载 #3 数据到操作数栈
*   注意 `Short.MAX_VALUE` 是 32767，所以 32768 = Short.MAX\_VALUE + 1 实际是在编译期间计算好的  
    ![](https://img-blog.csdnimg.cn/cde368daea88409aa280f15700080a50.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**istore\_2**：

将操作数栈中的元素弹出，放到局部变量表的2号位置  
![](https://img-blog.csdnimg.cn/0fa22eb7933f465aa8c647d1b3ece76e.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**iload1**：

将局部变量表中1号位置的元素放入操作数栈中

![](https://img-blog.csdnimg.cn/f83fb22a266a4330b1e6c53d958d0291.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**iload2**：

将局部变量表中2号位置的元素放入操作数栈中

![](https://img-blog.csdnimg.cn/eb458b578c7747da81fb828345cdb32e.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**iadd**：

将操作数栈中的两个元素弹出栈并相加，结果在压入操作数栈中

![](https://img-blog.csdnimg.cn/a41228ebabf0482b86732f0896019c2e.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**istore 3**：

将操作数栈中的元素弹出，放入局部变量表的3号位置

![](https://img-blog.csdnimg.cn/1978646c53324f47937e29c2a85b506a.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**getstatic #4**：

在运行时常量池中找到#4，发现是一个对象

在堆内存中找到该对象，并将其**引用**放入操作数栈中

![](https://img-blog.csdnimg.cn/915c282518ea4a31bf9b43f929d91778.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**iload 3**：

![](https://img-blog.csdnimg.cn/cb191f6e09824bfda5d3a9feb58f7d99.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**invokevirtual 5**：

*   找到常量池 #5 项
*   定位到方法区 `java/io/PrintStream.println:(I)V` 方法
*   生成新的栈帧（分配 locals、stack等）
*   传递参数，执行新栈帧中的字节码

![](https://img-blog.csdnimg.cn/img_convert/9766e8e53a64597f15f3195c45a1b837.png)

*   执行完毕，弹出栈帧
*   清除 main 操作数栈内容

![](https://img-blog.csdnimg.cn/ae0624e27e0447a3bf7c03c7bcb82a31.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

**return**：

*   完成 main 方法调用，弹出 main 栈帧
*   程序结束

### 2-3 练习-判断结果

Java代码：

    public class Main {
        public static void main(String[] args) {
            int i = 0;
            int x = 0;
            while (i < 10) {
                x = x++;
                i++;
            }
            System.out.println(x); //输出为0
        }
    }


分析字节码指令：

     Code:
          stack=2, locals=3, args_size=1 //操作数栈分配两个空间，局部变量表分配3个空间
             0: iconst_0 //常数0
             1: istore_1 //将常数0放入局部变量表的1号位 i=0
             2: iconst_0 //常数0
             3: istore_2 //将常数0放入局部变量表的2号位 x=0
             4: iload_1 //将局部变量表1号位的数放入操作数栈中
             5: bipush        10 //将数字10放入操作数栈
             7: if_icmpge     21 //比较操作数栈中的两个数，如果下面的数大于上面的数，就跳转到21。这里的比较是将两个数做减法。因为涉及运算操作，所以会将两个数弹出操作数栈来进行运算。运算结束后操作数栈为空
            10: iload_2 //将局部变量2号位的数放入操作数栈中，放入的值为为0
            11: iinc          2, 1 //将局部变量2号位的数加1，自增后，槽位中的值为1
            14: istore_2 //将操作数栈中的数放入到局部变量表的2号位，2号位的值又变为了0
            15: iinc          1, 1 //1号位的值自增1
            18: goto          4 //跳转到第4条指令
            21: getstatic     #2                  // Field java/lang/System.out:Ljava/io/PrintStream;
            24: iload_2
            25: invokevirtual #3                  // Method java/io/PrintStream.println:(I)V
            28: return


### 2-4 [构造方法](https://so.csdn.net/so/search?q=%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95&spm=1001.2101.3001.7020)

#### （1）cinit()V

Java代码：

    public class Main {
        static int i = 10;
        static {
            i = 20;
        }
        static {
            i = 30;
        }
    }


编译器会按**从上至下**的顺序，收集所有 `static` 静态代码块和静态成员赋值的代码，**合并**为一个特殊的方法 `cinit()V` ：

    0: bipush 10
    2: putstatic #2 // Field i:I
    5: bipush 20
    7: putstatic #2 // Field i:I
    10: bipush 30
    12: putstatic #2 // Field i:I
    15: return


`cinit()V` 方法会在[类加载](https://so.csdn.net/so/search?q=%E7%B1%BB%E5%8A%A0%E8%BD%BD&spm=1001.2101.3001.7020)的初始化阶段被调用

#### （2）init()V

Java代码：

    public class Main {
        private String a = "s1";
    
        {
            b = 20;
        }
    
        private int b = 10;
    
        {
            a = "s2";
        }
    
        public Main(String a, int b) {
            this.a = a;
            this.b = b;
        }
    
        public static void main(String[] args) {
            Main d = new Main("s3", 30);
            System.out.println(d.a);//s3
            System.out.println(d.b);//30
        }    
    }


​    

编译器会按**从上至下**的顺序，收集所有 {} 代码块和成员变量赋值的代码，**形成新的构造方法**，但**原始构造方法**内的代码**总是在后**

    Code:
    stack=2, locals=3, args_size=3
    0: aload_0
    1: invokespecial #1 // super.<init>()V
    4: aload_0
    5: ldc #2         // <- "s1"
    7: putfield #3    // -> this.a
    10: aload_0
    11: bipush 20     // <- 20
    13: putfield #4   // -> this.b
    16: aload_0
    17: bipush 10     // <- 10
    19: putfield #4   // -> this.b
    22: aload_0
    23: ldc #5        // <- "s2"
    25: putfield #3   // -> this.a
    28: aload_0       // ------------------------------
    29: aload_1       // <- slot 1(a) "s3"            |
    30: putfield #3   // -> this.a                    |
    33: aload_0                                       |
    34: iload_2       // <- slot 2(b) 30              |
    35: putfield #4   // -> this.b --------------------
    38: return


### 2-5 方法调用

看一下几种不同的方法调用对应的字节码指令

    package main;


​    
    public class Main {
        public Main() {
    
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
            Main m = new Main();
            m.test1();
            m.test2();
            m.test3();
            Main.test4();
        }
    }


​    

不同方法在调用时，对应的虚拟机指令有所区别：

*   **私有**、**构造**、被**final**修饰的方法，在调用时都使用**invokespecial**指令，属于**静态绑定**
*   **普通成员**方法在调用时，使用**invokevirtual**指令。因为编译期间无法确定该方法的内容，只有在运行期间才能确定，属于**动态绑定**，即支持多态
*   **静态方法**在调用时使用**invokestatic**指令

对应的字节码文件：

     Code:
          stack=2, locals=2, args_size=1
             0: new           #2                  // class main/Main
             3: dup
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
*   dup 是赋值操作数栈栈顶的内容，本例即为【对象引用】，为什么需要两份引用呢，一个是要配合 `invokespecial` 调用该对象的构造方法 `"<init>":()V` （会消耗掉栈顶一个引用），另一个要配合 `astore_1` 赋值给局部变量
*   成员方法与静态方法调用的另一个区别是，执行方法前是否需要【对象引用】

### 2-6 [多态](https://so.csdn.net/so/search?q=%E5%A4%9A%E6%80%81&spm=1001.2101.3001.7020)的原理

因为普通成员方法需要在运行时才能确定具体的内容，所以虚拟机需要调用**invokevirtual**指令

在执行**invokevirtual**指令时，经历了以下几个步骤

*   先通过栈帧中对象的引用找到对象
*   分析对象头，找到对象实际的Class
*   Class结构中有**vtable**，它在类加载的链接阶段就已经根据方法的重写规则生成好了
*   查询**vtable**找到方法的具体地址
*   执行方法的字节码

### 2-7 [异常处理](https://so.csdn.net/so/search?q=%E5%BC%82%E5%B8%B8%E5%A4%84%E7%90%86&spm=1001.2101.3001.7020)

#### （1）try-catch

    public class Main {
        public static void main(String[] args) {
            int i = 0;
            try {
                i = 10;
            } catch (Exception e) {
                i = 20;
            }
        }
    }


对应的字节码文件（为了抓住重点，下面的字节码省略了不重要的部分）：

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
          Exception table:
             from    to  target type
                 2     5     8   Class java/lang/Exception


*   可以看到多出来一个 **Exception table** 的结构，\[from, to) 是**前闭后开**（也就是检测2~4行）的检测范围，一旦这个范围内的字节码执行出现异常，则通过 type 匹配异常类型，如果一致，进入 target 所指示行号
*   8行的字节码指令 astore\_2 是将异常对象引用存入局部变量表的2号位置（为e）

#### （2）多个 single-catch 块的情况

    public class Main {
        public static void main(String[] args) {
            int i = 0;
            try {
                i = 10;
            } catch (ArithmeticException e) {
                i = 20;
            } catch (Exception e) {
                i = 30;
            }
        }
    }


对应的字节码文件：

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


*   因为异常出现时，**只能进入** Exception table 中**一个分支**，所以局部变量表 slot 2 位置**被共用**

#### （3）finally

    public class Main {
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


对应的字节码文件：

       Code:
          stack=1, locals=4, args_size=1
              
             0: iconst_0
             1: istore_1
              //try块
             2: bipush        10
             4: istore_1
             5: bipush        30
             //try块执行完后，会执行finally 
             7: istore_1
             8: goto          27
             //catch块
            11: astore_2
            12: bipush        20
            14: istore_1
             //catch块执行完，会执行finally
            15: bipush        30
            17: istore_1
            18: goto          27
            //出现异常，但未被Exception捕获，会抛出其他异常，这时也需要执行finally块中的代码   
            21: astore_3
            22: bipush        30
            24: istore_1
            25: aload_3
            26: athrow //抛出异常
            27: return
          Exception table:
             from    to  target type
                 2     5    11   Class java/lang/Exception
                 2     5    21   any //剩余的异常类型，比如 Error
                11    15    21   any //剩余的异常类型，比如 Erro


可以看到 finally 中的代码被复制了 3 份，分别放入 try 流程，catch 流程以及 catch 剩余的异常类型流程

> 注意：
>
> 虽然从字节码指令看来，每个块中都有finally块，但是finally块中的代码**只会被执行一次**

#### （4）finally中的return

    public class Main {
        public static void main(String[] args) {
            int result = test();
            System.out.println(result);//20
        }
    
        public static int test() {
            try {
                return 10;
            } finally {
                return 20;
            }
        }
    }


对应的字节码文件：

      Code:
          stack=1, locals=2, args_size=0
             0: bipush        10
             2: istore_0
             3: bipush        20
             5: ireturn  // 返回栈顶 int(20)
             6: astore_1
             7: bipush        20
             9: ireturn  // 返回栈顶 int(20)
          Exception table:
             from    to  target type
                 0     3     6   any


*   由于 finally 中的 ireturn 被插入了所有可能的流程，因此返回结果肯定以 finally 的为准
*   跟前一个中的 finally 相比，发现没有 athrow 了，这告诉我们：如果在 finally 中出现了 return，会吞掉异常

运行下面的代码，不会抛出异常：

    public class Main {
        public static void main(String[] args) {
            int result = test();
            System.out.println(result);
        }
    
        public static int test() {
            try {
                int i = 1 / 0;
                return 10;
            } finally {
                return 20;
            }
        }
    }


#### （5）finally不带return

    public class Main {
        public static void main(String[] args) {
            int i = Main.test();
            System.out.println(i);//输出为10
        }
    
        public static int test() {
            int i = 10;
            try {
                return i;
            } finally {
                i = 20;
            }
        }
    }


对应的字节码文件：

    Code:
          stack=1, locals=3, args_size=0
          	0: bipush        10
            2: istore_0 //赋值给i 10
            3: iload_0	//加载到操作数栈顶
            4: istore_1 //加载到局部变量表的1号位置
            5: bipush        20
            7: istore_0 //赋值给i 20
            8: iload_1 //加载局部变量表1号位置的数10到操作数栈
            9: ireturn //返回操作数栈顶元素 10
           10: astore_2
           11: bipush        20
           13: istore_0
           14: aload_2 //加载异常
           15: athrow //抛出异常
          Exception table:
             from    to  target type
                 3     5    10   any


### 2-8 synchronized

    public class Main {
        public static void main(String[] args) {
            int i = 10;
            Object lock = new Object();
            synchronized (lock) {
                System.out.println(i);
            }
        }
    }


对应的字节码文件：

     Code:
          stack=2, locals=5, args_size=1
             0: bipush        10
             2: istore_1
             3: new           #2                  // class java/lang/Object
             6: dup
             7: invokespecial #1                  // Method java/lang/Object."<init>":()V
            10: astore_2
            11: aload_2
            12: dup
            13: astore_3
            14: monitorenter //加锁
            15: getstatic     #3                  // Field java/lang/System.out:Ljava/io/PrintStream;
            18: iload_1
            19: invokevirtual #4                  // Method java/io/PrintStream.println:(I)V
            22: aload_3
            23: monitorexit //解锁
            24: goto          34
            //异常操作
            27: astore        4
            29: aload_3
            30: monitorexit //解锁
            31: aload         4
            33: athrow
            34: return
          Exception table:
             from    to  target type
                15    24    27   any
                27    31    27   any


3.编译期处理
-------

所谓的 **语法糖** ，其实就是指 java 编译器把 `*.java` 源码编译为 `*.class` 字节码的过程中，自动生成和转换的一些代码，主要是为了减轻程序员的负担，算是 java 编译器给我们的一个额外福利（给糖吃嘛）

### 3-1 默认构造器

    public class Candy1 {
    }


编译成class后的代码：

    public class Candy1 {
        // 这个无参构造是编译器帮助我们加上的
        public Candy1() {
            super(); // 即调用父类 Object 的无参构造方法，即调用 java/lang/Object."<init>":()V
        }
    }


### 3-2 自动拆装箱

这个特性是 `JDK 5` 开始加入的， 如下代码 ：

    public class Candy2 {
        public static void main(String[] args) {
            Integer x = 1;
            int y = x;
        }
    }


这段代码在 `JDK 5` 之前是无法编译通过的，必须改写下面这样 :

    public class Candy2 {
        public static void main(String[] args) {
            //基本类型转包装类型→装箱
            Integer x = Integer.valueOf(1);
            //包装类型转基本类型→拆箱
            int y = x.intValue();
        }
    }


### 3-3 泛型集合取值

泛型也是在 `JDK 5` 开始加入的特性，但 java 在编译泛型代码后会执行**泛型擦除** 的动作，即泛型信息在编译为字节码之后就丢失了，实际的类型都当做了 **Object** 类型来处理：

    public class Candy3 {
        public static void main(String[] args) {
            List<Integer> list = new ArrayList<>();
            list.add(10); // 实际调用的是 List.add(Object e)
            Integer x = list.get(0); // 实际调用的是 Object obj = List.get(int index);
        }
    }


所以在取值时，编译器真正生成的字节码中，还要额外做一个类型转换的操作：

    // 需要将 Object 转为 Integer
    Integer x = (Integer)list.get(0);


如果前面的 x 变量类型修改为 int 基本类型那么最终生成的字节码是：

    // 需要将 Object 转为 Integer, 并执行拆箱操作
    int x = ((Integer)list.get(0)).intValue();


对应字节码：

    Code:
        stack=2, locals=3, args_size=1
           0: new           #2                  // class java/util/ArrayList
           3: dup
           4: invokespecial #3                  // Method java/util/ArrayList."<init>":()V
           7: astore_1
           8: aload_1
           9: bipush        10
          11: invokestatic  #4                  // Method java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
          //这里进行了泛型擦除，实际调用的是add(Objcet o)
          14: invokeinterface #5,  2            // InterfaceMethod java/util/List.add:(Ljava/lang/Object;)Z
    
          19: pop
          20: aload_1
          21: iconst_0
          //这里也进行了泛型擦除，实际调用的是get(Object o)   
          22: invokeinterface #6,  2            // InterfaceMethod java/util/List.get:(I)Ljava/lang/Object;
    //这里进行了类型转换，将Object转换成了Integer
          27: checkcast     #7                  // class java/lang/Integer
          30: astore_2
          31: return


### 3-4 可变参数

可变参数也是 `JDK 5` 开始加入的新特性： 例如：

    public class Candy4 {
        public static void foo(String... args) {
            String[] array = args; // 直接赋值
            System.out.println(array);
        }
        public static void main(String[] args) {
            foo("hello", "world");
        }
    }


可变参数 `String... args` 其实是一个 `String[] args` ，从代码中的赋值语句中就可以看出来。 同 样 java 编译器会在编译期间将上述代码变换为：

    public class Candy4 {
        public static void foo(String[] args) {
            String[] array = args; // 直接赋值
            System.out.println(array);
        }
        public static void main(String[] args) {
            foo(new String[]{"hello", "world"});
        }
    }


> **注意**： 如果调用了 foo() 则等价代码为 foo(new String\[\]{}) ，创建了一个空的数组，而不会 传递 null 进去

### 3-5 foreach循环

仍是 JDK 5 开始引入的语法糖，**数组**的循环：

    public class Candy5_1 {
        public static void main(String[] args) {
            int[] array = {1, 2, 3, 4, 5}; // 数组赋初值的简化写法也是语法糖哦
            for (int e : array) {
                System.out.println(e);
            }
        }
    }


会被编译器转换为：

    public class Candy5_1 {
        public Candy5_1() {
        }
        public static void main(String[] args) {
            int[] array = new int[]{1, 2, 3, 4, 5};
            for(int i = 0; i < array.length; ++i) {
                int e = array[i];
                System.out.println(e);
            }
        }
    }


如果是**集合**呢？

    public class Candy5_2 {
        public static void main(String[] args) {
            List<Integer> list = Arrays.asList(1,2,3,4,5);
            for (Integer i : list) {
                System.out.println(i);
            }
        }
    }


实际被编译器转换为对迭代器的调用：

    public class Candy5_2 {
        public Candy5_2() {
        }
        public static void main(String[] args) {
            List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);
            Iterator iter = list.iterator();
            while(iter.hasNext()) {
                Integer e = (Integer)iter.next();
                System.out.println(e);
            }
        }
    }


> **注意** ：foreach 循环写法，能够配合数组，以及所有实现了 **Iterable** 接口的集合类一起使用，其 中 Iterable 用来获取集合的迭代器（ **Iterator** ）

### 3-6 switch 字符串

从 JDK 7 开始，switch 可以作用于字符串和枚举类，这个功能其实也是语法糖，例如：

    public class Candy6_1 {
        public static void choose(String str) {
            switch (str) {
                case "hello": {
                    System.out.println("h");
                    break;
                }
                case "world": {
                    System.out.println("w");
                    break;
                }
            }
        }
    }


> **注意**： switch 配合 String 和枚举使用时，变量不能为null，原因分析完语法糖转换后的代码应当自然清楚

会被编译器转换为：

    public class Candy6_1 {
        public Candy6_1() {
        }
        public static void choose(String str) {
            byte x = -1;
            switch(str.hashCode()) {
                case 99162322: // hello 的 hashCode
                    if (str.equals("hello")) {
                        x = 0;
                    }
                    break;
                case 113318802: // world 的 hashCode
                    if (str.equals("world")) {
                        x = 1;
                    }
            }
            switch(x) {
                case 0:
                    System.out.println("h");
                    break;
                case 1:
                    System.out.println("w");
            }
        }
    }


以看到，执行了两遍 switch，第一遍是根据字符串的 hashCode 和 equals 将字符串的转换为相应 byte 类型，第二遍才是利用 byte 执行进行比较。

> **问**：为什么第一遍时必须既比较 hashCode，又利用 equals 比较呢？hashCode 是为了提高效率，减少可能的比较；而 equals 是为了防止 hashCode 冲突。
>
> 例如 `BM` 和 `C.` 这两个字符串的hashCode值都是 2123 ，如果有如下代码：

    public class Candy6_1 {
        public static void choose(String str) {
            switch (str) {
                case "BM": {
                    System.out.println("h");
                    break;
                }
                case "C.": {
                    System.out.println("w");
                    break;
                }
            }
        }
    }


会被编译器转换为：

    public class Candy6_1 {
        public Candy6_1() {
        }
    
        public static void choose(String var0) {
            byte var2 = -1;
            switch(var0.hashCode()) {
            case 2123:
                if (var0.equals("C.")) {
                    var2 = 1;
                } else if (var0.equals("BM")) {
                    var2 = 0;
                }
            default:
                switch(var2) {
                case 0:
                    System.out.println("h");
                    break;
                case 1:
                    System.out.println("w");
                }
    
            }
        }
    }


### 3-7 switch 枚举

    public enum Sex {
        MALE,FEMALE
    }


    public class Candy7 {
        public static void foo(Sex sex){
            switch (sex){
                case MALE:
                    System.out.println("男");
                    break;
                case FEMALE:
                    System.out.println("女");
                    break;
            }
        }
    }


会被编译器转换为：

    public class Candy7 {
        /**     
    	* 定义一个合成类（仅 jvm 使用，对我们不可见）
        * 用来映射枚举的 ordinal 与数组元素的关系
        * 枚举的 ordinal 表示枚举对象的序号，从 0 开始
        * 即 MALE 的 ordinal()=0，FEMALE 的 ordinal()=1
        */
        static class $MAP {
            // 数组大小即为枚举元素个数，里面存储case用来对比的数字
            static int[] map = new int[2];
            static {
                map[Sex.MALE.ordinal()] = 1;
                map[Sex.FEMALE.ordinal()] = 2;
            }
        }
        public static void foo(Sex sex) {
            int x = $MAP.map[sex.ordinal()];
            switch (x) {
                case 1:
                    System.out.println("男");
                    break;
                case 2:
                    System.out.println("女");
                    break;
            }
        }
    }


### 3-8 枚举类

`JDK 7` 新增了枚举类，以前面的性别枚举为例：

    public enum Sex {
        MALE,FEMALE
    }


会被编译器转换为：

    public final class Sex extends Enum<Sex> {
        public static final Sex MALE;
        public static final Sex FEMALE;
        private static final Sex[] $VALUES;
        static {
            MALE = new Sex("MALE", 0);
            FEMALE = new Sex("FEMALE", 1);
            $VALUES = new Sex[]{MALE, FEMALE};
        }
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


4.类加载阶段
-------

### 4-1 加载

*   将类的字节码载入方法区（1.8后为元空间，在本地内存中）中，内部采用 C++ 的 **instanceKlass** 描述 java 类，它的重要 ﬁeld 有：
    *   **\_java\_mirror** 即 **java 的类镜像**，例如对 String 来说，它的镜像类就是 String.class，作用是把 klass 暴露给 java 使用
    *   \_super 即父类
    *   \_ﬁelds 即成员变量
    *   \_methods 即方法
    *   \_constants 即常量池
    *   \_class\_loader 即类加载器
    *   \_vtable 虚方法表
    *   \_itable 接口方法
*   如果这个类还有父类没有加载，**先加载父类**
*   加载和链接可能是**交替运行**的
*   **instanceKlass** 这样的【元数据】是存储在**方法区**（1.8 后的元空间内），但 **\_java\_mirror** 是存储在**堆**中
*   instanceKlass和\_java\_mirror（java镜像类）互相保存了对方的地址
*   类的对象在对象头中保存了 \*.class 的地址。让对象可以通过其找到方法区中的instanceKlass，从而获取类的各种信息

![](https://img-blog.csdnimg.cn/img_convert/c704dcd7ba2826d62f16c17e186d31a9.png)

### 4-2 链接

#### （1）验证

验证类是否符合 JVM规范，安全性检查

#### （2）准备

为 `static` 变量分配空间，设置默认值

*   static变量在JDK 7以前是存储与instanceKlass末尾。但在JDK 7以后就存储在\_java\_mirror末尾了
*   static变量在分配空间和赋值是在两个阶段完成的。**分配空间**在**准备阶段**完成，**赋值**在**初始化阶段**完成
*   如果 static 变量是 ﬁnal 的**基本类型**，以及**字符串常量**，那么编译阶段值就确定了，**赋值在准备阶段完成**
*   如果 static 变量是 ﬁnal 的，但属于**引用类型**，那么**赋值**也会在**初始化阶段完成**

#### （3）解析

将常量池中的符号引用解析为直接引用

### 4-3 初始化

#### （1）cinit方法

初始化即调用 `<cinit>()`，虚拟机会保证这个类的【构造方法】的线程安全

#### （2）发生的时机

**类的初始化的懒惰的**，以下情况会初始化：

*   main 方法所在的类，总会被首先初始化
*   首次访问这个类的静态变量或静态方法时
*   子类初始化，如果父类还没初始化，会引发
*   子类访问父类的静态变量，只会触发父类的初始化
*   `Class.forName`
*   new 会导致初始化

以下情况不会初始化：

*   访问类的 static ﬁnal 静态常量（基本类型和字符串）
*   类对象.class 不会触发初始化
*   创建该类对象的数组
*   类加载器的.loadClass方法
*   `Class.forName`的参数2为false时

**验证类是否被初始化，可以看改类的静态代码块是否被执行**

这里一个例子来验证：（实验时请先全部注释，每次只执行其中一个）

    public class Load3 {
        static {
            System.out.println("main init");
        }
        public static void main(String[] args) throws ClassNotFoundException {
            // 1. 静态常量（基本类型和字符串）不会触发初始化
            System.out.println(B.b);
            // 2. 类对象.class 不会触发初始化
            System.out.println(B.class);
            // 3. 创建该类的数组不会触发初始化
            System.out.println(new B[0]);
            // 4. 不会初始化类 B，但会加载 B、A
            ClassLoader cl = Thread.currentThread().getContextClassLoader();
            cl.loadClass("cn.itcast.jvm.t3.B");
            // 5. 不会初始化类 B，但会加载 B、A
            ClassLoader c2 = Thread.currentThread().getContextClassLoader();
            Class.forName("cn.itcast.jvm.t3.B", false, c2);
            
            // 1. 首次访问这个类的静态变量或静态方法时
            System.out.println(A.a);
            // 2. 子类初始化，如果父类还没初始化，会引发
            System.out.println(B.c);
            // 3. 子类访问父类静态变量，只触发父类初始化
            System.out.println(B.a);
            // 4. 会初始化类 B，并先初始化类 A
            Class.forName("cn.itcast.jvm.t3.B");
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


5.类加载器
------

以 JDK 8 为例：

名称

加载的类

说明

Bootstrap ClassLoader（启动类加载器）

JAVA\_HOME/jre/lib

无法直接访问

Extension ClassLoader(拓展类加载器)

JAVA\_HOME/jre/lib/ext

上级为Bootstrap，**显示为null**

Application ClassLoader(应用程序类加载器)

classpath

上级为Extension

自定义类加载器

自定义

上级为Application

### 5-1 启动类加载器

用 Bootstrap 类加载器加载类：

    package cn.itcast.jvm.t3.load;
    public class F {
        static {
            System.out.println("bootstrap F init");
        }
    }


执行

    package cn.itcast.jvm.t3.load;
    public class Load5_1 {
        public static void main(String[] args) throws ClassNotFoundException {
            Class<?> aClass = Class.forName("cn.itcast.jvm.t3.load.F");
            System.out.println(aClass.getClassLoader());
        }
    }


输出

    E:\git\jvm\out\production\jvm>java -Xbootclasspath/a:.
    cn.itcast.jvm.t3.load.Load5
    bootstrap F init
    null


*   \-Xbootclasspath 表示设置 bootclasspath
*   其中 /a:. 表示将当前目录追加至 bootclasspath 之后
*   可以用这个办法替换核心类
    *   `java -Xbootclasspath:<new bootclasspath>`
*   也可以追加
    *   `java -Xbootclasspath/a:<追加路径>`（后追加）
    *   `java -Xbootclasspath/p:<追加路径>`（前追加）

### 5-2 扩展类加载器

如果classpath和JAVA\_HOME/jre/lib/ext 下有同名类，加载时会使用**拓展类加载器**加载。当应用程序类加载器发现拓展类加载器已将该同名类加载过了，则不会再次加载

### 5-3 双亲委派模式

*   当AppClassLoader加载一个class时，它首先不会自己去尝试加载这个类，而是把类加载请求委派给父类加载器ExtClassLoader去完成。
*   当ExtClassLoader加载一个class时，它首先也不会自己去尝试加载这个类，而是把类加载请求委派给BootStrapClassLoader去完成。
*   如果BootStrapClassLoader加载失败(例如在$JAVA\_HOME/jre/lib里未查找到该class)，会使用ExtClassLoader来尝试加载；
*   若ExtClassLoader也加载失败，则会使用AppClassLoader来加载，如果AppClassLoader也加载失败，则会报出异常ClassNotFoundException。

所谓的**双亲委派**，就是指调用类加载器的 **loadClass** 方法时，查找类的规则

**loadClass**源码：

    protected Class<?> loadClass(String name, boolean resolve)
        throws ClassNotFoundException {
        synchronized (getClassLoadingLock(name)) {
            // 1. 检查该类是否已经加载
            Class<?> c = findLoadedClass(name);
            if (c == null) {
                long t0 = System.nanoTime();
                try {
                    if (parent != null) {
                        // 2. 有上级的话，委派上级 loadClass
                        c = parent.loadClass(name, false);
                    } else {
                        // 3. 如果没有上级了（ExtClassLoader），则委派
                        BootstrapClassLoader
                            c = findBootstrapClassOrNull(name);
                    }
                } catch (ClassNotFoundException e) {
                }
                if (c == null) {
                    long t1 = System.nanoTime();
                    // 4. 每一层找不到，调用 findClass 方法（每个类加载器自己扩展）来加载
                    c = findClass(name);
                    // 5. 记录耗时
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


### 5-4 自定义类加载器

#### （1）使用场景

*   想加载非 classpath 随意路径中的类文件
*   通过接口来使用实现，希望解耦时，常用在框架设计
*   这些类希望予以隔离，不同应用的同名类都可以加载，不冲突，常见于 tomcat 容器

#### （2）步骤

1.  继承ClassLoader父类
2.  要遵从双亲委派机制，重写 ﬁndClass 方法
    *   不是重写loadClass方法，否则不会走双亲委派机制
3.  读取类文件的字节码
4.  调用父类的 deﬁneClass 方法来加载类
5.  使用者调用该类加载器的 loadClass 方法

6.运行期优化
-------

### 6-1 即时编译

#### （1）分层编译

JVM 将执行状态分成了 5 个层次：

*   0层：解释执行，用解释器将字节码翻译为机器码
*   1层：使用 C1 **即时编译器**编译执行（不带 proﬁling）
*   2层：使用 C1 即时编译器编译执行（带基本的profiling）
*   3层：使用 C1 即时编译器编译执行（带完全的profiling）
*   4层：使用 C2 即时编译器编译执行

> proﬁling 是指在运行过程中收集一些程序执行状态的数据，例如【方法的调用次数】，【循环的 回边次数】等

**即时编译器（JIT）与解释器的区别**：

*   解释器
    *   将字节码**解释**为机器码，下次即使遇到相同的字节码，仍会执行重复的解释
    *   是将字节码解释为针对所有平台都通用的机器码
*   即时编译器
    *   将一些字节码**编译**为机器码，**并存入 Code Cache**，下次遇到相同的代码，直接执行，无需再编译
    *   根据平台类型，生成平台特定的机器码

对于大部分的不常用的代码，我们无需耗费时间将其编译成机器码，而是采取解释执行的方式运行；另一方面，对于仅占据小部分的热点代码，我们则可以将其编译成机器码，以达到理想的运行速度。 执行效率上简单比较一下 Interpreter < C1 < C2，总的目标是发现热点代码（hotspot名称的由 来），并优化这些热点代码

**逃逸分析**：

发现新建的对象是否逃逸。可以使用 `-XX:- DoEscapeAnalysis` 关闭逃逸分析

#### （2）方法内联

举个栗子：

    private static int square(final int i) {
        return i * i;
    }


    System.out.println(square(9));


如果发现 square 是热点方法，并且长度不太长时，会进行**内联**，所谓的内联就是把方法内代码拷贝、 粘贴到调用者的位置：

    System.out.println(9 * 9);


还能够进行**常量折叠**（constant folding）的优化

    System.out.println(8);



JVM-JMM内存模型
===========

本文章参考：[黑马程序员JVM](https://www.bilibili.com/video/BV1yE411Z7AP?from=search&seid=1095777430746967320&spm_id_from=333.337.0.0)

*   很多人将【java 内存结构】与【java 内存模型】傻傻分不清，【java 内存模型】是 Java Memory Model（**JMM**）的意思。
*   简单的说，**JMM** 定义了一套在多线程读写共享数据时（成员变量、数组）时，对数据的**可见性**、**有序性**、和**原子性**的规则和保障

1\. 原子性
-------

### 1-1 问题解析

提出问题：两个线程对初始值为 0 的静态变量一个做自增，一个做自减，各做 5000 次，结果是 0 吗？

    public class Demo1 {
        static int i = 0;
    
        public static void main(String[] args) throws InterruptedException {
    
            Thread t1 = new Thread(() -> {
                for (int j = 0; j < 50000; j++) {
                    i++;
                }
            });
            Thread t2 = new Thread(() -> {
                for (int j = 0; j < 50000; j++) {
                    i--;
                }
            });
            t1.start();
            t2.start();
            t1.join();
            t2.join();
            System.out.println(i);
    
        }
    }


以上的结果可能是正数、负数、零。为什么呢？因为 Java 中**对静态变量的自增，自减**并**不是原子操作**。

例如对于 `i++` 而言（i 为静态变量），实际会产生如下的 JVM 字节码指令：

    getstatic i // 获取静态变量i的值
    iconst_1 // 准备常量1
    iadd // 加法
    putstatic i // 将修改后的值存入静态变量i


而对应 `i--` 也是类似：

    getstatic i // 获取静态变量i的值
    iconst_1 // 准备常量1
    isub // 减法
    putstatic i // 将修改后的值存入静态变量i


而 Java 的内存模型如下，完成静态变量的自增，自减需要在**主存**和**线程内存**中进行数据交换：

![](https://img-blog.csdnimg.cn/032cb75ddfaf4a0eba4c08b9418ecb2e.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

如果是单线程以上 8 行代码是顺序执行（不会交错）没有问题：

    // 假设i的初始值为0
    getstatic i // 线程1-获取静态变量i的值 线程内i=0
    iconst_1 // 线程1-准备常量1
    iadd // 线程1-自增 线程内i=1
    putstatic i // 线程1-将修改后的值存入静态变量i 静态变量i=1
    getstatic i // 线程1-获取静态变量i的值 线程内i=1
    iconst_1 // 线程1-准备常量1
    isub // 线程1-自减 线程内i=0
    putstatic i // 线程1-将修改后的值存入静态变量i 静态变量i=0


但多线程下这 8 行代码可能交错运行（为什么会交错？思考一下）： 出现负数的情况：

    // 假设i的初始值为0
    getstatic i // 线程1-获取静态变量i的值 线程内i=0
    getstatic i // 线程2-获取静态变量i的值 线程内i=0
    iconst_1 // 线程1-准备常量1
    iadd // 线程1-自增 线程内i=1
    putstatic i // 线程1-将修改后的值存入静态变量i 静态变量i=1
    iconst_1 // 线程2-准备常量1
    isub // 线程2-自减 线程内i=-1
    putstatic i // 线程2-将修改后的值存入静态变量i 静态变量i=-1


出现正数的情况：

    // 假设i的初始值为0
    getstatic i // 线程1-获取静态变量i的值 线程内i=0
    getstatic i // 线程2-获取静态变量i的值 线程内i=0
    iconst_1 // 线程1-准备常量1
    iadd // 线程1-自增 线程内i=1
    iconst_1 // 线程2-准备常量1
    isub // 线程2-自减 线程内i=-1
    putstatic i // 线程2-将修改后的值存入静态变量i 静态变量i=-1
    putstatic i // 线程1-将修改后的值存入静态变量i 静态变量i=1


### 1-2 解决方法

#### （1）synchronized（同步关键字）

语法：

    synchronized( 对象 ) {
        要作为原子操作代码
    }


用 `synchronized` 解决并发问题：

    public class Demo1 {
        static int i = 0;
        static Object obj = new Object();
    
        public static void main(String[] args) throws InterruptedException {
    
            Thread t1 = new Thread(() -> {
                for (int j = 0; j < 50000; j++) {
                    synchronized (obj) {
                        i++;
                    }
    
                }
            });
            Thread t2 = new Thread(() -> {
                for (int j = 0; j < 50000; j++) {
                    synchronized (obj) {
                        i--;
                    }
                }
            });
            t1.start();
            t2.start();
            t1.join();
            t2.join();
            System.out.println(i);//输出为0
        }
    }


> 为什么需要这里的 `obj` 对象呢？

我们可以这样理解：可以把 obj 想象成一个房间，线程 t1，t2 想象成两个人。

当线程 t1 执行到 `synchronized(obj)` 时就好比 t1 进入了这个房间，并反手锁住了门，在门内执行 count++ 代码。

这时候如果 t2 也运行到了 `synchronized(obj)` 时，它发现门被锁住了，只能在门外等待。

当 t1 执行完 `synchronized{}` 块内的代码，这时候才会解开门上的锁，从 obj 房间出来。t2 线程这时才可以进入 obj 房间，反锁住门，执行它的 count-- 代码。

> 怎么从JVM角度理解呢？（这里引用《Java并发编程的艺术》里的一段话）

从JVM规范中可以看到`Synchonized`在JVM里的实现原理，JVM基于进入和退出`Monitor`对象来实现方法同步和代码块同步，但两者的实现细节不一样。代码块同步是使用`monitorenter` 和`monitorexit`指令实现的。 `monitorenter`指令是在编译后插入到同步代码块的**开始位置**，而`monitorexit`是插入到**方法结束处**和**异常处**，JVM要保证每个`monitorenter`必须有对应的`monitorexit`与之配对。任何对象都有一个`monitor`与之关联，当且一个`monitor`被持有后，它将处于锁定状态。线程执行到`monitorenter` 指令时，将会尝试获取对象所对应的`monitor`的所有权，即尝试获得对象的锁。

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


为什么会这样？

1.  初始状态， t 线程刚开始从主内存读取了 run 的值到工作内存。
    
    ![](https://img-blog.csdnimg.cn/f834b05711404444874d0575a0f2c2ec.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    
2.  因为 t 线程要频繁从**主内存**中读取 run 的值，**JIT 编译器**会将 run 的值缓存至自己工作内存中的**高速缓存**中，减少对主存中 run 的访问，提高效率
    

![](https://img-blog.csdnimg.cn/f551627269064307bcc5b772542d56c5.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)

3.  1 秒之后，main 线程修改了 run 的值，并同步至主存，而 t 是从自己工作内存中的高速缓存中读取这个变量的值，结果永远是旧值
    
    ![](https://img-blog.csdnimg.cn/4d84898aedf1434ebe27ea15c4c3e39d.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBATEwuTEVCUk9O,size_20,color_FFFFFF,t_70,g_se,x_16)
    

### 2-2 解决办法

#### （1）[volatile](https://so.csdn.net/so/search?q=volatile&spm=1001.2101.3001.7020)（易变关键字）

它可以用来修饰**成员变量**和**静态成员变量**，他可以避免线程从自己的工作缓存中查找变量的值，必须到主存中获取它的值，线程操作 **volatile** 变量都是直接操作主存，保证了共享变量的**可见性**，但**不能保证原子性**

    public class Demo1 {
        volatile static boolean run = true;
    
        public static void main(String[] args) throws InterruptedException {
            Thread t = new Thread(() -> {
                while (run) {
    // ....
                }
            });
            t.start();
            Thread.sleep(1000);
            run = false; // 线程t不会如预想的停下来
        }
    
    }


> **注意**：
>
> `synchronized` 语句块既可以保证代码块的**原子性**，也同时保证代码块内变量的**可见性**。但 缺点是`synchronized`是属于重量级操作，**性能相对更低**
>
> 如果在前面示例的死循环中加入 `System.out.println()` 会发现即使不加 volatile 修饰符，线程 t 也 能正确看到对 run 变量的修改了，想一想为什么？

进入`println`源码：

    public void println(int x) {
        synchronized (this) {
            print(x);
            newLine();
        }
    }


可以看出加了`synchronized`，保证了每次`run`变量都会从主存中获取

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

**但其实还有可能为0哦**！😲

有可能还是：线程 2 执行 ready=true ，切换到线程1 ，进入if分支，相加为0，在切回线程 2 执行 num=2

这种现象就是**指令重排**

### 3-2 解决方法

volatile 修饰的变量，可以禁用指令重排

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


这种特性称之为**指令重排**，**多线程下指令重排会影响正确性**，例如著名的 `double-checked locking` 模式实现单例

    public class Singleton {
        private Singleton() {
        }
    
        private static Singleton INSTANCE = null;
    
        public static Singleton getInstance() {
            //实例没创建，才会进入内部的 synchronized 代码块
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

上面的代码看似已经很完美了，但是在多线程环境下还是会有指令重排问题！

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

对 INSTANCE 使用 **volatile** 修饰即可，可以禁用指令重排，但要注意在 JDK 5 以上的版本的 volatile 才 会真正有效

### 3-4 [happens-before](https://so.csdn.net/so/search?q=happens-before&spm=1001.2101.3001.7020)

**happens-before** 规定了哪些写操作对其它线程的读操作可见，它是**可见性**与**有序性**的一套规则总结，抛开以下 happens-before 规则，JMM 并不能保证一个线程对共享变量的写，对于其它线程对该共享变量的读可见

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
                        System.out.println(x);//0
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
            System.out.println(x);//0
        }
    
*   对变量默认值（0，false，null）的写，对其它线程对该变量的读可见
    
*   具有传递性，如果 `x hb-> y` 并且 `y hb-> z` 那么有 `x hb-> z`
    

> 以上变量都是指**共享变量**即成员变量或静态资源变量

4.CAS与原子类
---------

### 4-1 CAS

**CAS** 即 `Compare and Swap` ，它体现的一种**乐观锁**的思想

比如多个线程要对一个共享的整型变量执行 +1 操作：

    // 需要不断尝试
    while(true) {
        int 旧值 = 共享变量 ; // 比如拿到了当前值 0
        int 结果 = 旧值 + 1; // 在旧值 0 的基础上增加 1 ，正确结果是 1
        /*
    	这时候如果别的线程把共享变量改成了 5，本线程的正确结果 1 就作废了，这时候
    	compareAndSwap 返回 false，重新尝试，直到：
    	compareAndSwap 返回 true，表示我本线程做修改的同时，别的线程没有干扰
    	*/
        if( compareAndSwap ( 旧值, 结果 )) {
            // 成功，退出循环
        }
        //不一样，继续循环尝试
    }


获取共享变量时，为了保证该变量的可见性，需要使用 `volatile` 修饰。**结合 CAS 和 volatile 可以实现无锁并发**，适用于**竞争不激烈**、**多核 CPU** 的场景下。

*   因为没有使用 `synchronized`，所以线程不会陷入阻塞，这是效率提升的因素之一
*   但如果竞争激烈，可以想到重试必然频繁发生，反而效率会受影响

CAS 底层依赖于一个 `Unsafe` 类来直接调用操作系统底层的 CAS 指令，下面是直接使用 Unsafe 对象进行线程安全保护的一个例子：

    public class TestCAS {
        public static void main(String[] args) throws InterruptedException {
            DataContainer dc = new DataContainer();
            int count = 5;
            Thread t = new Thread(() -> {
                for (int i = 0; i < count; i++) {
                    dc.increase();
                }
            });
            t.start();
            t.join();
            System.out.println(dc.getData());
        }
    }
    
    class DataContainer {
        private volatile int data;
        static final Unsafe unsafe;
        static final long DATA_OFFSET;
    
        static {
            try {
                // Unsafe 对象不能直接调用，只能通过反射获得
                Field theUnsafe = Unsafe.class.getDeclaredField("theUnsafe");
                theUnsafe.setAccessible(true);
                unsafe = (Unsafe) theUnsafe.get(null);
            } catch (NoSuchFieldException | IllegalAccessException e) {
                throw new Error(e);
            }
            try {
                // data 属性在 DataContainer 对象中的偏移量，用于 Unsafe 直接访问该属性
                DATA_OFFSET =
                        unsafe.objectFieldOffset(DataContainer.class.getDeclaredField("data"));
            } catch (NoSuchFieldException e) {
                throw new Error(e);
            }
        }
    
        public void increase() {
            int oldValue;
            while (true) {
                // 获取共享变量旧值，可以在这一行加入断点，修改 data 调试来加深理解
                oldValue = data;
                // cas 尝试修改 data 为 旧值 + 1，如果期间旧值被别的线程改了，返回 false
                if (unsafe.compareAndSwapInt(this, DATA_OFFSET, oldValue, oldValue +
                        1)) {
                    return;
                }
            }
        }
    
        public void decrease() {
            int oldValue;
            while (true) {
                oldValue = data;
                if (unsafe.compareAndSwapInt(this, DATA_OFFSET, oldValue, oldValue -
                        1)) {
                    return;
                }
            }
        }
    
        public int getData() {
            return data;
        }
    }


### 4-2 [乐观锁](https://so.csdn.net/so/search?q=%E4%B9%90%E8%A7%82%E9%94%81&spm=1001.2101.3001.7020)与悲观锁

*   **CAS** 是基于**乐观锁**的思想：最乐观的估计，不怕别的线程来修改共享变量，就算改了也没关系，我吃亏点再重试呗。
*   **synchronized** 是基于**悲观锁**的思想：最悲观的估计，得防着其它线程来修改共享变量，我上了锁你们都别想改，我改完了解开锁，你们才有机会

### 4-3 [原子操作](https://so.csdn.net/so/search?q=%E5%8E%9F%E5%AD%90%E6%93%8D%E4%BD%9C&spm=1001.2101.3001.7020)类

**juc**`（java.util.concurrent）`中提供了原子操作类，可以提供线程安全的操作，例如：`AtomicInteger`、 `AtomicBoolean`等，它们底层就是采用 **CAS 技术 + volatile** 来实现的。 可以使用 AtomicInteger 改写之前的例子：

    public class TestCAS {
        //创建原子整数对象
        private static AtomicInteger i = new AtomicInteger(0);
    
        public static void main(String[] args) throws InterruptedException {
            Thread t1 = new Thread(() -> {
                for (int j = 0; j < 5000; j++) {
                    i.getAndIncrement(); //获取并且自增 i++
                }
            });
            Thread t2 = new Thread(() -> {
                for (int j = 0; j < 5000; j++) {
                    i.getAndDecrement(); //获取并且自减 i--
                }
            });
            t1.start();
            t2.start();
            t1.join();
            t2.join();
            System.out.println(i);//0
        }
    }


5.synchronized 优化
-----------------

Java HotSpot 虚拟机中，每个对象都有**对象头**（包括 `class 指针`和 `Mark Word`）。`Mark Word` 平时存储这个对象的哈希码 、 分代年龄 ，当加锁时，这些信息就根据情况被替换为标记位 、 线程锁记录指针 、 重量级锁指针 、 线程ID 等内容

### 5-1 轻量级锁

如果一个对象虽然有多线程访问，但多线程访问的时间是错开的（也就是没有竞争），那么可以使用**轻量级锁**来优化。这就好比：

学生（线程 A）用课本占座，上了半节课，出门了（CPU时间到），回来一看，发现课本没变，说明有竞争，继续上他的课。 如果这期间有其它学生（线程 B）来了，会告知（线程A）有并发访问，线程A 随即升级为**重量级锁**，进入重量级锁的流程。

而重量级锁就不是那么用课本占座那么简单了，可以想象线程 A 走之前，把座位用一个铁栅栏围起来，假设有两个方法同步块，利用同一个对象加锁

    static Object obj = new Object();
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


每个线程都的栈帧都会包含一个**锁记录**的结构，内部可以存储锁定对象的 `Mark Word`

### 5-2 锁膨胀

如果在尝试加轻量级锁的过程中，CAS 操作无法成功，这时一种情况就是有其它线程为此对象加上了轻量级锁（有竞争），这时需要进行锁膨胀，**将轻量级锁变为重量级锁。**

### 5-3 重量锁

重量级锁竞争的时候，还可以使用**自旋**来进行优化，如果当前线程自旋成功（即这时候持锁线程已经退出了同步块，释放了锁），这时当前线程就可以避免阻塞。

在 Java 6 之后自旋锁是自适应的，比如对象刚刚的一次自旋操作成功过，那么认为这次自旋成功的可能性会高，就多自旋几次；反之，就少自旋甚至不自旋，总之，比较智能。

### 5-4 偏向锁

轻量级锁在没有竞争时(就自己这个线程)，每次重入仍然需要执行CAS操作。Java 6中引入了**偏向锁**来做进一步优化：**只有第一次使用CAS将线程ID设置到对象的Mark Word头，之后发现这个线程ID是自己的就表示没有竞争，不用重新CAS**

*   撤销偏向需要将持锁线程升级为轻量级锁，这个过程中所有线程需要暂停（STW）
*   访问对象的 hashCode 也会撤销偏向锁
*   如果对象虽然被多个线程访问，但没有竞争，这时偏向了线程 T1 的对象仍有机会重新偏向 T2，重偏向会重置对象的 Thread ID
*   撤销偏向和重偏向都是批量进行的，以类为单位
*   如果撤销偏向到达某个阈值，整个类的所有对象都会变为不可偏向的
*   可以主动使用 `-XX:-UseBiasedLocking` 禁用偏向锁

### 5-5 其他优化

#### （1）减少上锁时间

同步代码块中尽量短

#### （2）减少锁的粒度

将一个锁拆分为多个锁提高并发度，例如：

*   `ConcurrentHashMap`
*   `LongAdder` 分为 `base` 和 `cells` 两部分。没有并发争用的时候或者是 cells 数组正在初始化的时候，会使用 CAS 来累加到base，有并发争用，会初始化 cells 数组，数组有多少个 cell，就允许有多少线程并行修改，最后将数组中每个 cell 累加，再加上 base 就是最终的值
*   `LinkedBlockingQueue` 入队和出队使用不同的锁，相对于`LinkedBlockingArray`只有一个锁效率要高

#### （3）锁粗化

多次循环进入同步块不如同步块内多次循环，另外 JVM 可能会做如下优化，把多次 append 的加锁操作粗化为一次（因为都是对同一个对象加锁，没必要重入多次）

    new StringBuffer().append("a").append("b").append("c");


#### （4）锁消除

JVM 会进行代码的**逃逸分析**，例如某个加锁对象是方法内局部变量，不会被其它线程所访问到，这时候就会被即时编译器忽略掉所有同步操作。

#### （5）读写分离

如果撤销偏向到达某个阈值，整个类的所有对象都会变为不可偏向的

*   可以主动使用 `-XX:-UseBiasedLocking` 禁用偏向锁

