# 模型

## ChatGPT

### chatanywhere

地址：[github.com](https://github.com/chatanywhere/GPT_API_free?utm_source=gold_browser_extension)

- GPT-3.5-Turbo无限次，制**60请求/小时/IP&Key**调用频率；

- GPT-4，一天3次。

帮助文档：[发出请求 - ChatAnywhere API 帮助文档 (apifox.cn)](https://chatanywhere.apifox.cn/)

在一些可以支持代理的软件/插件也可以使用这个key。

例如：sider.ai

- 设置里配置好key
- 配置代理：使用自己的网址，二选一
	- 转发Host1: `https://api.chatanywhere.tech`
	- 转发Host2: `https://api.chatanywhere.com.cn`

- 

# 插件

## 浏览器

### sider.ai

地址：[Sider：ChatGPT 侧边栏 + GPT-4o、Claude 3、Gemini 1.5 和 AI 工具](https://sider.ai/)

自身有一定免费次数

## IDEA

- 通义灵码-阿里
- CodeGeeX-清华大学+智谱AI 需申请内侧资格
- Bito 付费
- Amazon CodeWhisperer-亚马逊
- GitHub Copilot - 买不起
- Codeium
- AIXcoder
- iflyCode星火

## VSCode

- CodeGeeX

# 框架

## spring-ai

依赖管理：

~~~xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.springframework.ai</groupId>
            <artifactId>spring-ai-bom</artifactId>
            <version>1.0.0-SNAPSHOT</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
<repositories>
    <!--快照版仓库-->
    <repository>
        <id>spring-snapshot</id>
        <name>Spring Snapshots</name>
        <url>https://repo.spring.io/milestone</url>
        <snapshots>
            <enabled>false</enabled>
        </snapshots>
    </repository>
</repositories>
~~~

> spring官方还没出正式版，需要使用官方的快照版仓库

非spring官方的：

~~~xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>group.springframework.ai</groupId>
            <artifactId>spring-ai-bom</artifactId>
            <!--版本自己选择-->
            <version>1.1.0</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
~~~



### openai

依赖和配置：

~~~xml
<dependency>
    <groupId>group.springframework.ai</groupId>
    <artifactId>spring-ai-openai-spring-boot-starter</artifactId>
</dependency>
~~~

~~~yaml
spring:
  ai:
    openai:
      api-key: ${api-key}
      base-url: https://api.chatanywhere.tech
      chat:
        options:
          model: gpt-3.5-turbo
          temperature: 0.4F
~~~



基本使用：

- 仅回复文字：

~~~java
@RestController
@RequiredArgsConstructor
public class ChatController {
	private final OpenAiChatModel openAiChatModel;

	@GetMapping("/chat")
	public Object chat(String msg) {
        // 方式2：使用prompt
		/*Prompt prompt = new Prompt(msg, OpenAiChatOptions.builder()
				// 选择模型
				.withModel("gpt-3.5-turbo")
				// 选择温度0-1：温度越高，越具有创新性、准确性越低
				.withTemperature(0.7F)
				.build());
		ChatResponse response = openAiChatModel.call(prompt);
		return response.getResult().getOutput().getContent();*/
        // 方式1：直接传递字符串参数
		return openAiChatModel.call(msg);
	}
}
~~~

- 画图

~~~java
@Resource
private OpenAiImageModel openAiImageModel;

public Object img(String msg) {
    ImagePrompt prompt = new ImagePrompt(msg, ImageOptionsBuilder.builder().withModel("gpt-4-dalle").build());
    ImageResponse response = openAiImageModel.call(prompt);
    return response.getResult().getOutput().getUrl();
}
~~~

- 语音到文本、文本到语音

~~~java
// 语音到文本
private OpenAiAudioTranscriptionModel openAiAudioTranscriptionModel;

// 文本到语音
private OpenAiAudioSpeechModel openAiAudioSpeechModel;
~~~

- 多模态：可以同时处理文本、图像、音频和其他数据格式

~~~java
private ChatModel chatModel;
//ChatClient

UserMessage message = new UserMessage(msg, List.of(new Media(MimeTypeUtils.IMAGE_PNG, new URL("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"))));
ChatResponse response = chatModel.call(new Prompt(List.of(message), OpenAiChatOptions.builder()
                                                  .withModel(OpenAiApi.ChatModel.GPT_4_VISION_PREVIEW.getValue())
                                                  .build()));
System.out.println(response.getResult().getOutput().getContent());
~~~

# 工具

## AI搜索

- [秘塔AI搜索 (metaso.cn)](https://metaso.cn/)

## ollama

ollama是一个用于快速部署和运行各种开源大模型的工具。

下载地址：[Download Ollama on Windows](https://ollama.com/download/windows)，github地址：https://github.com/ollama/ollama

docker部署：`docker pull ollama/ollama`

~~~bash
docker run -d -v ollama:/root/ollama -p 11434:11434 --name ollama ollama/ollama
~~~



运行大模型命令：`ollama run 模型名:版本号`，模型名和版本号官网查看。例如千问大模型：`ollama run qwen:0.5b-chat`

启动大模型后的默认监听端口为：11434。

常用命令：与docker命令类似

~~~bash
# 拉取模型
ollama pull 模型名:版本号
ollama run llama3	# 运行
ollama rm llama3	# 删除
ollama cp llama3 my-model	# 复制
~~~



### spring-ai

依赖和配置：

~~~xml
<dependency>
    <groupId>group.springframework.ai</groupId>
    <artifactId>spring-ai-ollama-spring-boot-starter</artifactId>
</dependency>
~~~

~~~yaml
spring:
  ai:
    ollama:
      base-url: http://localhost:11434
      chat:
        options:
          # model: 模型名:版本号
		  model: qwen:0.5b-chat
          temperature: 0.4F
~~~

Api接口（类似openai）：

~~~java
@Resource
private OllamaChatModel ollamaChatModel;
~~~

### web&desktop

ollama的`web&desktop`非常多，比较流行的是`Open WebUI`，在ollama的github主页上可以看到支持ollama的`web&desktop`有哪些。

OpenWebUI官网：https://openwebui.com，缺点是不支持中文，支持docker部署。

LobeChat界面框架：支持中文、docker部署，功能更加强大。官网：https://lobehub.com/zh。

~~~bash
docker run -d -p 3210:3210 \
  -e OPENAI_API_KEY=sk-xxxx \
  -e OPENAI_PROXY_URL=https://api-proxy.com/v1 \
  -e ACCESS_CODE=lobe66 \
  --name lobe-chat \
  lobehub/lobe-chat
~~~

## Cursor

Cursor是一款AI驱动的代码编辑器，主要面向专业开发者，提供从代码生成、调试到文档审查的全面支持。它基于VSCode进行了二次开发，继承了VSCode的强大功能和用户界面，同时集成了多种AI模型（如Claude、GPT-4等），能够实现智能代码补全、上下文理解、实时代码生成与重构等功能。

官网：https://www.cursor.com

Cursor的核心功能包括：

- **智能代码补全**：通过上下文感知提供实时代码建议，帮助开发者快速完成代码编写；并且能推测光标位置。
- **代码生成与重构**：支持根据简短描述自动生成代码块，并提供代码优化建议。
- **错误检测与调试**：自动检测潜在错误并提供修复建议，帮助开发者及时发现并解决问题。
- **多语言支持**：支持Python、Java、C#等多种主流编程语言。
- **插件与扩展**：兼容VSCode的插件生态系统，用户可以轻松安装和管理扩展。
- 支持MCP

# MCP

Model Context Protocol (MCP) 是一个开放协议，它使 LLM 应用与外部数据源和工具之间的无缝集成成为可能。无论你是构建 AI 驱动的 IDE、改善 chat 交互，还是构建自定义的 AI 工作流，MCP 提供了一种标准化的方式，将 LLM 与它们所需的上下文连接起来。

中文文档地址：[MCP 中文文档 (mcp-docs.cn)](https://mcp-docs.cn)

