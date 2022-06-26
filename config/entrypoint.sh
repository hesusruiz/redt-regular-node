#!/bin/sh

###############################################################################
# GENERAL PARAMETERS FOR REDT
# YOU SHOULD NOT MODIFY THEM UNLESS YOU HAVE A GOOD REASON
###############################################################################

# This is the NETID for Alastria RedT
NETID="83584648538"

# The type of node, in this case a Regular node
NODE_TYPE="regular"

# The directory where blockchain data is stored
DATA_DIR="/root/alastria/data_dir"

# The directory where configuration data resides
CONFIG_DIR="/root/alastria/config"

# The directory where the private key of the node resides
SECRETS_DIR="/root/alastria/secrets"

# The P2P network listening port. This is how nodes talk to each other
P2P_PORT="21000"

# The timeout for the IBFT protocol execution (inactivity of the proposer)
ISTANBUL_REQUESTTIMEOUT="10000"

# Blockchain sync mode
SYNCMODE="fast"

# Cache size in MB
CACHE="1000"

# Blockchain garbage collection mode
GCMODE="full"


###############################################################################
# LOCAL PARAMETERS FOR YOR NODE
# YOU CAN ADAPT THEM FOR YOUR SPECIFIC NEEDS
# HOWEVER, YOU CAN LEAVE THEM AS DEFAULT VALUES EXCEPT WHERE NOTED
###############################################################################

# The identity of the node (will be publicly displayed in monitoring tools)
NODE_NAME="REG_IN2_NG_Telsius_2_8_00"

# Allow access from applications via HTTP: the JSON-RPC server
ENABLE_RPC="--http"
# The HTTP JSON-RPC network listening address. We are running inside a container so this address is not exposed to the world
RPCADDR="0.0.0.0"
# The port to use for JSONRPC via HTTP
RPCPORT="22000"
# Allowed protocols
RPCAPI="admin,eth,debug,miner,net,txpool,personal,web3,istanbul"

# Allow access from applications via WebSockets: the JSON-RPC server
ENABLE_WS="--ws"
# The WebSockets JSON-RPC network listening address. We are running inside a container so this address is not exposed to the world
WS_ADDR="0.0.0.0"
# The port to use for JSONRPC via WebSockets
WS_PORT="22001"
# Allowed protocols
WS_API="admin,eth,debug,miner,net,txpool,personal,web3,istanbul"

# General logging verbosity: 0=silent, 1=error, 2=warn, 3=info, 4=debug, 5=detail
VERBOSITY="3"

# Per-module verbosity: comma-separated list of <pattern>=<level> (e.g. eth/*=5,p2p=4)
#VMODULE="consensus/istanbul/ibft/core/core.go=5"
VMODULE="p2p/dial.go=5"

#METRICS="--metrics --metrics.expensive --pprof --pprofaddr=0.0.0.0"
# Any additional arguments
ADDITIONAL_ARGS="--nodiscover"

###############################################################################
# PRIVATE KEY FOR YOUR NODE
# WARNING!!! THIS IS THE PRIVATE KEY THAT THE NODE USES TO PROVE ITS IDENTITY
# AND SIGN MESSAGES AT THE NETWORK LEVEL. THIS IS SENSITIVE MATERIAL AND
# YOU SOULD TREAT IT AS SUCH. DO NOT MIX THE NODES'S PRIVATE KEY WITH PUBLIC
# MATERIAL (E.G., IN BACKUPS) TO AVOID UNINTENDED EXPOSURE AND IMPERSONATION
###############################################################################

PRIVATE_KEY="${SECRETS_DIR}/nodekey"

###############################################################################
###############################################################################

GLOBAL_ARGS="--networkid $NETID \
--identity $NODE_NAME \
--datadir ${DATA_DIR} \
--port $P2P_PORT \
--permissioned \
--cache $CACHE \
$ENABLE_RPC \
--http.addr $RPCADDR \
--http.api $RPCAPI \
--http.port $RPCPORT \
$ENABLE_WS \
--ws.addr $WS_ADDR \
--ws.port $WS_PORT \
--ws.api $WS_API \
--istanbul.requesttimeout $ISTANBUL_REQUESTTIMEOUT \
--verbosity $VERBOSITY \
--emitcheckpoints \
--syncmode $SYNCMODE \
--gcmode $GCMODE \
--vmodule $VMODULE \
--nodekey $PRIVATE_KEY \
--nousb "


# Copy (and replace whatever is there) the configuration files to the Geth datadir
# This way, we separate configuration from blockchain data, facilitating administrative tasks
# For example, to create a new node you can just copy the whole data_dir (e.g., with rsync)
# to another machine and start the node with another configuration. This avoids having to
# synchronise the new machine from the beginning.

# Copy the permissioned and static nodes lists
cp ${CONFIG_DIR}/permissioned-nodes.json ${DATA_DIR}/permissioned-nodes.json
cp ${CONFIG_DIR}/static-nodes.json ${DATA_DIR}/static-nodes.json

# Run geth with exec, so it replaces the shell and becomes the pid=1 process
# In this way geth will receive signals as if it were executed standalone
echo "Running geth ${GLOBAL_ARGS} ${ADDITIONAL_ARGS}"
exec geth  ${GLOBAL_ARGS} ${ADDITIONAL_ARGS}
