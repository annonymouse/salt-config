## Salt Config
```
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh
git clone https://github.com/annonymouse/salt-config
salt-call --local --file-root salt-config state.highstate

```
	
