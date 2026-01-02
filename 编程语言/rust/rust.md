# 介绍和安装

## 介绍

Rust 是一门强调安全性、并发性和高性能的现代系统级编程语言，通过独特的所有权模型和编译时借用检查器，在无需运行时开销的情况下彻底消除内存安全错误（如空指针、数据竞争等），同时提供零成本抽象、强大的类型系统（如代数数据类型与模式匹配）和内置的异步支持，使其成为开发操作系统、高性能服务、嵌入式系统等场景的理想选择，兼具 C/C++ 的效率与更安全的开发体验。

### 核心设计目标

- **安全性**：Rust 的首要目标是消除内存安全错误（如空指针、缓冲区溢出、数据竞争等），通过编译时检查实现零成本抽象。
- **并发性**：提供安全的并发模型，避免数据竞争，支持多线程和异步编程。
- **性能**：与 C/C++ 媲美的高效执行，适合开发操作系统、游戏引擎、嵌入式系统等高性能场景。

### **关键特性**

#### **所有权系统（Ownership）**

- **唯一所有权**：每个值有且仅有一个所有者，当所有者离开作用域时，资源自动释放。
- 借用检查器（Borrow Checker）：编译时强制执行引用规则。
  - **不可变借用**（`&T`）：多个读操作可同时存在。
  - **可变借用**（`&mut T`）：独占访问，确保写操作安全。
- **生命周期标注**：显式跟踪引用的有效范围，防止悬垂指针。

#### **类型系统与零成本抽象**

- **代数数据类型（ADT）**：支持枚举（`enum`）和结构体（`struct`），例如 `Option<T>` 和 `Result<T, E>` 替代空指针和异常。
- **泛型与特质（Traits）**：类似接口的机制，实现多态和代码复用。
- **模式匹配**：强大的 `match` 表达式，简化复杂逻辑处理。

#### **并发模型**

- **无数据竞争**：通过所有权和借用规则，确保多线程共享数据时的安全性。
- **异步支持**：`async/await` 语法和 `Tokio` 等运行时库，简化高并发 I/O 操作。
- **线程安全类型**：如 `Arc<T>`（原子引用计数）和 `Mutex<T>`，支持跨线程安全共享。

#### **工具链与生态**

- **Cargo**：内置的包管理器和构建工具，支持依赖管理、测试和文档生成。
- **跨平台编译**：一键生成 Windows、macOS、Linux 等目标平台的可执行文件。
- **丰富的库**：涵盖网络（`hyper`）、异步（`async-std`）、游戏开发（`wgpu`）等领域。

### **典型应用场景**

- **系统编程**：操作系统内核（如 Redox）、驱动开发。
- **高性能服务**：Web 服务器（如 `Actix`、`Rocket`）、数据库（如 `SurrealDB`）。
- **嵌入式开发**：资源受限设备（如微控制器）的编程。
- **区块链**：智能合约平台（如 Solana、Near Protocol）。
- **游戏开发**：引擎（如 `Bevy`）和实时渲染。

### **优势与挑战**

#### **优势**

- **内存安全**：编译时消除大部分常见错误，降低调试成本。
- **高性能**：无运行时开销，适合对效率敏感的场景。
- **现代语法**：简洁易读，支持函数式和面向对象风格。
- **活跃社区**：Stack Overflow 连续多年评为“最受喜爱语言”。

#### **挑战**

- **学习曲线**：所有权和生命周期概念对新手较难掌握。
- **编译时间**：复杂项目可能编译较慢（但可通过增量编译优化）。
- **生态成熟度**：部分领域（如 GUI）的库不如 C++/Python 丰富。

## 安装

Rust默认使用的是C语言环境，也就是Visual Studio，当我们直接点击rustup-init.exe文件进行安装时，Visual Studio会默认安装到我们的C盘，会占用大量的C盘空间。
我们可以采用轻量级的依赖包：mingw64。

### 编译环境准备
#### 下载mingw64
首先下载`mingw64`，GitHub下载地址：https://github.com/niXman/mingw-builds-binaries/releases。

* x86_64表示压缩包适用于64位的x86处理器架构。
* posix：适用于符合POSIX标准的操作系统，如Linux、UNIX等。
* win32：适用于Windows操作系统。
* seh：压缩包使用结构化异常处理（Structured Exception Handling）来处理异常。
* msvcrt：MSVCRT是Microsoft Visual C++编译器的旧版运行时库，用于支持在Windows系统上使用Visual C++编译的程序。它提供了许多标准C库函数和C++运行时函数的实现，用于支持程序的运行和调试。MSVCRT通常与早期的Visual C++版本（如Visual Studio 2010及更早版本）相关联。
* ucrt：UCRT是自Windows 10起引入的新一代运行时库，旨在提供更好的兼容性和性能。UCRT是一个通用的C运行时库，用于支持使用C语言编译的程序，而不仅仅是限于Visual C++编译器。它提供了对标准C库函数的更新实现，并支持一些新的C标准（如C11标准）。UCRT与较新版本的Visual C++（如Visual Studio 2015及更新版本）相关联。

> UCRT更新推荐开发使用，如果考虑兼容则用MSVCRT。

`Windows10` 则下载的是：`x86_64-14.2.0-release-win32-seh-ucrt-rt_v12-rev2.7z`

#### 配置环境变量
1. 将`mingw64`解压的一个指定位置，例如`D:\dev\rust`。
2. 配置系统环境变量（按win键直接搜索系统环境变量打开即可），在`path`环境变量中新增一条，将`D:\dev\rust`配置进去，然后一路确定。
3. 在`cmd`（`win+R`输入`cmd`后回车，或搜索命令提示符打开）输入命令`gcc --version`回车，若能看到版本信息，则表示配置成功。

### Rust环境准备
#### 配置环境变量
`rust`默认会安装到C盘用户目录下的`.cargo`文件下：`%USERPROFILE%/.cargo`，可以通过环境变量指定安装位置。假设安装位置也为`D:\dev\rust`

* cargo：编辑系统环境变量，新建一条变量名为`CARGO_HOME`，值为`D:\dev\rust\.cargo`的系统环境变量。
* rustup：编辑系统环境变量，新建一条变量名为`RUSTUP_HOME`，值为`D:\dev\rust\.rustup`的系统环境变量。
* 在系统环境变量的path变量中新增一条，值为`%CARGO_HOME%\bin`。
* 注意：配置好环境变量后建议重启一下电脑，不然安装`rust`时可能还是会安装到用户目录下。
#### 下载rust
官网下载地址：https://rust.p2hp.com/tools/install
选择好合适的版本并下载好后，双击exe文件打开。

1. 选择使用自己准备的编译环境，输入2回车。
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/4048372ac89247e69ee3ef3fa967f1c5.png)
2. 接着输入y回车，然后选择自定义安装，输入2回车
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/c06762049e234613bfc507f19e246a94.png)
3. 安装工具链：Rust默认的工具链是：x86_64-pc-windows-msvc。由于我们使用的编译环境是`mingw64`，所以需要使用这个`x86_64-pc-windows-gnu`，输入它回车。
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/b093862cb547498aa6b4ca25b596535b.png)
4. 接下来一路回车即可，等待安装完成后可以看到安装路径，如下。
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/c947dfd1bdd74570afe018e407d349a2.png)
5. 打开cmd输入`rustup --verion`或`rustc --version`回车，如果看到输出了版本信息，则表示安装成功。
6. 根据需要修改`cargo`镜像，如果下载速度慢的话，可以在`CARGO_HOME`指定的目录下创建一个`config.toml`文件，配置内容如下：
~~~txt
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
 
# 具体使用的源
replace-with = 'aliyun'
 
