```python
import numpy as np
from sklearn.cluster import KMeans

# 生成数据集
X = np.array([[1, 2], [1, 4], [1, 0],
              [4, 2], [4, 4], [4, 0]])

# 初始化KMeans聚类器
kmeans = KMeans(n_clusters=2, random_state=0)

# 训练KMeans聚类器
kmeans.fit(X)

# 输出聚类结果
print(kmeans.labels_)

# 输出聚类中心点
print(kmeans.cluster_centers_)

```



以下是Python语言实现KMeans聚类算法的示例代码，不依赖任何机器学习库：

```python
import numpy as np
import matplotlib.pyplot as plt

def kmeans(X, k, max_iter=100):
    # 随机初始化k个中心点
    centers = X[np.random.choice(X.shape[0], k, replace=False)]
    labels = np.zeros(X.shape[0])
    
    for i in range(max_iter):
        # 分配样本到最近的中心点
        distances = np.sqrt(((X - centers[:, np.newaxis])**2).sum(axis=2))
        new_labels = np.argmin(distances, axis=0)
        
        # 更新中心点
        for j in range(k):
            centers[j] = X[new_labels == j].mean(axis=0)
            
        # 如果聚类结果没有变化，则提前结束迭代
        if (new_labels == labels).all():
            break
        else:
            labels = new_labels
            
    return labels, centers

# 生成数据集
X = np.vstack((np.random.randn(100, 2) * 0.75 + np.array([1, 0]), 
               np.random.randn(100, 2) * 0.25 + np.array([-0.5, 0.5]), 
               np.random.randn(100, 2) * 0.5 + np.array([-0.5, -0.5])))

# 运行KMeans聚类算法
labels, centers = kmeans(X, k=3)

# 可视化聚类结果
plt.scatter(X[:, 0], X[:, 1], c=labels)
plt.scatter(centers[:, 0], centers[:, 1], marker='x', s=200, linewidths=3, color='r')
plt.show()

```

