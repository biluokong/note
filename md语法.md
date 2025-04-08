- 锚定：给目的地文字加上标签 `<font id="name"></font`，然后在想要被点击(按住ctrl)就能跳转的文字（如这里）加上 `[这里](#name)`

- 表格：`|标题1|标题2|标题3|+回车`

	

~~~mermaid
graph LR
    subgraph 前端
        A[Vue 3] -->|路由管理| B[Vue Router]
        A -->|状态管理| C[Pinia]
        A -->|UI组件| D[Element Plus]
        A -->|HTTP请求| E[Axios]
        E -->|API调用| F[后端接口]
    end
 
    subgraph 后端
        F -->|处理请求| G[Express.js]
        G -->|数据操作| H[Mongoose.js]
        H -->|数据库| I[MongoDB]
    end
 
    classDef frontend fill:#E5F6FF,stroke:#007ACC,stroke-width:2px;
    classDef backend fill:#FFF2CC,stroke:#D2691E,stroke-width:2px;
    class A,B,C,D,E frontend;
    class F,G,H,I backend;
~~~