### 配置多个源地址
# rsproxy
[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"
[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index"
[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"
 
# 阿里源
[source.aliyun]
registry = "sparse+https://mirrors.aliyun.com/crates.io-index/" 
 
# 清华大学
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
 
# 中国科学技术大学
[source.ustc]
registry = "https://mirrors.ustc.edu.cn/crates.io-index/"
 
# 上海交通大学
[source.sjtu]
registry = "https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index"
 
# rustcc社区
[source.rustcc]
registry = "https://code.aliyun.com/rustcc/crates.io-index.git"
 
[net]
git-fetch-with-cli=true
~~~
### 运行rust

> 这里用`vscode`举例，安装`error lens`插件可以在语句后面显示错误提示。

1. 在`vscode`中安装好插件`rust-analyzer`（其他相同作用的rust插件也行）。
2. 创建rust项目：cmd输入`cargo new 项目名`即可创建一个rust项目，然后通过`vscode`打开创建好的项目，点击`main.rs`文件，这时插件会自动对项目进行编译（自动执行`cargo build`）。
3. 点击图中标注的`Run`即可运行项目（执行`cargo run`）。
   ![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/72707c6cf190488f8eb163e1d03f95ab.png)

> 如果运行失败，出现下图的情况，则需要在之前配置的`config.toml`文件中加上如下内容：
>
> ~~~txt
> [target.x86_64-pc-windows-gnu]
> linker = "D:/dev/rust/mingw64/bin/x86_64-w64-mingw32-gcc.exe"
> ~~~
>
> ![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/a9a3348ac7a34c6a8114e8afd88d087c.png)



### 补充

#### 包查询地址
推荐两个rust包的查询地址：
1. https://crates.io/
2. https://lib.rs/search
#### x86_64-pc-windows-gnu
`x86_64-pc-windows-gnu` 和 `x86_64-pc-windows-msvc` 是 Rust 在 Windows 平台上的两种 **目标三元组（target triple）**，分别对应不同的底层工具链和运行时行为。它们的核心区别在于 **使用的 C 运行时库（CRT）和链接器**，进而影响编译、链接和程序运行时的特性。以下是详细对比：

| **特性**              | **`x86_64-pc-windows-gnu`**                                  | **`x86_64-pc-windows-msvc`**                                 |
| --------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **C 运行时库（CRT）** | 使用 **MinGW-w64** 提供的 GNU CRT（如 `msvcrt.dll` 或 `ucrt.dll`） | 使用 **Microsoft Visual C++（MSVC）** 提供的 CRT（如 `msvcr120.dll`） |
| **链接器**            | GNU `ld`（来自 MinGW-w64）                                   | Microsoft `link.exe`（来自 MSVC 工具链）                     |
| **调试符号格式**      | DWARF（GNU 标准）                                            | PDB（Microsoft 专有格式）                                    |
| **异常处理机制**      | 基于 **SEH（Structured Exception Handling）** 的兼容实现（MinGW 的变种） | 原生 **SEH**（Windows 官方机制）                             |
| **线程模型**          | 通常使用 **POSIX 线程（pthread）** 的兼容层                  | 原生 **Windows 线程（Win32 API）**                           |

# 工具和配置

## cargo

**Cargo 是 Rust 官方提供的构建系统和包管理器**，它通过自动化依赖管理、项目构建、测试和发布等流程，显著提升了 Rust 项目的开发效率。无论是创建新项目、管理依赖库，还是优化生产环境代码，Cargo 都能提供标准化工具支持。

### 核心功能

1. 项目初始化
   - 自动生成项目结构（包含 `src/` 目录和 `Cargo.toml` 配置文件），区分二进制项目（默认）和库项目（通过 `--lib` 标志指定）。
   - 支持在已有目录中初始化项目（`cargo init`），避免手动创建文件结构。
2. 依赖管理
   - 通过 `Cargo.toml` 声明项目依赖，自动解析依赖树并下载符合版本约束的库。
   - 使用 `cargo update` 更新依赖到最新兼容版本，`cargo tree` 可视化依赖关系图。
3. 构建与优化
   - 默认生成调试版本（`cargo build`），通过 `--release` 标志编译优化后的生产版本（路径为 `./target/release/`）。
   - 支持增量编译，仅重新编译修改过的代码，提升开发效率。
4. 测试与验证
   - 运行单元测试（`cargo test`）和基准测试（`cargo bench`），确保代码质量。
   - 使用 `cargo check` 快速检查语法错误，不生成可执行文件，适合开发阶段频繁使用。
5. 文档与发布
   - 生成项目文档（`cargo doc`），并支持直接打开浏览器查看（`cargo doc --open`）。
   - 发布项目到官方仓库 `crates.io`（`cargo publish`），需先登录获取 API 令牌。

### 常用命令

> 新版本的`rust`已经自带了`cargo add`和`cargo rm`等命令，不需要另外安装`cargo-edit`。

| 命令                       | 说明                           | 示例                            |
| -------------------------- | ------------------------------ | ------------------------------- |
| `cargo new <项目名>`       | 创建新项目（默认二进制）       | `cargo new my_app`              |
| `cargo new <项目名> --lib` | 创建库项目                     | `cargo new my_lib --lib`        |
| `cargo init`               | 在当前目录初始化项目           | `cd existing_dir && cargo init` |
| `cargo build`              | 编译调试版本                   | `cargo build`                   |
| `cargo build --release`    | 编译优化版本                   | `cargo build --release`         |
| `cargo run`                | 编译并运行项目                 | `cargo run`                     |
| `cargo run --release`      | 运行优化版本                   | `cargo run --release`           |
| `cargo check`              | 检查语法错误（不生成文件）     | `cargo check`                   |
| `cargo test`               | 运行单元测试                   | `cargo test`                    |
| `cargo bench`              | 运行基准测试（需手动编写测试） | `cargo bench`                   |
| `cargo update`             | 更新依赖到最新兼容版本         | `cargo update`                  |
| `cargo tree`               | 显示依赖关系图                 | `cargo tree`                    |
| `cargo doc --open`         | 生成并打开文档                 | `cargo doc --open`              |
| `cargo publish`            | 发布项目到 `crates.io`         | `cargo publish`                 |
| `cargo clean`              | 清理编译产物                   | `cargo clean`                   |

### 举例

1. 创建新项目

~~~bash
# 创建二进制项目（默认）
cargo new my_project

# 创建库项目
cargo new my_lib --lib

# 在已有目录初始化项目
cd existing_dir && cargo init 
~~~

2. 配置项目信息

~~~toml
[package]
name = "my_project"
version = "0.1.0"
edition = "2024"  # Rust 版本
authors = ["Your Name <your.email@example.com>"]

[dependencies]
serde = { version = "1.0", features = ["derive"] }  # 添加依赖
~~~

3. 依赖管理

> - 手动添加：直接编辑 `Cargo.toml` 的 `[dependencies]` 部分。
> - 自动添加（推荐）：使用 `cargo-edit` 工具（需先安装）：
>
> ~~~bash
> cargo install cargo-edit
> cargo add serde --features derive  # 添加 serde 并启用 derive 功能
> ~~~
>
> 

~~~bash
# 更新所有依赖到最新兼容版本（不修改 Cargo.lock）
cargo update

# 更新指定依赖
cargo update serde

# 显示项目依赖关系图（需安装 cargo-tree）
cargo install cargo-tree
cargo tree

# 只显示直接依赖
cargo tree --depth 1

# 将依赖下载到本地缓存（用于离线构建）
cargo vendor
~~~

4. 构建和运行

~~~bash
# 编译调试版本（默认）
cargo build

# 编译优化版本（生产环境使用）
cargo build --release

# 输出路径：
# 调试版：./target/debug/my_project
# 发布版：./target/release/my_project

# 编译并运行调试版本
cargo run

# 运行优化版本
cargo run --release

# 运行指定二进制（多二进制项目时）
cargo run --bin my_bin_name

# 快速检查语法（不生成可执行文件）
cargo check

# 清理编译产物
cargo clean
~~~

5. 测试和调试

~~~bash
# 运行所有测试
cargo test

# 运行指定测试用例
cargo test test_name

# 显示详细输出（如打印语句）
cargo test -- --nocapture

# 需在 Cargo.toml 中启用基准测试支持
# [dev-dependencies]
# criterion = "0.4"

# 运行基准测试
cargo bench

# 使用 println! 打印日志
fn main() {
    println!("Debug info: {}", 42);
}

# 集成调试器（如 gdb 或 lldb）：
# 编译调试版本并启动调试器
rust-gdb target/debug/my_project
~~~

6. 文档和发布

~~~bash
# 生成文档（基于代码注释）
cargo doc

# 生成并打开浏览器查看
cargo doc --open

# 1.注册账号：访问 crates.io 并注册
# 2.获取 API Token：在账号设置中生成 Token
# 3.登录 Cargo：
cargo login YOUR_API_TOKEN

# 发布项目
cargo publish
~~~

7. 工作区（Workspace）管理

~~~bash
# 项目包含多个子项目（如库和二进制工具）时，可使用 工作区 统一管理依赖和构建
# 根目录的 Cargo.toml
[workspace]
members = [
    "my_lib",
    "my_cli",
]
~~~

> - 子项目：在 `members` 指定的目录中创建独立的 `Cargo.toml`。
> - 统一构建：在根目录运行 `cargo build` 会构建所有子项目。

8. 自定义构建脚本

~~~rust
// 通过 build.rs 在编译前执行自定义逻辑（如生成代码、下载资源）

// build.rs
fn main() {
    println!("cargo:warning=Custom build step executed!");
}

// 在 Cargo.toml 中声明
[package]
build = "build.rs"
~~~

9. 常用开发技巧

> 1. 快速重编译：修改代码后直接运行 `cargo run`，Cargo 会增量编译。
> 2. 并行构建：使用 `-j` 参数指定线程数（如 `cargo build -j 4`）。
> 3. 忽略警告：在 `Cargo.toml` 中添加
>
> ~~~toml
> [profile.dev]
> warnings = false
> ~~~
>
> 4. 自定义依赖版本：通过 `Cargo.lock` 锁定依赖版本（不要手动编辑此文件）。

## Cargo.toml

`Cargo.toml` 是 Rust 项目的核心配置文件，采用 **TOML（Tom's Obvious Minimal Language）** 格式编写。它定义了项目的元数据、依赖关系、构建配置等关键信息，是 Cargo 构建系统和包管理器的“指挥中心”。

一个典型的 `Cargo.toml` 文件包含以下部分：

~~~toml
[package]          # 项目元数据
name = "my_project"
version = "0.1.0"
edition = "2021"
authors = ["Your Name <your.email@example.com>"]
 
[dependencies]      # 项目依赖
serde = { version = "1.0", features = ["derive"] }
reqwest = "0.11"
 
[dev-dependencies] # 仅开发环境依赖（如测试工具）
tokio = { version = "1.0", features = ["full"] }
 
[profile.release]  # 发布版本构建配置
opt-level = 3
lto = true
 
[workspace]        # 工作区配置（多项目共享依赖时）
members = ["crates/*"]
~~~

| 配置节               | 用途                                       |
| -------------------- | ------------------------------------------ |
| `[package]`          | 定义项目元数据（名称、版本、作者等）。     |
| `[dependencies]`     | 声明项目运行时依赖。                       |
| `[dev-dependencies]` | 声明仅开发环境需要的依赖（如测试工具）。   |
| `[profile.*]`        | 自定义构建模式（如调试、发布）的优化选项。 |
| `[workspace]`        | 管理多子项目工作区，共享依赖。             |
| `[features]`         | 定义可选功能标志，支持条件编译。           |

### package

项目元数据：定义项目的基本信息，包括名称、版本、Rust 版本等。

~~~toml
[package]
name = "my_project"          # 项目名称（必须唯一，用于 crates.io 发布）
version = "0.1.0"            # 语义化版本（遵循 SemVer 规范）
edition = "2024"             # Rust 版本
authors = ["Alice <alice@example.com>"]  # 作者列表（可多行）
description = "A sample Rust project."   # 项目描述（crates.io 显示）
license = "MIT"              # 许可证（如 MIT/Apache-2.0）
repository = "https://github.com/user/repo"  # 代码仓库链接
keywords = ["cli", "http"]   # 关键词（crates.io 搜索用）
exclude = ["*.test.rs"]     # 发布时排除的文件（支持 glob 模式）
~~~

> - **`name`**：必须为小写字母、数字、`-` 或 `_` 的组合，且不能与已有 crate 重名。
> - **`version`**：遵循 [语义化版本](https://semver.org/)（如 `1.0.0`、`0.2.3-alpha`）。
> - **`edition`**：指定 Rust 语言版本，影响语法兼容性（如 `async` 语法需 2018 或更高版本）。

### dependencies

项目依赖：声明项目运行时所需的外部库（crate），支持多种配置方式。

1. 基本依赖声明

~~~toml
# 指定版本（固定版本）
serde = "1.0.188"

# 版本范围（兼容最新 1.0.x）
serde = "1.0"

# 版本范围（兼容 1.0.0 到 2.0.0 之间，但不包括 2.0.0）
serde = ">=1.0, <2.0"
~~~

2. 带功能的依赖：某些 crate 支持通过 `features` 启用可选功能

~~~toml
serde = { version = "1.0", features = ["derive"] }  # 启用 derive 宏
~~~

3. 路径依赖（本地开发）：直接引用本地其他项目（无需发布到 crates.io）

~~~toml
my_local_crate = { path = "../my_local_crate" }
~~~

4. git依赖：从 Git 仓库引用未发布的代码

~~~toml
my_git_crate = { git = "https://github.com/user/repo", branch = "main" }
~~~

### dev-dependencies

开发环境依赖：仅在开发（如测试、基准测试）时需要的依赖，不会包含在最终发布中。

~~~toml
[dev-dependencies]
tokio = { version = "1.0", features = ["full"] }  # 异步运行时（仅测试用）
criterion = "0.5"  # 基准测试工具
~~~

### profile.*

构建配置：自定义不同构建模式（如调试、发布）的优化选项。

~~~toml
[profile.dev]     # 调试版本配置
opt-level = 0     # 优化级别（0-3，0 表示不优化）
debug = true      # 包含调试信息

[profile.release] # 发布版本配置
opt-level = 3     # 最高优化
lto = true        # 启用链接时优化（Link Time Optimization）
codegen-units = 1 # 减少并行编译单元，提升优化效果

# 如果想优化体积而非速度
[profile.release]
opt-level = "z"  # 优化体积（而非速度）
lto = true
~~~

### workspace

多项目管理：当项目包含多个子项目（如库和二进制工具）时，通过工作区统一管理依赖。

> - 子项目：每个成员目录需包含独立的 `Cargo.toml`。
> - 共享依赖：根目录的 `[dependencies]` 会被所有子项目继承。
> - 优势：
>   - 避免重复下载依赖。
>   - 统一版本号管理。
>   - 支持跨子项目引用（如 `my_cli` 依赖 `my_lib`）。

~~~toml
[workspace]
members = [
    "crates/my_lib",
    "crates/my_cli",
]
~~~

### features

自定义功能标志：定义可选功能，用户可通过 `cargo build --features` 启用。

~~~toml
[features]
default = ["json"]  # 默认启用 json 功能
json = ["serde_json"]  # 启用 json 功能时依赖 serde_json
~~~

### bin

多二进制项目：当项目包含多个可执行文件时，指定入口文件。

~~~toml
[[bin]]
name = "my_cli"
path = "src/cli/main.rs"

[[bin]]
name = "my_daemon"
path = "src/daemon/main.rs"
~~~

### lib

库项目配置：自定义库的编译行为。

~~~toml
[lib]
name = "my_lib"          # 库名称（默认为项目名）
path = "src/lib.rs"      # 入口文件路径
crate-type = ["cdylib"]  # 生成动态库（如用于 FFI）
~~~

### 其他

1. 如何解决依赖冲突

> - 使用 `cargo update` 更新依赖到兼容版本。
> - 通过 `cargo tree -i <crate_name>` 查看冲突来源。
> - 显式指定依赖版本或使用 `[patch.crates-io]` 覆盖版本：
>
> ~~~toml
> [patch.crates-io]
> serde = { git = "https://github.com/serde-rs/serde", branch = "fix-version" }
> ~~~
>
> 

2. 如何加速构建

> - 启用并行编译：`cargo build -j 4`（4 线程）。
> - 使用 `sccache` 缓存编译结果：
>
> ~~~toml
> [build]
> rustc-wrapper = "sccache"
> ~~~
>
> 

3. 如何发布私有包

> - 在`Cargo.toml`中指定私有仓库：
>
>   ```toml
>   [registry]
>   default = "my-private-registry"
>   ```
>
> - 或通过环境变量 `CARGO_REGISTRIES_MY_REGISTRY_INDEX` 配置。

4. 如何忽略文件

> 在 `[package]` 中使用 `exclude` 字段：
>
> ~~~toml
> [package]
> exclude = [
>     "*.test.rs",
>     "docs/*",
>     "target/*",
> ]
> ~~~
>
> 

## cargo-edit

`cargo-edit` 是一个用于简化 Rust 项目依赖管理的工具，它通过命令行指令实现依赖的添加、删除、升级等操作，避免了手动编辑 `Cargo.toml` 文件的繁琐过程。

~~~bash
# 安装
cargo install cargo-edit
# 验证安装是否成功
cargo edit --version

# 添加依赖项
cargo add <依赖项名称>
# 添加指定版本的依赖项
cargo add <依赖项名称>@<版本号>
# 添加带有功能的依赖
cargo add <依赖项名称> --features <功能列表>

# 删除依赖项
cargo rm <依赖项名称>

# 升级所有依赖项
cargo upgrade
# 升级特定依赖项
cargo upgrade <依赖项名称>
# 升级到特定版本
cargo upgrade <依赖项名称> --to <版本号>

# 查看依赖信息
cargo install cargo-tree
cargo tree
~~~



# 基本语法

## 变量和常量

### 变量

- 使用`let`声明变量，支持自动推导变量类型，手动指定类型需要在变量后面加冒号。
- 默认不可变：变量默认不可变（类似 `const`），需显式使用 `mut` 声明可变变量。
- 变量命名使用`Snake Case`（下划线分隔），枚举和结构体使用`Pascal Case`（大驼峰）。
- 强制类型转换使用`as`关键字。
- 打印变量可以使用`{}`和`{:?}`。

> 注：变量没有使用会警告和报错，可以变量前加下划线，消除警告和报错。  

```rust
let x = 5;       // 自动推导类型 i32，不可变
let mut y = 10;  // 可变
y = 20;          // 允许修改
// x = 6;       // 编译错误！
let z: i64 = 6	// 手动指定类型

let a = 3.1;
let b = a as i32;	// 强制转换类型

println!("val: {}", x);	// 使用 {} 方式
println!("val: {x}");	// 使用 {:?} 方式
```

- 变量遮蔽（Shadowing Variables）：`rust`允许你在同一作用域声明相同名称的变量名，新变量会“遮蔽”（隐藏）旧变量。这与常规的变量声明（如 `let`）不同，因为它**不依赖可变性**，且能改变变量的值、类型和可变性。

~~~rust
let x = 1; // 不可变
println!("{x}");

let x = 2; // 变量遮蔽，改变值
println!("{x}");

let x = 3.6; // 变量遮蔽，改变类型
println!("{x}");

let mut x = 4.2; // 变量遮蔽，改变可变性
println!("{x}");
x = 5.4;
println!("{x}");
~~~

### 常量

> 命名规范：常量名与静态变量名使用大写字符，单词间用下划线分隔。

- 常量的值必须是在编译阶时已知的常量表达式，必须指定类型与值。
- 与C语言的宏定义（宏替换）不同，rust 的`const`常量的值会被直接嵌入到生成到底层机器码中，而不是简单的字符替换。
- 常量的作用域是块级。

### 静态变量

- 运行时分配内存，默认不可变，其生命周期为整个程序的运行时间。

- 可变静态变量需要使用`mut`关键字声明，其使用和修改只能在`unsafe`块中。

> 无法使用`print`等函数直接打印可变静态变量，例如`print!("{HOUR}")` ，因为该函数会自动创建变量的引用（隐式引用），导致可变变量存在多个引用。
>
> 引用 `static mut` 在 Rust 中是危险的，因为它违反了 Rust 的“可变性和别名”规则（mutability XOR aliasing）。这个规则要求：
>
> - 如果一个变量是可变的，那么它不能有多个引用（即不能同时有可变引用和不可变引用）。
> - 如果一个变量有多个引用，则它必须是不可变的。
>
> 注：Rust 2024版本`static_mut_refs` 这个 lint 的默认级别才变成了 `deny`，之前的版本是可以创建`static mut`变量的多个引用的，编译器只会警告而不会报错。
>
> 可参考文章：[Rust 2024：禁止引用 static mut 及安全替代方法本文首发公众号 猩猩程序员 欢迎关注 什么是 stat - 掘金 (juejin.cn)](https://juejin.cn/post/7523509642178183178)

~~~rust
static MINUTE: usize = 60;
static mut HOUR: usize = 60 * MINUTE;

fn main() {
    const AGE: i32 = 4;
    println!("{}", AGE);

    println!("{MINUTE}");
    // MINUTE = 120;    // 不能修改

    // 不能打印，可变静态变量必须在unsafe块中使用
    // print!("{HOUR}");    
    unsafe {
        // MINUTE = 120;    // 不能修改
        // println!("{HOUR}");  // 不能打印，提示：shared reference to mutable static
        let mut hour = HOUR;
        println!("{hour}");
        HOUR = 120 * MINUTE;
        hour = HOUR;
        println!("{hour}");
    }
}
~~~



## 数据类型

### 标量类型

- 整数：`i8`、`i16`、`i32`、`i64`、`i128`、`u8`、`u16`、`u32`、`u64`、`u128`（自动推断为`i32`）
- 平台决定（Platform-Specific Integer Type）：`usize`、`isize`
- 浮点数：`f32`、`f64`（自动推断为`f64`）
- 布尔：`bool`（`true`和`false`）
- 字符`char`（使用单引号表示，支持`Unicode`字符）

```rust
let a1 = 32; // 自动类型推断为i32
let a2: i8 = 4;
let a3: i64 = 0xFF;
let a4: i128 = 0o77;
let a5: u128 = 0b10;
println!("{a1} {a2} {a3}, {a4} {a5}");
println!("i32-Max: {} u32-Max: {}", i32::MAX, u32::MAX);
println!("i32-Min: {} u32-Min: {}", i32::MIN, u32::MIN);
println!("isize byte: {} usize byte: {}", std::mem::size_of::<isize>(), std::mem::size_of::<usize>());

let b1 = 23.414324;  // 自动类型推断为f64
let b2: f32 = 64.361236;
println!("{b1:.2} {b2:.4}");    // :.n 表示保留n位小数位

let c1 = true;
println!("{c1} {}", !c1);

let d1 = '好';
println!("{d1} {}", '❤');
println!("{}", '❤' as usize);
```

### **复合类型**

#### 元组和数组

- **元组（Tuple）**：固定长度，可包含不同类型。
  - 元组无法（即无需）获取长度，因为元组的类型和长度是编译时确定的，属于类型系统的一部分。
  - 编译时确定了各个元素的类型，所以修改元素值只能用同类型的值。

- **数组（Array）**：固定大小，同类型元素。

```rust
let tup = (0, "你好", 3.6);
println!("{} {} {}", tup.0, tup.1, tup.2);
let mut tup2 = (0, "你好", 3.6);
//tup2.0 = "love";    // 无法修改，同类型的值才能改
tup2.1 = "love";
println!("{:?}", tup2); // :? 可以用来打印整个数据结构
println!("{:?}", ());   // 空元组打印结果为：()
let arr = [1, 2, 3];
let mut arr2 = [1, 2];
let arr3: [i32; 0] = [];    // 空数组必须指定类型
println!("{:?} len: {}", arr, arr.len());
arr2[1] = 12;
println!("{:?} len: {}", arr2, arr2.len());
println!("{:?} len: {}", arr3, arr3.len());

let arr4 = [0; 4];  // n; m 表示初始化m个值为n的元素
for ele in arr4 {
  print!("{ele} ")
}
```

#### 结构体

结构体（Struct）用于自定义复合类型，将多个相关值组合成一个命名实体，类型包括三种：

> 结构体中直接定义的常量叫做**关联常量**，通过`::`调用。

- 具名字段结构体（Named-Field Struct）：每个字段有明确的名称，访问时通过 `.字段名` 的方式。
- 元组结构体（Tuple Struct）：类似于具名字段结构体，但没有字段名，只有类型；通过 `.0`, `.1`, `.2` 等方式访问字段；适用于需要简单封装多个值，但不需要字段名的情况。
- 单元结构体（Unit-like Struct）：没有字段，类似于 `()`（单元类型），适用于实现 trait 而不需要存储数据，或者作为标记类型。

~~~rust
// 具名字段结构体
#[derive(Debug)] // 自动派生User的Debug, {:?} 格式化参数要求实现Debug特质(trait)
struct User {
    name: String,
    age: i32,
}

// 元组结构体
#[derive(Debug)]
struct MyTup(i32, f64, String);

// 单元结构体
#[derive(Debug)]
struct MyUnit;

fn main() {
    let user = User {
        name: "biluo".to_string(),
        age: 18,
    };
    println!("具名字段结构体: {:?} 值: name-{} age-{}", user, user.name, user.age);
    let my_tup = MyTup(2, 2.4, "lisi".to_string());
    println!("元组结构体: {:?} 值: 0-{} 1-{} 2-{}", my_tup, my_tup.0, my_tup.1, my_tup.2);
    println!("单元结构体: {:?}", MyUnit);
}
~~~



**结构体（Struct）函数** 是定义在结构体上下文中的函数，用于封装与结构体实例相关的行为。分为 **关联函数（Associated Functions）** 和 **方法（Methods）**，前者通过 `::` 调用（如 `String::new()`），后者通过 `.` 调用（如 `str.len()`）。

- 方法（也可以称为实例方法）通过实例调用，参数可以为：`&self`（实例的引用）、`&mut self`（可变实例的引用）、`self`（会交出所有权）。
- 关联函数关联的对象可以用结构体名和`Self`表示。

~~~rust
#[derive(Debug)]
struct User {
    name: String,
    age: i32,
}

impl User {
    // 方法
    fn compare_age(&self) {
        // Self 就表示 User
        if self.age >= Self::ADULT_AGE {
            println!("我成年了,game无时长限制");
            return;
        }
        println!("我未成年,不能爽玩game");
    }
    // 关联函数
    fn print(user: User) -> User {
        println!("name: {}, age: {}", user.name, user.age);
        user
    }
    // 关联常量
    const ADULT_AGE: i32 = 18;
}

fn main() {
    let user = User {
        name: "biluo".to_string(),
        age: 16,
    };
    user.compare_age();
    println!("{:?}", User::print(user));
}
~~~



#### 枚举

枚举（Enum）是一种用户自定义的数据类型，用于表示具有一组离散可能值的变量。

- 每种可能值都称为`variant`（变体）。
- 使用方式：枚举名::变体名 或 枚举名::变体名(值)
- 枚举可以使用嵌入类型和枚举类型。

常用的枚举类型：

~~~rust
pub enum Option<T> {
  None,
  Some(T),
}

pub enum Result<T, E> {
	Ok(T),
  Err(E),
}
~~~

**匹配模式**

- 使用`match`关键字。
- 必须覆盖所有的变体。
- 可以用`_`、`..=`、`if`语句等来进行匹配。

~~~rust
enum Color {
    Red,
    Yellow,
    Blue,
    Black,
    Orange,
}

fn print_color(color: Color) {
    let i = 2;
    match color {
        Color::Red => println!("red"),
        Color::Blue | Color::Yellow => println!("bule or yellow"),
        Color::Black if i % 2 == 0 => println!("black"),
        _ => println!("orange"),
    }
}

fn main() {
    print_color(Color::Red);
    print_color(Color::Blue);
    print_color(Color::Yellow);
    print_color(Color::Black);
    print_color(Color::Orange);
}
~~~

**`if let` 简化匹配**

如果只关心一种情况，可以用 `if let`：

~~~rust
let some_value = Some(3);
if let Some(3) = some_value {
    println!("Three!");
}
~~~

总的示例：

~~~rust
#[derive(Debug)]
enum Shape {
    Circle(f64),
    Rectangle(f64, f64),
    //Square(Shape), // ❌ 错误：递归嵌套，导致无限大小
    // Box<T> 是一个智能指针，它在堆上分配内存，并固定存储一个指针的大小（通常为 usize）
    Square(Box<Shape>), // 用 Box 包装递归部分
}

impl Shape {
  	// 枚举的方法
    fn print_shape(self) {
        match self {
            Shape::Circle(r) => println!("圆 半径-{r}"),
            Shape::Rectangle(h, w) => println!("长方形 长-{h} 宽-{w}"),
            Shape::Square(s) => {
              	// 打印这里的 s 也可以使用 *s 因为Box实现了Debug会自动解引用
                print!("正方形 shape: {:?} ", s);
                // 方式1: 解构-打印具体的值（if let 简化匹配）
                if let Shape::Rectangle(h, _) = *s {
                    print!("边长-{h} 实际是: ");
                }
                // 方式2: 继续匹配打印值
                s.print_shape();
            }
        }
    }
}

fn main() {
    let circle = Shape::Circle(2.4);
    circle.print_shape();
    Shape::Rectangle(2.4, 3.6).print_shape();
    Shape::Square(Box::new(Shape::Rectangle(3.0, 3.0))).print_shape();
    println!("{:?}", Shape::Circle(3.6));
}
~~~



#### 字符串

> 注意：`String`是具有所有权的，而`&str`没有。
>
> Struct 推荐使用`String`（结构体中如果不显式声明生命周期，无法使用 &str）
>
> 函数参数推荐用`&str`（不想交出所有权时）
>
> - `&str`为参数时，可以传递`&str`和`&String`。
>
>   > `String` 是一个智能指针，内部存储 `Vec<u8>`，但实现了 `Deref<Target=str>`，因此可以通过 `&*string` 或自动解引用得到 `&str`。
>
> - `&String`为参数时，只能传递`&String`。
>
> `str` 是一个**动态大小类型（DST, Dynamically Sized Type）**，这意味着它的大小在编译时无法确定（因为字符串的长度可以任意）。因此，**不能直接使用 `str` 作为函数参数或变量类型**，而必须使用它的引用形式 `&str`（字符串切片）。
>
> | 类型      | 所有权             | 借用           | 生命周期                                        | 典型用途                           |
> | --------- | ------------------ | -------------- | ----------------------------------------------- | ---------------------------------- |
> | `String`  | 转移所有权（Move） | ❌ 无           | 无（独立拥有数据）                              | 需要获取字符串所有权的场景         |
> | `&str`    | ❌ 无               | 是（共享借用） | 可隐式推断（通常 `'static` 或函数参数生命周期） | 接受字符串字面量或 `String` 的切片 |
> | `&String` | ❌ 无               | 是（共享借用） | 必须显式标注（如 `'a`）                         | 极少使用，通常用 `&str` 替代       |
> | `str`     | ❌ 无               | ❌ 不能直接使用 | 无（DST，动态大小类型）                         | 通常用 `&str` 代替                 |
>
> 为什么 `&String` 可以自动转为 `&str`：
>
> - `String` 是一个智能指针，内部存储 `Vec<u8>`，但实现了 `Deref<Target=str>`，因此可以通过 `&*string` 或自动解引用得到 `&str`。
> - 当函数期望 `&str` 但传入 `&String` 时，编译器会自动插入 `*` 解引用，相当于 `&*(your_string)`，最终得到 `&str`。

- `String`：一个堆分配的可变字符串类型。

~~~rust
pub struct String {
  vec: Vec<u8>
}
~~~

- `&str`：字符串切片引用，栈上分配，不可变引用；指向存储到内存里的UTF-8编码的字符串数据，由指针和长度构成。

示例代码：
~~~rust
// 三种方法从字面量转换为String
let name = String::from("biluo-study");
let book = "Rust从入门到入土".to_owned();
let age = "124".to_string();
let new_name = name.replace("biluo", "er");
println!("{name} {book} {age} {new_name}");
println!("type: {}", std::any::type_name_of_val(&name)); // 结果: alloc::string::String

// 字面量是&str类型
let rust = "\x52\x75\x73\x74";   // ascii码方式
println!("{rust}");
println!("type: {}", std::any::type_name_of_val(rust)); // 结果: str
~~~

函数举例：

~~~rust
fn print_str1(s: String) {
    println!("{}", s);
}

fn print_str2(s: &String) {
    println!("{}", s);
}

fn print_str3(s: &str) {
    println!("{}", s);
}

fn main() {
    let str = "hello".to_string();
    print_str1(str);    // 会转移所有权,str后续无法使用
    let str2 = "hello".to_string();
    print_str2(&str2);    
    print_str3(&str2);
    print_str3("hello");
}
~~~

**`String` 和 `str` 的关系**

- `String` 是 `str` 的“包装器”：
  - `String` 在堆上分配可变字符串，而 `str` 是对字符串数据的不可变引用（可以是静态或动态分配的）。
  - `String` 可以解引用为 `str`（因为 `String` 的数据布局兼容 `str`），但 `str` 无法“升级”为 `String`（因为 `str` 没有所有权）。
- 自动解引用是单向的：
  - `&String` → `&str` ✅（通过 `Deref`）
  - `&str` → `&String` ❌（无逆向转换）。

## 运算符

### 算术运算符

算术运算符（Arithmetic Operators）：用于基本数学运算。

| 运算符 | 名称         | 示例    | 说明                             |
| ------ | ------------ | ------- | -------------------------------- |
| `+`    | 加法         | `a + b` | 整数、浮点数、字符串拼接         |
| `-`    | 减法         | `a - b` | 整数、浮点数                     |
| `*`    | 乘法         | `a * b` | 整数、浮点数                     |
| `/`    | 除法         | `a / b` | 整数除法向下取整，浮点数精确除法 |
| `%`    | 取模（余数） | `a % b` | 返回除法余数                     |
| `-`    | 负号（一元） | `-a`    | 取反                             |

### 逻辑运算符

逻辑运算符（Logical Operators）：用于布尔逻辑判断。

| 运算符 | 名称   | 示例     | 说明                             |
| ------ | ------ | -------- | -------------------------------- |
| `&&`   | 逻辑与 | `a && b` | 两者为 `true` 才返回 `true`      |
| `||`   | 逻辑或 | `a || b` | 两者任意一个为`true`就返回`true` |
| `!`    | 逻辑非 | `!a`     | 取反                             |

### 位运算符

位运算符（Bitwise Operators）：直接操作二进制位。

| 运算符 | 名称     | 示例     | 说明                           |
| ------ | -------- | -------- | ------------------------------ |
| `&`    | 按位与   | `a & b`  | 对应位均为 `1` 时结果为 `1`    |
| `|`    | 按位或   | `a | b`  | 对应位任意一个为`1`时结果为`1` |
| `^`    | 按位异或 | `a ^ b`  | 对应位不同时结果为 `1`         |
| `!`    | 按位非   | `!a`     | 所有位取反（一元运算符）       |
| `<<`   | 左移     | `a << b` | 将 `a` 的二进制位左移 `b` 位   |
| `>>`   | 右移     | `a >> b` | 将 `a` 的二进制位右移 `b` 位   |

### 比较运算符

比较运算符（Comparison Operators）：用于比较两个值的关系。

| 运算符 | 名称     | 示例     | 说明               |
| ------ | -------- | -------- | ------------------ |
| `==`   | 等于     | `a == b` | 判断是否相等       |
| `!=`   | 不等于   | `a != b` | 判断是否不相等     |
| `>`    | 大于     | `a > b`  | 判断是否大于       |
| `<`    | 小于     | `a < b`  | 判断是否小于       |
| `>=`   | 大于等于 | `a >= b` | 判断是否大于或等于 |
| `<=`   | 小于等于 | `a <= b` | 判断是否小于或等于 |

### 赋值运算符

赋值运算符（Assignment Operators）：用于变量赋值或复合运算。

| 运算符 | 名称           | 示例      | 说明                |
| ------ | -------------- | --------- | ------------------- |
| `=`    | 赋值           | `a = b`   | 将 `b` 的值赋给 `a` |
| `+=`   | 加后赋值       | `a += b`  | 等价于 `a = a + b`  |
| `-=`   | 减后赋值       | `a -= b`  | 等价于 `a = a - b`  |
| `*=`   | 乘后赋值       | `a *= b`  | 等价于 `a = a * b`  |
| `/=`   | 除后赋值       | `a /= b`  | 等价于 `a = a / b`  |
| `%=`   | 取模后赋值     | `a %= b`  | 等价于 `a = a % b`  |
| `&=`   | 按位与后赋值   | `a &= b`  | 等价于 `a = a & b`  |
| `|=`   | 按位或后赋值   | `a |= b`  | 等价于`a = a | b`   |
| `^=`   | 按位异或后赋值 | `a ^= b`  | 等价于 `a = a ^ b`  |
| `<<=`  | 左移后赋值     | `a <<= b` | 等价于 `a = a << b` |
| `>>=`  | 右移后赋值     | `a >>= b` | 等价于 `a = a >> b` |

### 其他运算符

- 类型转换运算符（Type Casting Operators）：Rust 使用 `as` 进行安全类型转换。

| 运算符 | 名称     | 示例     | 说明                  |
| ------ | -------- | -------- | --------------------- |
| `as`   | 类型转换 | `a as b` | 将 `a` 转换为类型 `b` |

- 范围运算符（Range Operators）：用于生成范围。

| 运算符 | 名称     | 示例    | 说明                   |
| ------ | -------- | ------- | ---------------------- |
| `..`   | 排他范围 | `a..b`  | `[a, b)`（不包含 `b`） |
| `..=`  | 包含范围 | `a..=b` | `[a, b]`（包含 `b`）   |

- 解引用运算符（Dereference Operator）

| 运算符 | 名称   | 示例   | 说明               |
| ------ | ------ | ------ | ------------------ |
| `*`    | 解引用 | `*ptr` | 获取指针指向的值   |
| `&`    | 取地址 | `&var` | 获取变量的内存地址 |

- 空指针检查（Null Check）：Rust 使用 `Option` 和 `?` 运算符处理可能的空值。

| 运算符 | 名称     | 示例 | 说明                                 |
| ------ | -------- | ---- | ------------------------------------ |
| `?`    | 错误传播 | `a?` | 如果 `a` 是 `None`，则提前返回 `Err` |

### 优先级

Rust 运算符的优先级（从高到低）：

1. `*` `/` `%`（算术）
2. `+` `-`（算术）
3. `<<` `>>`（移位）
4. `&`（按位与）
5. `^`（按位异或）
6. `|`（按位或）
7. `==` `!=` `<` `>` `<=` `>=`（比较）
8. `&&`（逻辑与）
9. `||`（逻辑或）
10. `=` `+=` `-=` 等（赋值）

## 控制流

### 流程控制结构

1. 顺序结构（Sequential Structure）： 程序按照代码的顺序一步一步执行，没有跳过或循环。

2. 选择结构（Selection Structure）： 根据条件选择不同的路径执行。常见的选择结构有:

   * `if`语句： 根据条件执行不同的代码块。
   * `switch`语句（在某些编程语言中）： 根据不同的条件值执行不同的代码块。

3. 循环结构（Iteration Structure）： 重复执行一段代码，直到满足某个条件为止。常见的循环结构有:

   - `for`循环： 按照指定的次数重复执行一段代码。
   - `while`循环： 在条件为真的情况下重复执行一段代码。
   - `do-while`循环：类似于while循环，但是保证至少执行一次循环体。

4. 跳转结构：控制程序的执行流程跳转到指定的位置。常见的跳转结构有:

   - `break`语句： 终止循环或`switch`语句的执行。

   - `continue`语句： 跳过当前循环中的剩余代码，进入下一次迭代。

   - `goto`语句（在某些编程语言中）： 直接跳转到指定的标签处。

### 选择结构

- `if` 表达式必须返回 `bool`，支持 `else if` 和 `else`，可以嵌套使用。

```rust
let num = 10;
if num < 60 {
    println!("未及格");
} else if num < 80 {
    println!("及格分，一般般");
} else {
    println!("你非常滴优秀");
}
```

- `match`表达式：`match 要匹配的变量 { 条件匹配语句 }`
  - `m..n`表示匹配左闭右开的区间：`[m, n)`，`m..=n`则表示：`[m, n]`，`m..`则表示为：`[m, 类型上限值]`
  - 匹配语句可以使用`if`表达式。
  - `_` 表示匹配剩余所有情况。
  - `|` 表示或

~~~rust
match num {
  0..60 => println!("未及格"),
  x if x > 60 && x < 80 => println!("及格分，一般般"),
  80..=100 => println!("你非常滴优秀"),
  101.. => {
    println!("你是不是开挂了，满分才100")
  }
  -100 | -199..-100 => println!("范围[-199, 100]"),
  _ => println!("负分...优秀"),
}
~~~

- `if`适用于简单的选择控制，`match`则更适合用于复杂的模式匹配，更为灵活。

### 跳转结构

- `break`：用于立即终止循环，并跳出循环体；还可以用于跳出指定标签的循环。
- `continue`：用于立即跳过当前这一轮循环中剩余的代码，直接进入下一次循环。

### 循环结构

- `loop`：无限循环，直到遇到 `break` 或 `return`。
- `while`：条件循环，只要条件为 `true` 就继续执行。
- `for`：通常用于迭代集合，但本质上是一个语法糖，底层依赖迭代器（Iterator）。

```rust
let mut count = 0;
loop {
    count += 1;
    if count == 5 { break; }
}
 
let mut x = 5;
while x > 0 {
    println!("x: {}", x);
    x -= 1;
}

// 遍历范围
for i in 1..5 {
    println!("i: {}", i); // 1, 2, 3, 4
}

// 遍历向量
let numbers = vec![10, 20, 30];
for num in numbers.iter() {
    println!("num: {}", num); // 10, 20, 30
}

// 遍历并修改（使用可变引用）
let mut numbers = vec![1, 2, 3];
for num in numbers.iter_mut() {
    *num *= 2; // 解引用并修改
}
println!("{:?}", numbers); // [2, 4, 6]
```

> 迭代：rust的迭代器通过`iterators`来实现，迭代器是一个抽象，提供了一种访问集合元素的统一方式。从实现上讲，迭代器是一种实现了`Iterator trait`的类型。
>
> ~~~rust
> // 简化的源码
> pub trait Iterator {
>   type Item;
>   fn next(&mut self) -> Option<Self::Item>;
> }
> ~~~

## 函数

### 基本概念

Rust中函数使用`fn`关键字定义，`main`函数是程序的入口点，是一种特殊的函数。

函数可以接受零个或多个参数，每个参数需要指定类型；返回值用`->` 指定，如果函数没有返回值，可以使用`-> ()`表示或直接省略一部分的编写。

如果数据类型实现了Copy特质，则在函数传参时会进行`Copy by value`操作，拷贝出新的值作为形参。

~~~rust
// 无参数无返回值的函数
fn greet() {
    println!("Hello, Rust!");
}

// 带参数和返回值的函数
fn add(a: i32, b: i32) -> i32 {
    a + b // 隐式返回（不需要return和分号）
}

// 调用函数
fn main() {
    greet(); // 输出: Hello, Rust!
    let sum = add(3, 5);
    println!("Sum: {}", sum); // 输出: Sum: 8
}
~~~

如果传入函数的参数值是`non-Copy value`，会把`value`的所有权移动给形参，函数执行完后如果所有权没有返回，则会释放到`value`的内存。

~~~rust
fn take_ownership(s: String) {
    println!("{}", s);
} // `s` 在这里被丢弃

fn main() {
    let s = String::from("hello");
    take_ownership(s); // 所有权转移
    // println!("{}", s); // ❌ 错误：s 已移动
}
~~~

如果形参类型是 `&T`，函数会借用实参的不可变引用。

~~~rust
fn borrow(s: &String) {
    println!("{}", s);
}

fn main() {
    let s = String::from("hello");
    borrow(&s); // 传递引用
    println!("{}", s); // ✅ 仍然可用
}
~~~

如果形参类型是 `&mut T`，函数可以修改实参。

~~~rust
fn append_world(s: &mut String) {
    s.push_str(", world!");
}

fn main() {
    let mut s = String::from("hello");
    append_world(&mut s);
    println!("{}", s); // 输出: hello, world!
}
~~~

### 返回引用

**函数返回引用**：函数返回引用时需要特别注意**生命周期（Lifetimes）**，以确保返回的引用不会指向已经失效的数据（即悬垂引用）

> 生命周期省略的三大规则：
>
> - 函数有多个引用参数（如 `&T` 或 `&mut T`）时，编译器为每个参数分配一个独立的生命周期（如 `'a`, `'b`, `'c`）。
> - 函数返回引用，且只有一个输入参数是引用，会自动将入参引用的生命周期分配给返回的引用。
> - 方法（`impl` 块中的函数）的第一个参数是 `&self` 或 `&mut self` 时，如果方法返回引用，返回的生命周期与 `self` 的生命周期绑定，否则忽略。

- 函数返回引用，且只有一个输入参数是引用，生命周期不需要声明。
- 其他情况下需要声明引用的生命周期。
- 静态引用 `'static` ：如果引用指向全局数据（如字符串字面量），可以使用 `'static` 生命周期。（需慎用）

~~~rust
// 声明生命周期 'a，表示返回的引用与输入参数 `s` 的生命周期相同
fn get_first_char<'a>(s: &'a str) -> &'a str {
  &s[0..1] // 返回字符串的第一个字符（切片）
}

fn get_hello() -> &'static str {
  "Hello, world!" // 字符串字面量具有 'static 生命周期
}

fn main() {
  let s = String::from("Hello");
  let first = get_first_char(&s); // 返回的引用绑定到 `s` 的生命周期
  println!("{}", first); // ✅ 安全：`s` 存活到此处

  let s = get_hello();
  println!("{}", s); // ✅ 安全：'static 数据始终有效
}
~~~

| **场景**           | **解决方案**                    | **生命周期注解**     |
| ------------------ | ------------------------------- | -------------------- |
| 返回局部变量的引用 | 避免，或返回所有权（`T`）       | 不适用（编译错误）   |
| 返回输入参数的引用 | 使用 `&'a T` 并标注生命周期     | `'a`                 |
| 返回静态数据       | 使用 `&'static T`               | `'static`            |
| 返回结构体中的引用 | 在结构体定义中标注生命周期      | `struct<'a> { ... }` |
| 返回可变引用       | 使用 `&'a mut T` 并确保独占访问 | `'a`                 |

## **8. 错误处理**

- 使用 `Result<T, E>` 类型处理可恢复错误。

```rust
use std::fs::File;
 
fn read_file(path: &str) -> Result<String, std::io::Error> {
    let content = File::open(path)?; // `?` 运算符传播错误
    Ok(String::new()) // 实际应读取文件内容
}
 
match read_file("test.txt") {
    Ok(text) => println!("Content: {}", text),
    Err(e) => println!("Error: {}", e),
}
```

------

## **9. 模块系统**

- 通过 `mod` 组织代码，`use` 导入路径。

```rust
// 文件: lib.rs
mod utils {
    pub fn greet() { println!("Hello!"); }
}
 
use utils::greet;
fn main() {
    greet(); // 调用模块中的函数
}
```

### 举例

以一个计算器小程序为例：

#### 非库项目

1. 目录结构

```
calculator/
├── Cargo.toml       # 项目配置
├── src/             # 源代码目录
│   ├── main.rs      # 二进制入口（唯一入口）
│   ├── ops/         # 操作模块
│   │   ├── add.rs   # 加法实现
│   │   ├── sub.rs   # 减法实现
│   │   └── mod.rs   # 模块声明
│   └── utils/       # 可选：工具模块（如输入解析）
│       └── mod.rs   # 工具模块声明
└── tests/           # 测试目录（可选）
    └── integration_tests.rs  # 集成测试
```

2. 关键文件示例

> - `Cargo.toml`：不再需要`[lib]`配置，仅保留二进制配置（默认已存在）：
>
> ~~~toml
> [package]
> name = "calculator"
> version = "0.1.0"
> edition = "2021"
>  
> [[bin]]  # 可选：显式声明二进制目标（默认已存在）
> name = "calculator"
> path = "src/main.rs"
> ~~~
>
> - `src/main.rs`
>
> ~~~rust
> mod ops;  // 导入操作模块
> mod utils; // 导入工具模块（可选）
> 
> fn main() {
>     let a = 10;
>     let b = 5;
> 
>     // 调用加法
>     let sum = ops::add::add(a, b);
>     println!("{} + {} = {}", a, b, sum);
> 
>     // 调用减法
>     let diff = ops::sub::sub(a, b);
>     println!("{} - {} = {}", a, b, diff);
> 
>     // 可选：调用工具函数（如解析输入）
>     if let Ok(input) = utils::parse_input("3 + 4") {
>         println!("Parsed input: {:?}", input);
>     }
> }
> ~~~
>
> - 模块定义（`src/ops/mod.rs`）
>
> ~~~rust
> pub mod add;  // 导出加法模块
> pub mod sub;  // 导出减法模块
> ~~~
>
> - 加法模块（`src/ops/add.rs`）
>
> ~~~rust
> pub fn add(a: i32, b: i32) -> i32 {
>     a + b
> }
> ~~~
>
> - 减法模块（`src/ops/sub.rs`）
>
> ~~~rust
> pub fn sub(a: i32, b: i32) -> i32 {
>     a - b
> }
> ~~~
>
> - 工具模块（可选，src/utils/mod.rs）
>
> ~~~rust
> pub fn parse_input(input: &str) -> Result<(i32, i32, &str), &'static str> {
>     let parts: Vec<&str> = input.split_whitespace().collect();
>     if parts.len() != 3 {
>         return Err("Invalid input format");
>     }
>     let a = parts[0].parse().map_err(|_| "Invalid number")?;
>     let op = parts[1];
>     let b = parts[2].parse().map_err(|_| "Invalid number")?;
>     Ok((a, b, op))
> }
> ~~~

3. 测试

> - 单元测试（直接在模块文件中）：在 `src/ops/add.rs` 或 `src/ops/sub.rs` 中添加测试内容。
>
> ~~~rust
> #[cfg(test)]
> mod tests {
>     use super::*;
> 
>     #[test]
>     fn test_add() {
>         assert_eq!(add(2, 3), 5);
>     }
> }
> ~~~
>
> - 集成测试（`tests/integration_tests.rs`）：测试整个程序的交互逻辑。
>
> ~~~rust
> use calculator;  // 实际使用时需要 `extern crate`（但现代 Rust 可直接使用）
> // 或者直接调用 `src/` 下的函数（需调整可见性）
> 
> #[test]
> fn test_full_calculation() {
>     // 模拟 main.rs 的逻辑
>     let result = super::ops::add::add(10, 5);
>     assert_eq!(result, 15);
> }
> ~~~
>
> 注意：集成测试默认无法直接访问 `src/` 下的私有函数，需通过 `pub` 暴露接口或调整测试策略。

#### 库项目

相比非库项目，仅需要在`Cargo.toml`里加上`[lib]`配置，和新增一个`lib.rs`的文件即可。

1. 项目结构

~~~toml
calculator/
├── Cargo.toml
├── src/
│   ├── main.rs
│   ├── ops/
│   │   ├── add.rs
│   │   ├── sub.rs
│   │   └── mod.rs
│   └── lib.rs
└── tests/
    └── calculator_tests.rs
~~~

2. 新增内容

> - `Cargo.toml`
>
> ~~~rust
> [package]
> name = "calculator"
> version = "0.1.0"
> edition = "2021"
> 
> [lib]
> name = "calculator"
> path = "src/lib.rs"
> 
> [[bin]]
> name = "calculator"
> path = "src/main.rs"
> ~~~
>
> - `src/lib.rs`
>
> ~~~rust
> pub mod ops;
> 
> pub fn calculate(a: i32, b: i32, op: &str) -> Option<i32> {
>     match op {
>         "+" => Some(ops::add::add(a, b)),
>         "-" => Some(ops::sub::sub(a, b)),
>         _ => None,
>     }
> }
> ~~~
>
> - `src/main.rs`
>
> ~~~rust
> use calculator;
> 
> fn main() {
>     let result = calculator::calculate(10, 5, "+").unwrap();
>     println!("10 + 5 = {}", result);
> }
> ~~~

## **10. 泛型与特质**

- **泛型**：类型参数化。
- **特质（Trait）**：定义共享行为（类似接口）。

```rust
struct Point<T> { x: T, y: T }
 
trait Summary {
    fn summarize(&self) -> String;
}
 
impl Summary for Point<i32> {
    fn summarize(&self) -> String {
        format!("Point at ({}, {})", self.x, self.y)
    }
}
```

# 所有权系统

## 基本概念

- 内存分配模型：
  - C/C++：内存分配和释放由程序员控制，new + delete | reference counting。
  - Python、C#、Java：GC管理，安全但 stop the world 性能影响大。
  - Rust：编译期检查、Ownership rules & semantics、Borrow Checker、Lifetime等。

- C/C++常见内存错误：`int* ptr = new int`
  - 内存泄漏（Memroy Leak）：忘记`delete ptr`。
  - 悬空指针（Dangling Pointer）：`delete ptr`，ptr 现在是悬空指针。
  - 重复释放（Double Free）：`delete ptr; delete ptr`。
  - 数组越界（Array Out of Bounds）：`int arr[5]; arr[5] = 10`。
  - 野指针（Wild Pointer）：`int* ptr; *ptr = 10`。
  - 使用已经释放的内存（Use After Free）：`delete ptr; *ptr = 10`
  - 堆栈溢出（Stack Overflow）
  - 不匹配的 new / delete 或 malloc / free：C 和 C++ 用串了。

**栈和堆**

- stack
  - 以获取值的顺序存储值，并以相反顺序删除值（先进后出）。
  - 操作高效，函数作用域就是在栈上。
  - 栈上存储的所有数据必须具有已知的固定大小。
  - 存储在栈上的：标量类型、元组和数组、结构体和枚举（内部元素/属性等，如`String`是可以存储在堆上的）。
- heap
  - 存储数据时，请求空间时会返回一个指向存储位置的指针。
  - 数据长度不固定。
  - 存储在堆上的：Box、Rc、String/Vec 等。

## Copy和Move

> **trait（特质）**是一种定义共享行为的机制，`clone`就是一种特质。
>
> `marker trait（标记特质）`是一个没有任何方法的`trait`，主要用于向编译器传递某些信息，以改变类型的默认行为。

- **Clone**：深拷贝。
- **Copy**：按位复制，适用于简单类型。它是在`Clone`基础上建立的`marker trait`。
- **Move**：所有权转移，适用于复杂类型。

| **维度**         | **Copy**                          | **Move**                                |
| ---------------- | --------------------------------- | --------------------------------------- |
| **复制成本**     | 极低（仅按位复制）                | 零开销（复制指针和元数据 + 所有权转移） |
| **源变量状态**   | 保持有效                          | 被标记为“已移动”，不可访问              |
| **适用类型**     | 栈存储、无资源管理                | 堆存储或需资源管理                      |
| **显式/隐式**    | 隐式（赋值时自动触发）            | 默认行为（未实现 Copy 时触发）          |
| **与 Drop 关系** | 互斥（实现 Copy 则不能实现 Drop） | 可共存（实现 Drop 的类型默认 Move）     |

> 当赋值或函数传递时，编译器会自动按位复制数据，原始变量仍保持有效。这些类型默认实现了 `Copy` trait。
>
> - 标量类型
> - 元组和数组（内部数据不一定都在栈上，因为元素类型可以指定为非`copy`的）
> - 自定义类型：通过 `#[derive(Copy, Clone)]` 派生的结构体或枚举，且所有字段均为 Copy 类型。
>
> 一般来说在栈上的数据都默认实现了copy特质，但结构体、枚举等默认是move，需要copy只需设置数据类型实现copy特质即可，或是手动调用clone函数去copy（需要实现clone特质）。
>
> - `Copy`是一个 标记 trait，表示类型可以 按位复制（bitwise copy）。
>
> - 实现`Copy`特质需要先实现`Clone`特质，因为前者继承后者。
> - 只有类型本身支持按位复制才能实现`Copy`特质，例如结构体如果要可以实现`Copy`特质，需要保证里面的属性都实现了`Copy`特质。

~~~rust
#[derive(Debug, Clone, Copy)] // 自动实现Debug、Clone、Copy特质
struct User {
    sex: char,
    age: i32,
}

// 无法自动实现Copy特质，因为属性存在非Copy的
#[derive(Debug, Clone)]
struct MyUser {
    name: String,
    age: i32,
}

// 手动实现
/* impl Clone for MyUser {
    fn clone(&self) -> Self {
        return Self {
            name: self.name.clone(),
            age: self.age,
        };
    }
} */

fn main() {
    let vec1 = vec![1, 2, 3];
    //let vec2 = vec1; // vec1的所有权被move, vec1无法再被使用了
    let vec2 = vec1.clone(); // 使用clone方法不会被转移所有权
    println!("{:?} {:?}", vec1, vec2);

    let user1 = User {
        sex: '男', age: 18
    };
    // 结构体虽然存储在栈上, 但其默认操作是move. 可以实现Copy特质替换掉默认行为
    let user2 = user1; // user1的所有权被move
    println!("{:?} {:?}", user1, user2);

    let my_user1 = MyUser {
        name: "list".to_string(),
        age: 18,
    };
    // 直接赋值会转移所有权，可以使用clone方法
    let my_user2 = my_user1.clone();
    println!("{:?} {:?}", my_user1, my_user2);
}
~~~



## 所有权规则

所有权规则（Ownership Rules）：

- 每个值必须有一个所有者。
- 同一时刻只能有一个所有者。
- 所有者离开作用域时会自动销毁值。

**值传递语义（Value Passing Semantics）**：本质上是所有权（Ownership）系统的具体体现，它通过编译期检查确保内存安全，避免了悬垂指针、数据竞争等问题。

- 默认行为：所有权转移（Move Semantics）：非 `Copy` 类型在作为参数传递时，所有权会从调用者转移到函数内部。调用后，原变量**不可再使用**（编译器会阻止编译），防止重复释放或悬垂指针。
- `Copy` 类型的按位复制：`Copy` 类型（如 `i32`、`f64`、`bool`、`&T` 等）在传递时会按位复制，原变量仍可用。这些类型通常存储在栈上，复制成本极低。
- 借用（Borrowing）：通过引用（`&T` 或 `&mut T`）传递参数，避免所有权转移。
  - 不可变引用（`&T`）：允许多个只读访问，函数内不可修改。
  - 可变引用（`&mut T`）：独占访问权，函数内可修改。
- 返回值与所有权返回：函数可以通过返回值将所有权返还给调用者。

## Box

Box是一个智能指针，它提供对堆分配内存的所有权，允许你将数据存储到堆上，并且在复制或移动时保证对数据的唯一所有权。

- **堆分配**：数据存储在堆上，栈上仅保存一个指向堆数据的指针（大小固定，通常为 8 字节）；可以用于构建递归数据结构。
- **所有权语义**：`Box<T>` 拥有其指向的数据，遵循 Rust 的所有权规则（移动语义）。
- **自动释放**：当 `Box<T>` 离开作用域时，其析构函数会自动调用 `Drop`，释放堆内存。
- **`Deref` 和 `DerefMut`**：支持解引用操作（`*box` 或自动解引用），行为类似普通指针。

~~~rust
// 将标量类型存储到堆上
let mut boxed_num = Box::new(32);
println!("{}", boxed_num); // 打印时*可加可不加, 会自动解引用
*boxed_num += 10;
println!("{}", *boxed_num);

let boxed_str = Box::new("list".to_string());
println!("{}", *boxed_str);
//let boxed_str2 = boxed_str; // 所有权转移后，boxed_str不能再使用了
let str = *boxed_str;   // 所有权同样被转移
let num = *boxed_num;   // i32实现copy特质，不会转移所有权
println!("{str} {num}-{}", *boxed_num);
~~~

## 借用

**用（Borrowing）** 是所有权系统的核心概念之一，它允许临时使用数据而不转移所有权。借用通过**引用（Reference）**实现，确保数据在借用期间不会被意外修改或释放，从而保证内存安全。

借用是通过**引用**实现的，引用是数据的指针，但不拥有数据。引用分为：

- **不可变引用（`&T`）**：允许读取数据，但不能修改。
- **可变引用（`&mut T`）**：允许读取和修改数据，但具有独占性（同一时间只能有一个可变引用）。

~~~rust
fn borrow(s: &String) {
    println!("Borrowed: {}", s);
}

fn main() {
    let s = String::from("Hello");
    borrow(&s); // 借用 `s`（不转移所有权）
    println!("Original: {}", s); // 仍然可用
}
~~~

Rust 的借用检查器（Borrow Checker）强制执行以下规则：

1. **不可变引用可以多个共存**（因为只是读取）。
2. **可变引用必须独占**（不能同时存在其他可变或不可变引用）。
3. **引用的生命周期不能超过被引用的数据**（避免悬垂引用）。

~~~rust
// 多个可变引用
let mut s = String::from("Hello");
let r1 = &mut s;
let r2 = &mut s; // ❌ 错误！不能同时有多个可变引用

// 不可变引用与可变引用共存
let mut s = String::from("Hello");
let r1 = &s;
let r2 = &s;
let r3 = &mut s; // ❌ 错误！`r1` 和 `r2` 仍在作用域内
println!("{} {} {}", r1, r2, r3);

// 返回值引用局部变量
fn return_ref() -> &String {
    let s = String::from("Hello");
    &s // ❌ 错误！`s` 在函数结束时被释放
}
~~~



借用与所有权的关系：

| 操作           | 所有权               | 借用                      |
| -------------- | -------------------- | ------------------------- |
| **传递数据**   | 转移所有权（`move`） | 临时使用（`&` 或 `&mut`） |
| **修改数据**   | 直接修改（如果可变） | 仅通过 `&mut` 修改        |
| **作用域结束** | 数据被丢弃           | 引用失效，数据仍存在      |

## 生命周期

**生命周期（Lifetimes）** 是编译器用来确保引用（References）有效性的机制，它通过跟踪引用的作用域来防止悬垂引用（Dangling References）和数据竞争。生命周期是 Rust 所有权系统的核心部分，虽然通常由编译器自动推断，但在复杂场景下需要显式标注。

生命周期用单引号（如 `'a`）表示，通常出现在：

- 函数签名（参数和返回值）。
- 结构体或枚举的定义中。
- `impl` 块中。

`'static` 生命周期：表示引用可以存活整个程序运行期间，如全局变量或字符串变量（例如字符串字面量 `"hello"` 的类型是 `&'static str`）。

生命周期的省略规则：

1. 编译器默认每个引用参数有自己的生命周期参数。
2. 若函数只有一个引用参数，其生命周期会自动赋给所有输出引用。
3. 若函数包含 `&self` 或 `&mut self` 参数，其生命周期会自动赋给所有输出引用。

~~~rust
// 方法接收者（`self`）的生命周期
impl<'a> MyStruct<'a> {
    fn get_ref(&self) -> &str { ... } // 省略 `'a`，编译器自动关联
}

// 输入仅有一个引用参数
fn get_slice(s: &str) -> &str { ... } // 省略 `'a`
~~~

**生命周期子类型**：生命周期子类型关系用 `'a: 'b` 语法表示。

- `'a: 'b` （`'a` outlives `'b`）：表示 `'a` 的存活时间至少与 `'b` 一样长（或更长），长生命周期的引用可以安全地当作短生命周期引用使用。例如：

~~~rust
// 泛型约束
fn covariant_example<'a: 'b, 'b>(s: &'a str) -> &'b str {
    s
}

