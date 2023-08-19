# toml-to-env

A simple python script for converting a toml file into environment variables.

```
$ cat test.toml
[a]
b = 2
c = "string"

[alpha]
beta = 22
gamma = "STRING"
$ toml-to-env test.toml
a__b="2"
a__c="string"
alpha__beta="22"
alpha__gamma="STRING"
```

This was also a test of packaging a python script with nix flakes.  As a result, you can run the script with the following:

```
nix run github:rutrum/toml-to-env -- input.toml
```
