# expo-dev

A code-server image packaged for expo development. 


## Tools included:
- code-server
- NodeJS (12+)
- expo-cli

## Starting code-server

```bash
mkdir -p ~/.config
docker run -it --name code-server12 \
  -p 0.0.0.0:8080:8080 \
  -p 0.0.0.0:19002:19002 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  bencdr/expo-dev:latest
```

You can also publish ports `19000` and `19001` if you don't want to use Expo's tunnel. In this case, the QR code may not work and you will have to manually enter the `exp://` address on your device with the public IP.

## Start developing

1. Log in to your code-server IP (http://host:8080)
2. Clone or start an expo project (`expo init`)
3. `cd my-app`
4. Start expo with a tunnel proxy `expo start --tunnel`
5. Scan the QR code with your mobile device to connect! 🎉

You can run `expo login` to add the project to your account and test from emulators.

---

FYI: code-server also has a proxy feature. Add `--link projectName` at the end of the docker run command to avoid configuring a domain, SSL, and auth for code-server. [More info here](https://github.com/cdr/code-server#alpha-program-)