// where子句
fn func<'a, 'b, T: ?Sized>(x: &'a T, y: &'b T) -> &'a T
where
    'b: 'a,
{
    x
}

fn main() {
    println!("{}", covariant_example("test"));
    // 在泛型参数 T 上添加 ?Sized 约束，表示 T 可以是 Sized 或非 Sized 类型
    // 解决编译时不知道str长度的问题
    println!("{}", func::<str>("x", "y"));
}
~~~

# 高级语法

## 集合类型

- 线性序列：
  - **向量（Vec）**：动态数组，可存储多个相同类型的值，元素在内存中连续存储。
  - **双端队列（VecDeque）**：基于环形缓冲区实现的双端队列，支持在头部和尾部高效地添加和移除元素。
  - **链表（LinkedList）**：双向链表，元素通过指针连接，不连续存储。

~~~rust
let mut nums: Vec<i32> = Vec::new(); // 空向量
nums.push(1); // 添加元素
nums.push(2);
nums.insert(1, 3); // 在索引 1 处插入 3
assert_eq!(nums, vec![1, 3, 2]);
println!("{:?}", nums);

use std::collections::VecDeque;
let mut deque = VecDeque::new();
deque.push_back(1);
deque.push_front(2);
assert_eq!(deque, vec![2, 1]);
println!("{:?}", deque);

