#!/bin/bash

export OVERMIND_NO_PORT=1
export OVERMIND_TMUX_CONFIG=~/.overmind.tmux.conf

# Kill all services
ls -a | grep .overmind.socket | xargs -I {} bash -c 'overmind kill -s {}'
ls -a | grep .overmind.socket | xargs -I {} bash -c 'rm {}'

overmind start -f Procfile -s .redis_cluster.overmind.socket &
redis_cluster_pid=$!

wait $redis_cluster_pid
