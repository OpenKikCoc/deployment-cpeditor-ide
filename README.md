# deployment-cpeditor-ide
Docker deployment for CP Editor IDE and all relative tools.

## Quick Start

```sh
docker run -p 10000:10000 binacslee/cpeditor-ide
```

Visit `http://127.0.0.1:10000/vnc_lite.html`

## What is it ?

A docker image contains some tools such as:

- [cpeditor](https://github.com/cpeditor/cpeditor)

- [cf-tool](https://github.com/xalanq/cf-tool)

- [Clang Format](http://releases.llvm.org/)

- [yapf](https://github.com/google/yapf)

AND

- C / C++ env

- Python 3.8 env

AND

- noVNC support (which means you can use it from anywhere)

## How to use ?

### Setup Server

1.  Install Docker

2.  Clone the repo

    ```sh
    git clone https://github.com/OpenKikCoc/deployment-cpeditor-ide.git
    ```

3.  run this command in the repo directory:

    ```sh
    docker-compose up
    ```

### Visit as client

Visit `http://127.0.0.1:10000/vnc_lite.html` just at the same machine

Or 

Visit `http://serverip:10000/vnc_lite.html` ( the protocol depends on how you configure it, you can expose the server by more tools (such as `Nginx`) whatever you like)