use std::collections::LinkedList;
let mut list = LinkedList::new();
list.push_back(1);
list.push_front(2);
println!("{:?}", list);
~~~

- 键值映射表
  - **哈希映射（HashMap<K, V>）**：基于哈希表的键值对集合，通过哈希函数将键映射到值。
  - **B 树映射（BTreeMap<K, V>）**：基于平衡树的键值对集合，键按顺序存储。

~~~rust
use std::collections::HashMap;
let mut scores = HashMap::new();
scores.insert("Alice", 10);
scores.insert("Bob", 20);
assert_eq!(scores.get("Alice"), Some(&10));

use std::collections::BTreeMap;
let mut map = BTreeMap::new();
map.insert(3, "c");
map.insert(1, "a");
map.insert(2, "b");
assert_eq!(map.keys().collect::<Vec<_>>(), vec![&1, &2, &3]);
~~~

- 集合
  - **哈希集合（HashSet）**：基于哈希表的无序集合，存储唯一值。
  - **B 树集合（BTreeSet）**：基于平衡树的有序集合，存储唯一值。

~~~rust
use std::collections::{HashSet, BTreeSet};
let mut set1 = HashSet::new();
set1.insert(1);
set1.insert(2);
assert!(set1.contains(&1));

let mut set2 = BTreeSet::new();
set2.insert(3);
set2.insert(1);
assert_eq!(set2.range(1..3).collect::<Vec<_>>(), vec![&1]);
~~~

