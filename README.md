Joys-node-docker v.3.0 (08/07/2021)
================

JOYS node Docker Compose

History
--------------------
- v1.0 Proof of work (Homestead)
- v2.0 Proof of work (Constantinople) 
  - v2.2 - added fork2 (Istanbul)
  - v2.1 - new nodes added
- v3.0 Proof of Authority with Staking (PoAS)
  - New network and genesis
  - Transferred wallet balances
  - Ports changed from 30303 to 31323
  - Removed http permissions: admin,db,personal,shh 
  
Deploying a JOYS node
--------------------

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git clone https://github.com/Joys-digital/joys-node-docker
cd joys-node-docker
sudo docker-compose -f docker-compose.yml up --build
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**The block speed in PoAS is 1 block per second, so we recommend using an SSD.**


