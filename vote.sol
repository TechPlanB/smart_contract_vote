/**
*   我们创建一个简单的投票合约。
*   投票合约允许选民对不同的候选人进行投票，并查看每个候选人的得票情况。
*   以下是 Solidity 实现的简化版本：
*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    // 投票候选人的结构体
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // 合约的所有者
    address public owner;

    // 投票截止时间
    uint256 public votingEndTime;

    // 存储候选人的数组
    Candidate[] public candidates;

    // 保存每个地址的投票状态
    mapping(address => bool) public hasVoted;

    // 投票事件
    event Voted(address indexed voter, string candidateName);

    // 合约构造函数
    constructor(uint256 _votingDurationMinutes, string[] memory _candidateNames) {
        owner = msg.sender;
        votingEndTime = block.timestamp + _votingDurationMinutes * 1 minutes;

        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({
                name: _candidateNames[i],
                voteCount: 0
            }));
        }
    }

    // 投票函数
    function vote(uint256 candidateIndex) public {
        // 检查投票截止时间
        require(block.timestamp < votingEndTime, "Voting has ended");

        // 检查是否已经投过票
        require(!hasVoted[msg.sender], "Already voted");

        // 检查候选人索引是否有效
        require(candidateIndex < candidates.length, "Invalid candidate index");

        // 增加候选人的得票数
        candidates[candidateIndex].voteCount += 1;

        // 标记该地址已经投票
        hasVoted[msg.sender] = true;

        // 触发投票事件
        emit Voted(msg.sender, candidates[candidateIndex].name);
    }

    // 获取候选人的得票数
    function getVotes(uint256 candidateIndex) public view returns (uint256) {
        require(candidateIndex < candidates.length, "Invalid candidate index");
        return candidates[candidateIndex].voteCount;
    }
}