- 优先队列
  - **二叉堆（BinaryHeap）**：基于二叉最大堆的优先队列，元素松散组织。

## 高阶函数

**高阶函数（Higher-Order Functions）** 是指可以接受函数作为参数、返回函数或同时具备这两种能力的函数。Rust 支持高阶函数，这是函数式编程（Functional Programming）的核心特性之一，常用于简化代码、提高抽象能力和实现灵活的操作（如迭代、映射、过滤等）。

### 函数作为参数

Rust 的闭包（`Fn`、`FnMut`、`FnOnce`）和普通函数（`fn`）可以作为参数传递给高阶函数。

示例：`Iterator::map`

```rust
let nums = vec![1, 2, 3];
let squared: Vec<i32> = nums.iter().map(|x| x * x).collect();
assert_eq!(squared, vec![1, 4, 9]);
println!("{:?}", squared);
```

- `map` 接受一个闭包 `|x| x * x`，对每个元素进行变换。

> `|x| x * x` 是**闭包（Closure）**的语法，用于定义一个匿名函数，语法如下：
>
> ~~~rust
> |参数1, 参数2, ...| {
>     // 闭包体（可以包含多条语句）
>     返回值表达式
> }
> ~~~
>
> - `|...|`：参数列表，用竖线 `|` 包围。
> - `{}`：可选的闭包体（如果只有一条表达式，可以省略 `{}`）。


