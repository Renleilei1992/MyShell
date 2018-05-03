
---
### 部分命令记录

- 查看内存使用情况
```
top -l 1 | head -n 10 | grep PhysMem
```

- 简单过滤文件
```
grep 64006A033BAA eventlog.01.log | grep 2390001 | grep event_json | awk -F 'event_json":' '{print $2}' | cut -c2- | sort | tail -10
```

