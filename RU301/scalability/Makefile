clean:
	rm -f configs/*.conf
	rm -f appendonly.aof
	rm -f dump.rdb
	rm -f nodes.conf

nodes_create:
	bash nodes_create.sh

cluster_create:
	redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 --cluster-replicas 1

cluster_nodes:
	redis-cli -p 7000 cluster nodes

cluster_reshard:
	redis-cli --cluster reshard 127.0.0.1:7000

cluster_rebalance:
	redis-cli --cluster rebalance 127.0.0.1:7000

cluster_add_node:
	redis-cli -p 7000 --cluster add-node 127.0.0.1:7006 127.0.0.1:7000

cluster_add_slave_node:
	redis-cli -p 7000 --cluster add-node 127.0.0.1:7007 127.0.0.1:7000 --cluster-slave --cluster-master-id $(master-id)