~~~rust
// 自定义高阶函数
fn apply_operation<F>(x: i32, y: i32, op: F) -> i32
where
    F: Fn(i32, i32) -> i32, // 约束 op 是一个接受 (i32, i32) 并返回 i32 的函数
{
    op(x, y)
}

fn main() {
    let sum = apply_operation(3, 5, |a, b| a + b); // 传递闭包
    let product = apply_operation(3, 5, |a, b| a * b);
    assert_eq!(sum, 8);
    assert_eq!(product, 15);
}
~~~

### 闭包

闭包（Closures）是 Rust 中实现高阶函数的核心机制，可以捕获环境中的变量，有三种捕获方式：

- **`Fn`**：不可变借用（`&T`），闭包以 **不可变引用** 的方式捕获环境变量，**不修改**捕获的变量。
  - 调用方式：可以多次调用，因为不涉及所有权转移或可变借用。
  - 适用场景：仅需读取环境变量，不修改它们。
- **`FnMut`**：可变借用（`&mut T`），闭包以 **可变引用** 的方式捕获环境变量，**可能修改**捕获的变量。
  - 调用方式：可以多次调用，但需要可变上下文（如 `mut` 绑定的闭包变量）。
  - 适用场景：需要修改捕获的变量，但不想转移所有权。
- **`FnOnce`**：消耗所有权（`T`），闭包通过 **所有权转移** 捕获环境变量，**只能调用一次**（因为所有权被转移后变量不可再访问）。
  - 调用方式：只能调用一次，常用于移动捕获（如 `String`、`Vec` 等）。
  - 适用场景：需要转移捕获变量的所有权（如消费型闭包）。

~~~rust
fn main() {
    let factor = 2;
    let multiply = |x| x * factor; // 不可变借用 factor（Fn）
    assert_eq!(multiply(5), 10);

    let mut count = 0;
    let mut increment = || {
        count += 1; // 可变借用 count（FnMut）
        count
    };
    assert_eq!(increment(), 1);

    let message = String::from("Hello, FnOnce!");
    // 方式1：闭包内消耗掉外部变量的所有权，函数类型被自动推断为：FnOnce
    let print_message = || {
        drop(message);
    };
    print_message();
    //print_message(); // 错误：闭包只能调用一次（因为 `message` 已被移动）

    let message = String::from("Hello, FnOnce!");
    // 方式2：闭包通过 `move` 强制捕获（移动） `message` 的所有权
    let print_message = move || {
        // 由于没有显式释放message，也没有修改它，所以print_message被自动推断为：Fn
        println!("{}", message);
    };
    print_message();
    print_message(); // 可以执行多次，因为这里的print_message是Fn
    //println!("{}", message);    // message被转移所有权了，无法使用
}
~~~

> `move` 关键字用于**强制闭包（Closure）获取其捕获变量的所有权**，而不是通过引用（借用）访问它们。这在需要确保闭包独立于外部环境（例如，当闭包被返回、存储在数据结构中或传递到其他线程时）时非常有用。
>
> `Fn`、`FnMut` 和 `FnOnce` 是闭包（Closure）自动实现的三个核心特质（Traits），它们本质上是 **描述闭包如何捕获和操作环境变量** 的接口。
>
> `Fn` 继承了 `FnMut`，而 `FnMut` 又继承了 `FnOnce`，所以当使用了`move`关键字后闭包的类型可能还是会被自动推断为`Fn` 或 `FnMut`。
>
> ~~~rust
> let mut message = String::from("Hello, FnOnce!");
> let mut print_message = move || {
>   println!("{message}");
>   // 由于没有显式释放message，但修改了它，所以print_message被自动推断为：FnMut
>   message = "biluo".to_string();
> };
> print_message();
> print_message(); // 可以执行多次，因为这里的print_message是FnMut
> //println!("{}", message);    // message被转移所有权了，无法使用
> ~~~
>
> 

**工作原理**

1. 编译器会先创建一个结构体，结构体里会存放捕获的环境变量。
2. 结构体会自动实现`Fn`/`FnMut`/`FnOnce`特质，实现对应的`call`方法，闭包内的代码就会放到这个`call`方法中去。
3. 调用闭包时就会调用这个`call`方法。

~~~rust
// 示例1：Fn
let x = 42;
let closure = |a| println!("x = {}", x + a); // 隐式捕获 &x
closure(6);

// 生成的简化版代码：
struct Closure<'a> {
    x: &'a i32, // 不可变引用
}

impl<'a> Fn<(i32,)> for Closure<'a> {
    fn call(&self, args: (i32,)) -> () {
        let a = args.0; // 解构参数 `a`
        println!("x = {}", self.x + a); // 使用 `self.x`（不可变引用）
    }
}

let closure = Closure{ x: &x }
closure.call((6,));

// 示例2：FnMut
let mut x = 42;
let mut closure = || {
    x += 1; // 修改 x
    println!("x = {}", x);
};

// 生成的简化代码：
struct Closure<'a> {
    x: &'a mut i32, // 可变引用
}

impl<'a> FnMut<()> for Closure<'a> {
    fn call_mut(&mut self, _: ()) {
        *self.x += 1; // 可变借用
        println!("x = {}", self.x);
    }
}

// 示例3：FnOnce + 销毁值
let x = String::from("hello");
let closure = {
	drop(x); // 移动 x
};

// 生成的简化代码：
struct Closure {
    x: String, // 拥有所有权
}

impl FnOnce<()> for Closure {
    fn call_once(self, _: ()) {
        drop(self.x);
    }
}

// 示例4：Fn + move
let x = String::from("hello");
let closure = move {
	  println!("x = {}", x);
};

// 生成的简化代码：
struct Closure {
    x: String, // 拥有所有权
}

impl Fn<()> for Closure {
    fn call(self, _: ()) {
			  println!("x = {}", self.x);
    }
}
~~~



### 返回函数

Rust 可以返回闭包，但需要注意生命周期和所有权问题（通常用 `Box<dyn Fn>` 或泛型实现）。

~~~rust
fn make_multiplier(factor: i32) -> impl Fn(i32) -> i32 {
    move |x| x * factor // 使用 move 捕获 factor
}

fn main() {
    let double = make_multiplier(2);
    let triple = make_multiplier(3);
    assert_eq!(double(5), 10);
    assert_eq!(triple(5), 15);
}
~~~

### 标准库中的高阶函数

Rust 的迭代器（`Iterator`）和集合（如 `Vec`、`HashMap`）提供了许多高阶函数：

- `map`：变换元素

```rust
let nums = vec![1, 2, 3];
let doubled: Vec<i32> = nums.iter().map(|x| x * 2).collect();
assert_eq!(doubled, vec![2, 4, 6]);
```

- `filter`：过滤元素

```rust
let nums = vec![1, 2, 3, 4];
let evens: Vec<i32> = nums.iter().filter(|x| **x % 2 == 0).cloned().collect();
assert_eq!(evens, vec![2, 4]);
```

- `fold`：聚合计算

```rust
let nums = vec![1, 2, 3];
let sum = nums.iter().fold(0, |acc, x| acc + x);
assert_eq!(sum, 6);
```

- `for_each`：遍历执行

```rust
let nums = vec![1, 2, 3];
nums.iter().for_each(|x| println!("{}", x));
```

- `sort_by`：自定义排序

```rust
let mut nums = vec![3, 1, 2];
nums.sort_by(|a, b| b.cmp(a)); // 降序排序
assert_eq!(nums, vec![3, 2, 1]);
```

## 特质

### 基础特性

**特质（Trait）** 是类型系统中的核心机制，用于定义一组行为（方法），任何类型只要实现了该特质，就能表现出这些行为。它类似于其他语言中的“接口”，但更灵活且强大，是 Rust 实现多态、代码复用和类型安全的关键。

特质通过 `trait` 关键字定义，包含一组方法签名（可包含默认实现）：

