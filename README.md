## 案例

- 我们创建一个简单的投票合约。
- 投票合约允许选民对不同的候选人进行投票，并查看每个候选人的得票情况。
- Solidity 实现的简化版本

## 技术解析：

- 结构体和映射：使用结构体 Candidate 存储每个候选人的信息，使用映射 hasVoted 记录每个地址是否已经投票。

- 数组和循环：使用数组 candidates 存储所有候选人，通过循环初始化候选人信息。

- 合约构造函数：构造函数初始化合约的所有者、投票截止时间和候选人数组。

- 时间戳和截止时间检查：使用 block.timestamp 获取当前时间戳，确保投票在截止时间之前进行。

- 事件：使用事件 Voted 记录投票信息，方便外部监听。

- 权限控制：确保只有未投票的地址才能进行投票，以及只有合约的所有者才能初始化合约。

这个例子涵盖了 Solidity 中的一些基本概念，包括结构体、映射、数组、循环、合约构造函数、时间戳和事件。在实际开发中，还需考虑更多方面的安全性和优化。
