# tiku-public · 化学竞赛公共题库

这是 **tiku-studio** 的公共题库数据仓。仓库里只有「题包」和「图片」，**没有数据库**。

## 目录

```
manifest.json          # 唯一的索引文件，seq 只增不减
packs/*.jsonl          # 一次发布一个文件，写完永不修改，一行一题
images/<sha1>.png      # 按内容哈希命名，天然去重
sources.jsonl          # 可选：题 ↔ 文献/页码
```

## 谁在写

只有仓库所有者（spbbhyg）通过 tiku-studio 设置页的「发布到公共题库」写入。
其他人只读：在 tiku-studio 设置页点「一键更新题库」，客户端会拉取 `manifest.json` 里
`seq` 比本地大的 pack，按 `content_hash` 去重后合并进本地库。

## 注意

- 仓库是 **Public**：题目一旦提交就永久公开，即使后续删除也会留在 git 历史里。
- 不要往这里放 `tiku.db`、私人收藏、错题记录或任何个人数据。
- 图片按内容哈希去重，同一张图重复发布只会存一份。