~~~rust
trait Speak {
    fn say_hello(&self); // 必须实现的方法
    fn say_goodbye(&self) { // 默认实现的方法
        println!("Goodbye!");
    }
}
~~~

任何类型（如结构体、枚举）都可以通过 `impl Trait for Type` 实现特质：

~~~rust
struct Dog;
impl Speak for Dog {
    fn say_hello(&self) {
        println!("汪汪!");
    }
}

struct Cat;
impl Speak for Cat {
    fn say_hello(&self) {
        println!("喵喵!");
    }
}
~~~

多态与代码复用：

- **静态分发（Static Dispatch）**：通过泛型和特质边界（`T: Trait`）实现编译时多态，无运行时开销。

~~~rust
fn greet<T: Speak>(animal: &T) {
    animal.say_hello();
}
~~~

- **动态分发（Dynamic Dispatch）**：通过特质对象（`&dyn Trait` 或 `Box<dyn Trait>`）实现运行时多态，允许不同类型在运行时被统一调用，有一定的性能损耗。

~~~rust
fn greet_dynamic(animals: &[&dyn Speak]) {
    for animal in animals {
        animal.say_hello();
    }
}
~~~

> **`dyn` 是一个用于动态分发（Dynamic Dispatch）的关键字**，它通常与特质（Trait）一起使用，以实现运行时多态。
>
> - **动态分发**：`dyn` 允许在运行时确定具体类型的方法调用，而不是在编译时。这通过“虚函数表”（vtable）实现，每个实现了特质的类型都有一个对应的 vtable，其中包含该特质所有方法的指针。在运行时，Rust 会根据对象的实际类型查找并调用正确的方法。
> - **处理异构集合**：`dyn` 使得可以将实现了同一特质的不同类型的对象存储在同一个集合中（如 `Vec<Box<dyn Trait>>`），并在运行时通过特质方法统一操作这些对象。
> - 使用的三种形式：`&dyn Trait`（不可变引用）、`&mut dyn Trait`（可变引用）、`Move`语义所有权转移（例如使用`Box<dyn Trait>`）。
>
> ~~~rust
> trait Speak {
>     fn say_hello(&self);
> }
> 
> struct Dog;
> impl Speak for Dog {
>     fn say_hello(&self) {
>         println!("汪汪!");
>     }
> }
> 
> struct Cat;
> impl Speak for Cat {
>     fn say_hello(&self) {
>         println!("喵喵!");
>     }
> }
> 
> fn main() {
>     let speak1: &dyn Speak = &Dog {};
>     let speak2: Box<dyn Speak> = Box::new(Cat {});
>     speak1.say_hello();
>     speak2.say_hello();
>     /* let speak3 = speak2; // speak3类型：Box<dyn Speak>
>     //speak2.say_hello(); // 所有权被转移了，无法使用speak2了
>     speak3.say_hello(); */
> 
>     // 这样给的只是引用，speak3类型：&dyn Speak
>     let speak3 = speak2.as_ref();
>     speak2.say_hello();
>     speak3.say_hello();
> }
> ~~~
>
> 

类型可实现多个特质，通过组合实现复杂行为：

~~~rust
trait Drawable { fn draw(&self); }
trait Clickable { fn on_click(&self); }

struct Button { text: String }
impl Drawable for Button {
    fn draw(&self) { println!("Drawing button: {}", self.text); }
}
impl Clickable for Button {
    fn on_click(&self) { println!("Button clicked: {}", self.text); }
}
~~~

**特质边界与泛型约束**：可以提供`impl`来指定参数类型需要实现的特质，同样也可以通过泛型来进行约束。

~~~rust
// 泛型函数可通过特质边界限制类型范围：
fn process<T: Drawable + Clickable>(item: &T) {
    item.draw();
    item.on_click();
}
// 另一种写法
fn process(item: &(impl Drawable + Clickable)) {
    item.draw();
    item.on_click();
}

// 使用 where 子句提高可读性：
fn complex_process<T>(item: T) 
where T: Drawable + Clickable + std::fmt::Debug {
    println!("{:?}", item);
    item.draw();
}
~~~

关联常量：特质可以内置常量（const），特质内定义的常量在程序的整个生命周期都是有效的。

~~~rust
trait MyTrait {
    const DEFAULT_VALUE: i32; // 关联常量声明
    fn do_something(&self);
}
~~~



### 高级特性

**超级特质（Supertraits）**：特质可以继承其他特质，形成行为依赖。

> 具体类型实现超级特质时，得分开实现超级特质和其继承的特质。

~~~rust
trait Logged: std::fmt::Display {
    fn log(&self) {
        println!("Log: {}", self);
    }
}

// 具体类型实现超级特质时，得分开实现超级特质和其继承的特质。
trait Test1 {
    fn print1();
}

trait Test2: Test1 {
    fn print2();
}

struct Test;

// 只实现Test2会报错，必须还得实现Test1，因为Test2继承/依赖了Test1
impl Test2 for Test {
    fn print2() {}
}

impl Test1 for Test {
    fn print1() {
        todo!()
    }
}
~~~

**条件实现**：仅为满足特定条件的类型实现特质。

~~~rust
impl<T: std::fmt::Debug> ToString for T {
    fn to_string(&self) -> String {
        format!("{:?}", self)
    }
}
~~~

**自动特质（Auto Traits）**：如 `Send` 和 `Sync`，由编译器自动实现，标记类型是否可安全跨线程传递或共享。

### 常用特质

#### 基础功能

1. `Clone`

   - **作用**：定义类型的深拷贝行为。

   - 示例：

     ```rust
     rust1#[derive(Clone)]
     2struct Point { x: i32, y: i32 }
     3let p1 = Point { x: 1, y: 2 };
     4let p2 = p1.clone(); // 深拷贝
     ```

2. `Copy`

   - **作用**：标记类型为按位复制（无需深拷贝）。

   - 示例：

     ```rust
     rust1let x = 42;
     2let y = x; // 无需 clone，i32 是 Copy 的
     ```

3. `Default`

   - **作用**：为类型提供默认值（如 `0`、`""`、`Vec::new()`）。

   - 示例：

     ```rust
     rust1#[derive(Default)]
     2struct Config { name: String, timeout: u32 }
     3let cfg = Config::default(); // name="", timeout=0
     ```

4. `Drop`

   - **作用**：在类型被销毁时执行清理逻辑（如释放资源）。

   - 示例：

     ```rust
     rust1struct FileHandle { fd: i32 }
     2impl Drop for FileHandle {
     3    fn drop(&mut self) { println!("Closing file {}", self.fd); }
     4}
     ```

#### 比较

1. `PartialEq` 和 `Eq`

   - **作用**：定义类型的相等性比较（`==`）。

   - 示例：

     ```rust
     #[derive(PartialEq, Eq)]
     struct Point { x: i32, y: i32 }
     let p1 = Point { x: 1, y: 2 };
     let p2 = Point { x: 1, y: 2 };
     assert!(p1 == p2);
     ```

2. `PartialOrd` 和 `Ord`

   - **作用**：定义类型的顺序比较（`<`、`>`、`<=`、`>=`）。

   - 示例：

     ```rust
     #[derive(PartialOrd, Ord, PartialEq, Eq)]
     struct Point { x: i32, y: i32 }
     let p1 = Point { x: 1, y: 2 };
     let p2 = Point { x: 3, y: 4 };
     assert!(p1 < p2);
     ```

#### 算术与位运算

1. `Add`、`Sub`、`Mul`、`Div`

   - **作用**：定义算术运算（`+`、`-`、`*`、`/`）。

   - 示例：

     ```rust
     use std::ops::Add;
     #[derive(Debug)]
     struct Point { x: i32, y: i32 }
     impl Add for Point {
         type Output = Point;
         fn add(self, other: Point) -> Point {
             Point { x: self.x + other.x, y: self.y + other.y }
         }
     }
     let p1 = Point { x: 1, y: 2 };
     let p2 = Point { x: 3, y: 4 };
     let p3 = p1 + p2; // Point { x: 4, y: 6 }
     ```

2. `BitAnd`、`BitOr`、`BitXor`

   - **作用**：定义位运算（`&`、`|`、`^`）。

   - 示例：

     ```rust
     use std::ops::BitAnd;
     #[derive(Debug)]
     struct Flags { bits: u8 }
     impl BitAnd for Flags {
         type Output = Flags;
         fn bitand(self, other: Flags) -> Flags {
             Flags { bits: self.bits & other.bits }
         }
     }
     let f1 = Flags { bits: 0b1010 };
     let f2 = Flags { bits: 0b1100 };
     let f3 = f1 & f2; // Flags { bits: 0b1000 }
     ```

#### 输入/输出

1. `Read` 和 `Write`

   - **作用**：定义读写字节流的行为（如文件、网络、内存缓冲区）。

   - 示例：

     ```rust
     use std::io::{Read, Write};
     let mut buffer = Vec::new();
     let mut file = std::fs::File::create("test.txt").unwrap();
     file.write_all(b"Hello, world!").unwrap(); // 写入字节
     let mut file = std::fs::File::open("test.txt").unwrap();
     file.read_to_end(&mut buffer).unwrap(); // 读取字节
     ```

2. `Display` 和 `Debug`

   - **作用**：定义类型的格式化输出（`{}` 和 `{:?}`）。

   - 示例：

     ```rust
     #[derive(Debug)]
     struct Point { x: i32, y: i32 }
     impl std::fmt::Display for Point {
         fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
             write!(f, "({}, {})", self.x, self.y)
         }
     }
     let p = Point { x: 1, y: 2 };
     println!("{}", p); // 输出: (1, 2)
     println!("{:?}", p); // 输出: Point { x: 1, y: 2 }
     ```

#### 迭代器

1. `Iterator`

   - **作用**：定义迭代器的行为（`next()`、`map()`、`filter()` 等）。

   - 示例：

     ```rust
     let nums = vec![1, 2, 3];
     let sum: i32 = nums.iter().sum(); // 迭代器求和
     ```

2. `IntoIterator`

   - **作用**：允许类型被转换为迭代器（如 `for` 循环）。

   - 示例：

     ```rust
     for num in vec![1, 2, 3] {
         println!("{}", num);
     }
     ```

> `into_iter()` 是 `IntoIterator` 特质的方法，它会 **消耗（take ownership）** 集合，并返回一个迭代器。迭代过程中，集合的所有权会被转移，原集合无法再使用。
>
> 通过 `iter()` 或 `iter_mut()` 方法
>
> - **`iter()`**：返回一个 **不可变引用** 的迭代器，不消耗集合所有权。
> - **`iter_mut()`**：返回一个 **可变引用** 的迭代器，允许修改集合元素。
>
> ~~~rust
> let vec = vec![1, 2, 3];
> for i in vec.into_iter() {
>     println!("{}", i); // 输出 1, 2, 3
> }
> // 此时 vec 已失效（所有权被转移）
> // println!("{:?}", vec); // 编译错误：borrow of moved value
> 
> let mut vec = vec![1, 2, 3];
> for i in vec.iter_mut() {
>     *i *= 2; // 解引用并修改元素
> }
> println!("{:?}", vec); // 输出 [2, 4, 6]
> ~~~
>
> 

自定义实现迭代器：

~~~rust
use rand::rand_core::impls;

struct MyList<T> {
    data: Vec<T>,
}

impl<T> MyList<T> {
    fn new() -> Self {
        MyList { data: Vec::new() }
    }
    fn add(&mut self, item: T) {
        self.data.push(item);
    }
    fn remove(&mut self) {
        self.data.pop();
    }
    fn iter(&self) -> std::slice::Iter<'_, T> {
        self.data.iter()
    }
    fn iter_mut(&mut self) -> std::slice::IterMut<'_, T> {
        self.data.iter_mut()
    }
}

impl<T> IntoIterator for MyList<T> {
    type Item = T;

    type IntoIter = std::vec::IntoIter<T>;

    fn into_iter(self) -> Self::IntoIter {
        self.data.into_iter()
    }
}

fn main() {
    let mut list = MyList::new();
    list.add(1);
    list.add(2);
    for num in list {
        print!("{num} ")
    }
    println!()
}
~~~



#### 错误处理

1. `Error`

   - **作用**：定义自定义错误类型，支持错误传播和调试。

   - 示例：

     ```rust
     use std::fmt;
     #[derive(Debug)]
     struct MyError { details: String }
     impl fmt::Display for MyError {
         fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
             write!(f, "Error: {}", self.details)
         }
     }
     impl std::error::Error for MyError {}
     fn do_something() -> Result<(), MyError> {
         Err(MyError { details: "something went wrong".to_string() })
     }
     ```

#### 闭包

1. `Fn`、`FnMut`、`FnOnce`

   - **作用**：定义闭包的可调用行为（不可变、可变、一次性捕获环境）。

   - 示例：

     ```rust
     fn call_with_one<F>(f: F) where F: Fn(i32) {
         f(1);
     }
     call_with_one(|x| println!("{}", x)); // 输出: 1
     ```

#### 智能指针

1. `Deref` 和 `DerefMut`

   - **作用**：定义解引用行为（如 `Box<T>`、`Rc<T>`）。

   - 示例：

     ```rust
     use std::ops::Deref;
     struct MyBox<T>(T);
     impl<T> Deref for MyBox<T> {
         type Target = T;
         fn deref(&self) -> &T { &self.0 }
     }
     let x = MyBox(5);
     assert_eq!(*x, 5); // 解引用
     ```

2. `AsRef` 和 `AsMut`

   - **作用**：定义类型间的廉价引用转换（如 `&str` ↔ `String`）。

   - 示例：

     ```rust
     fn process_string(s: &str) { println!("{}", s); }
     let s = String::from("hello");
     process_string(&s); // AsRef<str> 转换
     ```

## 泛型

Rust 的泛型（Generics）允许你编写能够处理多种类型的代码，而不需要为每种类型重复编写逻辑。泛型是 Rust 零成本抽象的重要组成部分，它们在编译时会进行单态化（monomorphization），生成针对具体类型的优化代码。

