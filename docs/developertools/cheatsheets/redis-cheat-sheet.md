
# Redis Cache Commands

Azure Cache for Redis is a fully managed, in-memory data store service provided by Microsoft Azure. It offers high-performance data caching capabilities, enabling applications to achieve low-latency access to frequently accessed data. Redis, being an open-source, in-memory data structure store, supports various commands for data manipulation and management. 

In this cheat sheet, we'll explore some commonly used Redis commands specifically for Azure Cache for Redis.

**Key Commands**

## SET key value

Sets the value of a key.

```
SET mykey "Hello"
```

## GET key

Retrieves the value of a key.

```
GET mykey
```

## EXISTS key

Checks if a key exists.

```
EXISTS mykey
```

## DEL key 

Deletes one or more keys.
   
```
DEL mykey
```

**String Commands**

## APPEND key value

Appends a value to a key.
   
   ```
   APPEND mykey " World"
   ```

## STRLEN key

Returns the length of the value stored in a key.
   
   ```
   STRLEN mykey
   ```

## INCR key

Increments the integer value of a key by one.


```
INCR mycounter
```

## MONITOR

The `MONITOR` command in Redis is used to stream all commands received by the Redis server in real-time. It's a helpful tool for debugging and monitoring purposes, allowing you to observe the activity on your Redis instance. Here's how you can use it:

```sh
MONITOR
```

output

```sh
1711242811.987417 [0 fd40:d75d:22:cae2:6b22:700:a41:ab2:40288] "GET" "mykey"
1711242814.532343 [0 fd40:d75d:22:cae2:6b22:700:a41:849:42348] "PING"
1711242814.532363 [0 fd40:d75d:22:cae2:6b22:700:a41:849:42346] "INFO" "replication"
1711242815.257225 [0 fd40:d75d:22:cae2:6b22:700:a41:acb:52114] "INFO" "replication"
1711242815.257260 [0 fd40:d75d:22:cae2:6b22:700:a41:acb:52128] "PING"
1711242815.442303 [0 fd40:d75d:22:cae2:6b22:700:a41:840:36272] "PING"
```

Each line in the monitor output represents a command executed on the server, along with the timestamp, client information, and the command itself.

To stop monitoring, simply close the connection or issue another command on the client.


## PING

the `PING` command to verify the connectivity status before executing other commands. If the server responds with a `PONG`, it indicates that the connection is alive and operational, allowing clients to proceed with executing Redis commands.

```sh
PING
```

output

```sh
PONG
```


## KEYS


The `KEYS` command in Redis is used to retrieve all keys matching a specified pattern. When you issue the KEYS command with a pattern argument, Redis returns a list of keys that match the specified pattern. The * wildcard character matches zero or more characters in the key name, allowing for flexible pattern matching.

```sh
KEYS *
```

output
```sh
1) "key1"
2) "key2"
3) "another_key"
```


```sh
KEYS pattern

KEYS user:*
```

## FLUSHDB


The `FLUSHDB` command in Redis is used to delete all keys from the currently selected database. It effectively removes all data stored in the Redis database associated with the current connection

```sh
FLUSHDB
FLUSHDB ASYNC
```
!!!note
    The FLUSHDB command deletes all keys from the currently selected Redis database permanently. Use it with caution, as data loss is irreversible.


## FLUSHALL


The `FLUSHALL` command in Redis is used to delete all keys from all databases in the Redis instance. It effectively removes all data stored across all databases associated with the Redis server.

```sh
FLUSHALL
FLUSHALL ASYNC
```

!!!note
    The FLUSHALL command deletes all keys from all databases in the Redis instance permanently. Use it with extreme caution, as data loss is irreversible.



## INFO

The `INFO` command provides a wealth of information about the Redis server's state, making it a valuable tool for monitoring, troubleshooting, and performance tuning. By analyzing the output of the INFO command, administrators can gain insights into various aspects of the Redis server's operation and health.


```sh

# Server
redis_version:6.0.14
redis_mode:standalone
os:Windows
arch_bits:64
multiplexing_api:winsock_IOCP
run_id:2394a7426e43250f6e6412d256ad82d2989b844c
uptime_in_seconds:2077180
uptime_in_days:24
hz:10

# Clients
connected_clients:21
maxclients:7500
client_recent_max_input_buffer:8
client_recent_max_output_buffer:0
client_total_writes_outstanding:0
client_total_sent_bytes_outstanding:0
blocked_clients:0
tracking_clients:0
clients_in_timeout_table:0

# Memory
used_memory:196544424
used_memory_human:187.44M
used_memory_rss:415309824
used_memory_rss_human:396.07M
used_memory_peak:906410480
used_memory_peak_human:864.42M
used_memory_peak_perc:21.68%
used_memory_overhead:106090184
used_memory_startup:691856
used_memory_dataset:90454240
used_memory_dataset_perc:46.18%
used_memory_lua:32768
maxmemory:6100000000
maxmemory_reservation:638000000
maxfragmentationmemory_reservation:638000000
maxmemory_desired_reservation:638000000
maxfragmentationmemory_desired_reservation:638000000
maxmemory_human:5.68G
maxmemory_policy:volatile-lru
mem_allocator:jemalloc-4.0.3

# Stats
total_connections_received:32639883
total_commands_processed:154211013
instantaneous_ops_per_sec:21
bytes_received_per_sec:6490
bytes_sent_per_sec:547314
bytes_received_per_sec_human:6.34K
bytes_sent_per_sec_human:534.49K
rejected_connections:0
expired_keys:7549179
evicted_keys:0
keyspace_hits:58233911
keyspace_misses:26941507
pubsub_channels:2
pubsub_patterns:0
total_oom_messages:0

# Replication
role:master

# CPU
used_cpu_sys:6094.812500
used_cpu_user:5064.234375
used_cpu_avg_ms_per_sec:3
server_load:0.75
event_wait:37
event_no_wait:43
event_wait_count:46
event_no_wait_count:38

# Cluster
cluster_enabled:0
cluster_myself_name:

# Keyspace
db0:keys=31308,expires=26294,avg_ttl=26464306438
```


This cheat sheet provides a quick reference to some of the most commonly used Redis commands in Azure Cache for Redis environments. Make sure to refer to the official documentation for comprehensive details and additional commands.