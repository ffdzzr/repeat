# repeat.sh

A simple Bash script to run a given command multiple times with a pause in between each execution.

## Description

This script could be used in situations where you need to:

- Monitor command output over time (e.g., `ls`, `df`, etc.)
- Automatically rerun a task periodically for testing or observation
- Simulate cron-like behavior for a limited number of runs

---

## 🛠️ Usage

```bash
./repeat.sh [-t SECONDS] [-n REPEATS] command_to_run
```

### Default:
- -t 10 
- -n 6

## Examples
```bash
./repeat.sh -t 2 -n 4 ls -l
```
- runs "ls -l" 4 times waiting 2 seconds between each run 

```bash
./repeat.sh -t 1 df -h
```
- runs "df -h" 6 times waiting 1 second between each run
