# Mongo DB Sharding POC


## About MongoDB Sharding

We need three types os servers to create our cluster as following:

Shard: 	Servers that are going to store the sharded data
Router: Servers that acts routing queries and are interface between client application and the sharded cluster 
Config: Servers that store configuration for the cluster

### Facts

* Is not possible changing Shard Keys after sharding data nor unshard the callection


## About this POC


### TODO:

* Create a sharded cluster in Docker containers
* Store data in shards
* Analyse how to add new shards without downtime of the servers
* Analyse sharded performance pitfalls and tunnings
* Analyse how to backup sharded data
* Analyse if I could remove a shard and how to move data for others shards
* Analyse best strategies to create and maintain a sharded infrastructure
* Test adding new shard during application operation
* Test how to shard an existent (with data) collection

### Sharded cluster

I'm going to create 3 ReplicasSet


## References

https://docs.mongodb.com/manual/sharding/

https://dzone.com/articles/composing-a-sharded-mongodb-on-docker

