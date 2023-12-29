
# dig Commands

## Introduction

In this article, I am going to present a comprehensive cheat sheet of commonly used **dig** commands with examples.

The `dig` command is a network administration tool used for querying `Domain Name System` (DNS) servers. It is commonly used on Unix-like operating systems, including Linux. The name `dig` stands for `domain information groper.`

 This command is useful for retrieving various types of DNS information, such as IP addresses associated with domain names, mail exchange records, name server information, and more.

## Installing dig

Use the following commands to install dig in MacOS and Linux environments. The installation process varies depending on the operating system. 


### Linux (Debian/Ubuntu):

On Debian-based systems, you can use the package manager, `apt`, to install `dnsutils`, which includes `dig`:

```bash
sudo apt update
sudo apt install dnsutils
```

### Linux (Red Hat/CentOS/Fedora):

On Red Hat-based systems, you can use the `yum` or `dnf` package manager:

```bash
# For CentOS 7 and earlier or RHEL 7 and earlier
sudo yum install bind-utils

# For CentOS 8, RHEL 8, and Fedora
sudo dnf install bind-utils
```

### macOS:

On macOS, you can use the package manager `brew` to install `dig`:

```bash
# Install Homebrew if you haven't already
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dig
brew install bind
```

## dig help

Displays general help information about dig, including a list of available commands and options.

```sh
dig -h
# or
dig -help
```
## dig version

Displays version informatio of dig

```sh
dig -v
# or
dig version
```

## dig Command Syntax
```bash
dig [options] [domain]
```

- `[options]`: Additional parameters to customize the query.
- `[domain]`: The domain you want to query.


## Using dig for a domain name:

```bash
dig anjikeesari.com
```
output 
```sh
; <<>> DiG 9.10.6 <<>> anjikeesari.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 26652
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;anjikeesari.com.		IN	A

;; ANSWER SECTION:
anjikeesari.com.	600	IN	A	185.199.109.153
anjikeesari.com.	600	IN	A	185.199.110.153
anjikeesari.com.	600	IN	A	185.199.111.153
anjikeesari.com.	600	IN	A	185.199.108.153

;; Query time: 137 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Wed Dec 27 15:28:58 PST 2023
;; MSG SIZE  rcvd: 108
```
## Using dig for short answers:

```bash
dig +short anjikeesari.com
```

output

```sh
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```
## Using dig for detailed answers:

```bash
dig anjikeesari.com +noall +answer
```
output

```sh
; <<>> DiG 9.10.6 <<>> anjikeesari.com +noall +answer
;; global options: +cmd
anjikeesari.com.	600	IN	A	185.199.108.153
anjikeesari.com.	600	IN	A	185.199.109.153
anjikeesari.com.	600	IN	A	185.199.110.153
anjikeesari.com.	600	IN	A	185.199.111.153
```
## Using dig for specifying name servers:

```bash
dig NS anjikeesari.com 
# or
dig NS anjikeesari.com +short
```

output

```sh
; <<>> DiG 9.10.6 <<>> NS anjikeesari.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 2372
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 5

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;anjikeesari.com.		IN	NS

;; ANSWER SECTION:
anjikeesari.com.	3600	IN	NS	ns72.domaincontrol.com.
anjikeesari.com.	3600	IN	NS	ns71.domaincontrol.com.

;; ADDITIONAL SECTION:
ns71.domaincontrol.com.	35357	IN	A	97.74.105.46
ns71.domaincontrol.com.	35656	IN	AAAA	2603:5:2194::2e
ns72.domaincontrol.com.	35357	IN	A	173.201.73.46
ns72.domaincontrol.com.	35656	IN	AAAA	2603:5:2294::2e

;; Query time: 40 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Wed Dec 27 15:36:48 PST 2023
;; MSG SIZE  rcvd: 184
```

## Using dig for auery all DNS record types:

```bash
dig anjikeesari.com ANY
```

## Using dig to search for record type:

Querying TXT records

```bash
dig anjikeesari.com -t TXT
```

output 
```sh
; <<>> DiG 9.10.6 <<>> anjikeesari.com -t TXT
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28965
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;anjikeesari.com.		IN	TXT

;; AUTHORITY SECTION:
anjikeesari.com.	600	IN	SOA	ns71.domaincontrol.com. dns.jomax.net. 2023071000 28800 7200 604800 600

;; Query time: 101 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Wed Dec 27 15:34:22 PST 2023
;; MSG SIZE  rcvd: 112
```

Querying A records 

```sh
dig +nocmd anjikeesari.com a +noall +answer
```

output

```sh
anjikeesari.com.	600	IN	A	185.199.109.153
anjikeesari.com.	600	IN	A	185.199.110.153
anjikeesari.com.	600	IN	A	185.199.111.153
anjikeesari.com.	600	IN	A	185.199.108.153
```
## Using dig to trace DNS path

```bash
dig +trace anjikeesari.com
# or
dig anjikeesari.com +trace
```

Querying CNAME records 

```sh
dig +nocmd mail.google.com cname +noall +answer
```
## Using dig for mail server for the domain:

```bash
dig MX anjikeesari.com +short
# or 
dig MX anjikeesari.com
```

Querying MX records

```sh
dig +nocmd anjikeesari.com ms +noall +answer
```

## Using dig for reverse DNS lookup:

```bash
dig -x 185.199.108.153
# or 
dig -x 185.199.108.153 +short
```
output
```sh
cdn-185-199-108-153.github.com.
```

<!-- 

## references:
- https://linuxize.com/post/how-to-use-dig-command-to-query-dns-in-linux/

 -->