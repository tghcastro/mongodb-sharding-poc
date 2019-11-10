 
Write-host("Starting Config servers Replica Set")
docker exec -it mongocfg1 bash -c "echo \""rs.initiate({_id: 'mongors1conf',configsvr: true, version: 1, members: [{ _id : 0, host : 'mongocfg1' },{ _id : 1, host : 'mongocfg2' }, { _id : 2, host : 'mongocfg3' }]})\"" | mongo"
	
Write-host("Verifying Replica Set")
docker exec -it mongocfg1 bash -c "echo 'rs.status()' | mongo"

Write-host("Starting Shard servers Replica Set")
docker exec -it mongors1n1 bash -c "echo \""rs.initiate({_id : 'mongors1', members: [{ _id : 0, host : 'mongors1n1' },{ _id : 1, host : 'mongors1n2' },{ _id : 2, host : 'mongors1n3' }]})\"" | mongo"

Write-host("Verifying Replica Set")
docker exec -it mongors1n1 bash -c "echo 'rs.status()' | mongo"

Write-host("Adding Shards to the routers")
docker exec -it mongos1 bash -c "echo \""sh.addShard('mongors1/mongors1n1')\"" | mongo"

Write-host("Verifying Shard status")
docker exec -it mongos1 bash -c "echo 'sh.status()' | mongo "

Write-host("Create database")
docker exec -it mongors1n1 bash -c "echo 'use testDb' | mongo"

Write-host("Enabling database sharding")
docker exec -it mongos1 bash -c "echo \""sh.enableSharding('testDb')\"" | mongo"

Write-host("Create a collection")
docker exec -it mongors1n1 bash -c "echo \""db.createCollection('testDb.testCollection')\"" | mongo "

Write-host("Shard a collection and set a ShardKey")
docker exec -it mongos1 bash -c "echo \""sh.shardCollection('testDb.testCollection', {'shardingField' : 1})\"" | mongo "