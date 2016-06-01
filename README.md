Personal Chef repo

I use this to bootstrap personal machines and VMs.

Download the project and explode it somewhere. cd into that directory and run the following:
```bash
curl -L https://www.opscode.com/chef/install.sh | sudo bash
sudo chef-client -z -o "role[justmiles]"
```

TODO: include a google-chrome cookbook
TODO: install slack
TODO: include atom repo
TODO: install chefdk
