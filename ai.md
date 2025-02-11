# Chatgpt

## 免费

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

## 插件

### sider.ai

地址：[Sider：ChatGPT 侧边栏 + GPT-4o、Claude 3、Gemini 1.5 和 AI 工具](https://sider.ai/)

自身有一定免费次数

# spring-ai

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



## openai

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

# ollama

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



## spring-ai

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

## web&desktop

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





