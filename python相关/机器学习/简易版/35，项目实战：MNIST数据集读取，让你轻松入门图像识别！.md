设置对数据进行处理的逻辑

```python
transform=transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.1307,), (0.3081,))
    ])
```



读取数据

```python
dataset1 = datasets.MNIST('./data', train=True, download=True, transform=transform)
dataset2 = datasets.MNIST('./data', train=False, transform=transform)
```



设置数据加载器，顺带设置批次大小和是否打乱数据

```python
train_loader = torch.utils.data.DataLoader(dataset1, batch_size=128, shuffle=True)
test_loader = torch.utils.data.DataLoader(dataset2, batch_size=1000)
```