Rust 的泛型通过单态化实现零成本抽象：

- 编译时，编译器会为使用的每个具体类型生成专门的代码。
- 运行时没有额外开销，与直接编写具体类型代码性能相同。

示例：

- 函数泛型

~~~rust
// 定义一个泛型函数
fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
    let mut largest = list[0];
    
    for &item in list {
        if item > largest {
            largest = item;
        }
    }
    
    largest
}

fn main() {
    let numbers = vec![34, 50, 25, 100, 65];
    println!("最大的数字是: {}", largest(&numbers));
    
    let chars = vec!['y', 'm', 'a', 'q'];
    println!("最大的字符是: {}", largest(&chars));
}
~~~

> `T: PartialOrd`：表示类型 `T` 必须实现 `PartialOrd` trait。
>
> - `PartialOrd` 是 Rust 的标准 trait，用于定义 **部分顺序（partial ordering）**，即允许比较大小（`>`、`<`、`>=`、`<=`）。
> - 实现 `PartialOrd` 的类型可以使用 `>`、`<` 等比较运算符。
>
> `T: Copy`：表示类型 `T` 必须实现 `Copy` trait。`Copy` 是一个标记 trait（marker trait），表示该类型的值在赋值或传参时是 **按位复制（bitwise copy）**，而不是移动（move）。
>
> **`+`**：表示且，这里`T: PartialOrd + Copy`表面类型`T`必须实现了这两个特质。

- 结构体泛型

~~~rust
// 定义一个泛型结构体
struct Point<T> {
    x: T,
    y: T,
}

fn main() {
    let integer = Point { x: 5, y: 10 };
    let float = Point { x: 1.0, y: 4.0 };
    println!("x: {}, y: {}", integer.x, integer.y);
    println!("x: {}, y: {}", float.x, float.y);
}
~~~

- 枚举泛型

~~~rust
// Option 和 Result 都是 Rust 标准库中的泛型枚举
enum Option<T> {
    Some(T),
    None,
}

enum Result<T, E> {
    Ok(T),
    Err(E),
}
~~~

- 方法泛型

~~~rust
struct Point<T> {
    x: T,
    y: T,
}

// 只为特定类型实现方法
impl Point<f64> {
    fn distance_from_origin(&self) -> f64 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }
}

fn main() {
    let _oint1 = Point { x: 5, y: 10 };
    let point2 = Point { x: 1.0, y: 4.0 };
    //point1.distance_from_origin(); // point1无法调用此方法
    point2.distance_from_origin();
}
~~~

**泛型约束**：可以使用 trait bound 来限制泛型参数必须实现的 trait。

~~~rust
// 单个约束
fn print<T: Display>(value: T) {
    println!("{}", value);
}

// 多个约束
fn compare<T: PartialOrd + Debug>(a: T, b: T) {
    println!("{:?} vs {:?}", a, b);
}

// 使用 where 子句简化
fn some_function<T, U>(t: T, u: U) 
where 
    T: Display + Clone,
    U: Clone + Debug,
{
    // 函数体
}
~~~

**关联类型**：关联类型是泛型的一种高级用法，允许在 trait 中定义类型占位符。

~~~rust
trait Iterator {
    type Item; // 关联类型：表示迭代器产生的元素类型

    fn next(&mut self) -> Option<Self::Item>; // 返回关联类型的值
}

struct Counter {
    count: u32,
}

impl Iterator for Counter {
    type Item = u32; // 指定关联类型为 u32

    fn next(&mut self) -> Option<Self::Item> {
        if self.count < 5 {
            self.count += 1;
            Some(self.count) // 返回 Option<u32>
        } else {
            None
        }
    }
}

fn main() {
    let mut counter = Counter { count: 1 };
    let res = counter.next();
    println!("{:?}", res);
}
~~~

泛型和 trait 对象是 Rust 中实现多态的两种方式：

- 泛型：静态分发，在编译时确定具体类型
- trait 对象：动态分发，在运行时通过虚表调用方法

## 错误

| **机制** | **用途**                   | **资源清理**         | **调用方处理**          |
| -------- | -------------------------- | -------------------- | ----------------------- |
| `panic!` | 不可恢复错误（如逻辑错误） | 自动展开栈清理       | 通常终止程序或线程      |
| `Result` | 可恢复错误（如文件未找到） | 需手动处理（如 `?`） | 必须显式处理 `Ok`/`Err` |
| `Option` | 值可能不存在（如查找结果） | 无需特殊处理         | 需检查 `Some`/`None`    |

### 不可恢复错误

> 展开调用栈（Unwind）：
>
> - 默认情况下，Rust 会**逆向遍历调用栈**，逐个调用变量的 `drop` 方法清理资源（如内存、文件句柄）。
> - 可通过 `Cargo.toml` 配置 `panic = 'abort'` 跳过清理，直接终止程序（减少二进制体积）。
>
> **终止程序**：进程退出，返回非零错误码（通常为 `101`）。

`panic!`表示**不可恢复的错误**。当程序遇到无法处理的严重错误（如数组越界、无效状态、逻辑矛盾）时，主动触发崩溃并终止执行。

发送此错误是，Rust 会打印错误信息，展开调用栈（`unwind`）清理资源，或直接终止程序（通过 `Cargo.toml` 配置 `panic = 'abort'`）。

~~~rust
fn divide(a: i32, b: i32) -> i32 {
    if b == 0 {
        panic!("Division by zero!"); // 触发不可恢复错误
    }
    a / b
}
~~~



### 可恢复错误

>错误处理方式对比：
>
>| 方式            | 特点                                                         |
>| --------------- | ------------------------------------------------------------ |
>| `match`         | 显式处理所有分支，但代码冗长。                               |
>| `unwrap()`      | 直接解包，失败时 `panic!`（仅用于原型或确定不会失败的场景）。 |
>| `expect("msg")` | 类似 `unwrap`，但可自定义错误消息。                          |
>| `?`             | 简洁传播错误，推荐在业务逻辑中使用。                         |

`Result`枚举表示**可恢复的错误**，表示可能失败的操作，强制调用方显式处理错误。

~~~rust
enum Result<T, E> {
    Ok(T),   // 成功时返回的值
    Err(E),  // 失败时返回的错误类型
}
~~~

示例：

~~~rust
use std::fs::File;
use std::io::Error;

fn read_file(path: &str) -> Result<String, Error> {
    let file = File::open(path)?; // 使用 `?` 快速传播错误
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

fn main() {
    match read_file("example.txt") {
        Ok(text) => println!("File content: {}", text),
        Err(e) => println!("Error reading file: {}", e),
    }
}
~~~

相关特性：

- `?` 操作符：简化错误传播，自动将 `Err` 返回给上层调用者。
- 组合方法：如 `map_err`、`and_then` 等，支持灵活的错误转换与链式处理。
- 自定义错误类型：通过实现 `std::error::Error` trait 定义结构化错误，便于调试和日志记录。

#### 处理方式

`?` 操作符是**错误传播**的快捷方式，用于简化 `Result` 或 `Option` 类型（或其他实现了 `Try` trait 的类型）的错误处理。它的核心作用是：**如果当前操作返回 `Err`（或 `None`），则立即从当前函数返回该错误；否则解包并继续执行**。

- 对 `Result` 类型：
  - 如果值是 `Ok(T)`，解包并返回 `T`。
  - 如果值是 `Err(E)`，立即从当前函数返回 `Err(E)`。
- 对 `Option` 类型：
  - 如果值是 `Some(T)`，解包并返回 `T`。
  - 如果值是 `None`，立即从当前函数返回 `None`。

`unwrap()` 和 `expect("msg")` 是用于快速解包 `Result` 或 `Option` 类型的方法，但它们在错误处理方式上有所不同：**如果值是 `Err` 或 `None`，它们会直接触发 `panic!` 终止程序**。因此，它们通常仅用于**确定不会失败**的场景（如原型开发、测试或不可失败的逻辑）。

- `unwrap()`
  - 如果值是 `Ok(T)` 或 `Some(T)`，返回 `T`。
  - 如果值是 `Err(E)` 或 `None`，**直接 `panic!`**，并输出默认错误信息。

~~~rust
let x = Some(42);
let value = x.unwrap(); // 安全：x 是 Some(42)
println!("{}", value); // 输出: 42

let y: Option<i32> = None;
let _value = y.unwrap(); // 触发 panic!: called `Option::unwrap()` on a `None` value
~~~

- `expect("msg")`
  - 类似于 `unwrap()`，但允许自定义 `panic!` 时的错误消息。
  - 如果值是 `Err(E)` 或 `None`，**触发 `panic!` 并输出自定义消息**。

~~~rust
let x = Some(42);
let value = x.expect("x should not be None"); // 安全：x 是 Some(42)
println!("{}", value); // 输出: 42

let y: Option<i32> = None;
let _value = y.expect("y should not be None"); // 触发 panic!
~~~



### `Option` 

`Option` 枚举表示**可选值的处理**，表示值可能不存在（非错误场景，如查找元素未找到）。

~~~rust
enum Option<T> {
    Some(T), // 存在值
    None,    // 无值
}
~~~

示例：

~~~rust
fn find_index(vec: &[i32], target: i32) -> Option<usize> {
    vec.iter().position(|&x| x == target)
}

fn main() {
    let vec = vec![1, 2, 3];
    match find_index(&vec, 2) {
        Some(index) => println!("Found at index: {}", index),
        None => println!("Not found"),
    }
}
~~~

### 自定义Error

自定义错误类型的步骤：

1. 自定义错误类型结构体：创建一个结构体来表示错误类型，通常包括一些字段来描述错误的详细信息。
2. 实现`std::fmt:Display trait`：实现这个特质以定义如何展示错误信息。
3. 实现`std::error::Error trait`：实现此特质以满足Rust错误处理机制的要求。

~~~rust
use std::{f32::consts::E, fmt};

#[derive(Debug)]
pub struct MyError {
    message: String,
    cause: Option<Box<dyn std::error::Error>>,
}

impl MyError {
    fn new(message: String) -> Self {
        MyError {
            message,
            cause: None,
        }
    }

    fn with_cause(message: String, cause: Box<dyn std::error::Error>) -> Self {
        MyError {
            message,
            cause: Some(cause),
        }
    }
}

impl fmt::Display for MyError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.message)?;
        if let Some(cause) = &self.cause {
            write!(f, ": {}", cause)?;
        }
        Ok(())
    }
}

impl std::error::Error for MyError {
    // 方式1
    /* fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        self.cause.as_ref().map(|e| e.as_ref())
    } */
    // 方式2：更简单的写法
    fn description(&self) -> &str {
        &self.message
    }
}

fn read_file() -> Result<String, MyError> {
    let content = std::fs::read_to_string("test.toml")
        .map_err(|e| MyError::with_cause("读文件失败".to_string(), Box::new(e)))?;
    Ok(content)
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    match read_file() {
        Ok(msg) => println!("{msg}"),
        Err(err) => {
            println!("{}", err);
            println!("================");
            println!("{:?}", err);
            println!("================");
        }
    }
    read_file()?;
    Ok(())
}
~~~

> `dyn std::error::Error`（动态 trait 对象）
>
> - `dyn` 表示**动态分发**，即运行时确定具体类型。
> - `std::error::Error` 是 Rust 的标准错误 trait，所有错误类型都可以实现它。
> - 因此，`dyn std::error::Error` 可以指向**任何实现了 `Error` trait 的类型**（如 `io::Error`、`String`、自定义错误等）
> - 注：简单理解，这个相当于接口，实现了这个特质的相当于它的实现类。
>
> `+ 'static`（生命周期约束）
>
> - `’static`：表示被引用的对象必须具有静态生命周期，即：
>   - 要么是全局变量（如字符串字面量 `"error"`）。
>   - 要么是 `Box<dyn Error>` 或 `'static` 生命周期的数据（如 `Box::new("error")`）。
> - 这样可以确保引用在**整个程序运行期间**都有效，避免悬垂引用（dangling reference）。

## 运算符重载

**运算符重载**是一种通过实现标准库中 `std::ops` 模块下的特质（Trait），为自定义类型定义运算符行为的机制。它允许开发者以直观的语法操作自定义类型，提升代码的可读性和表现力。

Rust 的运算符重载通过实现 `std::ops` 中的特质来完成。每个运算符对应一个特质，例如：

- 算术运算符：
  - `Add`（`+`）：加法
  - `Sub`（`-`）：减法
  - `Mul`（`*`）：乘法
  - `Div`（`/`）：除法
  - `Rem`（`%`）：取余
- 位运算符：
  - `BitAnd`（`&`）：按位与
  - `BitOr`（`|`）：按位或
  - `BitXor`（`^`）：按位异或
  - `Shl`（`<<`）：左移
  - `Shr`（`>>`）：右移
- 一元运算符：
  - `Neg`（`-`）：取负
  - `Not`（`!`）：逻辑非
- 复合赋值运算符：
  - `AddAssign`（`+=`）：加法赋值
  - `SubAssign`（`-=`）：减法赋值
  - 其他类似（`*=`、`/=` 等）

示例：

~~~rust
use std::ops::Add;

#[derive(Debug)]
struct Complex {
    real: f64,
    imag: f64,
}

impl Add for Complex {
    type Output = Complex;

    fn add(self, other: Complex) -> Complex {
        Complex {
            real: self.real + other.real,
            imag: self.imag + other.imag,
        }
    }
}

fn main() {
    let a = Complex { real: 1.0, imag: 2.0 };
    let b = Complex { real: 3.0, imag: 4.0 };
    let result = a + b;
    println!("Result: {} + {}i", result.real, result.imag);
}
~~~



# 其他

## 命名规范

- 文件名、模块名、包名：使用小写字符和下划线。
- 结构体、枚举：使用大驼峰命名法（`Pascal Case`）。
- 函数名、变量名：使用小写字符和下划线（`Snake Case`）。
- 常量名：使用大写字符和下划线。
- 变量名前面加`_`，表示忽略掉它，此时编译器不会再提示该变量未被使用。