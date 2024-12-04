

```python
import numpy as np
from sklearn.datasets import fetch_openml
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt
from PIL import Image

# 载入 MNIST 手写数字图像数据集
mnist = fetch_openml('mnist_784')

# 数据预处理：标准归一化
scaler = StandardScaler()
X = scaler.fit_transform(mnist.data)

# 划分训练集和测试集
X_train, X_test, y_train, y_test = train_test_split(X, mnist.target, test_size=0.2, random_state=42)

# 创建 logistic regression 模型
model = LogisticRegression(max_iter=1000)

# 在训练集上训练模型
model.fit(X_train, y_train)

# 在测试集上进行预测
y_pred = model.predict(X_test)

# 输出模型的准确率
print("Accuracy: %.2f" % accuracy_score(y_test, y_pred))

# 读取测试图片
test_image = Image.open('test_image.png')

# 将图片转换为灰度图像
test_image_gray = test_image.convert('L')

# 将灰度图像转换为 numpy 数组
test_image_array = np.array(test_image_gray)

# 将 numpy 数组重塑为一维数组
test_image_flat = test_image_array.reshape(1, -1)

# 对测试图片进行标准归一化处理
test_image_scaled = scaler.transform(test_image_flat)

# 预测测试图片的数字
prediction = model.predict(test_image_scaled)

# 显示测试图片和预测结果
plt.imshow(test_image_gray, cmap='gray')
plt.title(f"Prediction: {prediction[0]}")
plt.axis('off')
plt.show()

```

