## Salt Config
Requires msgpack-pure for python to run, and salt-common package.
```
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh
git clone https://github.com/annonymouse/salt-config
salt-call --local -m salt-config/_modules --file-root salt-config state.highstate

```
	
