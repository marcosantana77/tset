#https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands
#https://www.digitalocean.com/community/tutorials/how-to-set-up-a-basic-iptables-firewall-on-centos-6

#List rules with line number and verbose 
sudo iptables -L -v -line-numbers

#delete rule by line number
sudo iptable -D INPUT <line>


#block or reject an ip address
sudo iptables -A INPUT -s 15.15.15.51 -j DROP || REJECT

#allow all ssh
sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#allow all ssh for specific ip 
sudo iptables -A INPUT -p tcp -s 15.15.15.0/24 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Allow Incoming Rsync from Specific IP Address or Subnet
sudo iptables -A INPUT -p tcp -s 15.15.15.0/24 --dport 873 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 873 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Allow All Incoming HTTP
sudo iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT


#Redirect/Forward of ports
# Sources: 
#     https://coderwall.com/p/plejka/forward-port-80-to-port-3000
#     https://www.digitalocean.com/community/tutorials/how-to-list-and-delete-iptables-firewall-rules

# Add internal forward from 80 to 3000
sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 3000

# Add external forward from 80 to 3000
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000


# Cancel former internal forward (mind the D parameter) 
sudo iptables -t nat -D OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 3000


# Cancel former external forward (mind the D parameter) 
sudo iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000


 


