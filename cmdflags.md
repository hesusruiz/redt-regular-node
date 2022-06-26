# Quorum v21.10.0 command line flags

## General settings

```go

	// General settings
	DataDirFlag = DirectoryFlag{
		Name:  "datadir",
		Usage: "Data directory for the databases and keystore",
		Value: DirectoryString(node.DefaultDataDir()),
	}
	RaftLogDirFlag = DirectoryFlag{
		Name:  "raftlogdir",
		Usage: "Raft log directory for the raft-state, raft-snap and raft-wal folders",
		Value: DirectoryString(node.DefaultDataDir()),
	}
	AncientFlag = DirectoryFlag{
		Name:  "datadir.ancient",
		Usage: "Data directory for ancient chain segments (default = inside chaindata)",
	}
	KeyStoreDirFlag = DirectoryFlag{
		Name:  "keystore",
		Usage: "Directory for the keystore (default = inside the datadir)",
	}
	NoUSBFlag = cli.BoolFlag{
		Name:  "nousb",
		Usage: "Disables monitoring for and managing USB hardware wallets",
	}
	SmartCardDaemonPathFlag = cli.StringFlag{
		Name:  "pcscdpath",
		Usage: "Path to the smartcard daemon (pcscd) socket file",
		Value: pcsclite.PCSCDSockName,
	}
	NetworkIdFlag = cli.Uint64Flag{
		Name:  "networkid",
		Usage: "Explicitly set network id (integer)(For testnets: use --ropsten, --rinkeby, --goerli instead)",
		Value: eth.DefaultConfig.NetworkId,
	}
	GoerliFlag = cli.BoolFlag{
		Name:  "goerli",
		Usage: "Görli network: pre-configured proof-of-authority test network",
	}
	YoloV2Flag = cli.BoolFlag{
		Name:  "yolov2",
		Usage: "YOLOv2 network: pre-configured proof-of-authority shortlived test network.",
	}
	RinkebyFlag = cli.BoolFlag{
		Name:  "rinkeby",
		Usage: "Rinkeby network: pre-configured proof-of-authority test network",
	}
	RopstenFlag = cli.BoolFlag{
		Name:  "ropsten",
		Usage: "Ropsten network: pre-configured proof-of-work test network",
	}
	DeveloperFlag = cli.BoolFlag{
		Name:  "dev",
		Usage: "Ephemeral proof-of-authority network with a pre-funded developer account, mining enabled",
	}
	DeveloperPeriodFlag = cli.IntFlag{
		Name:  "dev.period",
		Usage: "Block period to use in developer mode (0 = mine only if transaction pending)",
	}
	IdentityFlag = cli.StringFlag{
		Name:  "identity",
		Usage: "Custom node name",
	}
	DocRootFlag = DirectoryFlag{
		Name:  "docroot",
		Usage: "Document Root for HTTPClient file scheme",
		Value: DirectoryString(HomeDir()),
	}
	ExitWhenSyncedFlag = cli.BoolFlag{
		Name:  "exitwhensynced",
		Usage: "Exits after block synchronisation completes",
	}
	IterativeOutputFlag = cli.BoolFlag{
		Name:  "iterative",
		Usage: "Print streaming JSON iteratively, delimited by newlines",
	}
	ExcludeStorageFlag = cli.BoolFlag{
		Name:  "nostorage",
		Usage: "Exclude storage entries (save db lookups)",
	}
	IncludeIncompletesFlag = cli.BoolFlag{
		Name:  "incompletes",
		Usage: "Include accounts for which we don't have the address (missing preimage)",
	}
	ExcludeCodeFlag = cli.BoolFlag{
		Name:  "nocode",
		Usage: "Exclude contract code (save db lookups)",
	}
	defaultSyncMode = eth.DefaultConfig.SyncMode
	SyncModeFlag    = TextMarshalerFlag{
		Name:  "syncmode",
		Usage: `Blockchain sync mode ("fast", "full", or "light")`,
		Value: &defaultSyncMode,
	}
	GCModeFlag = cli.StringFlag{
		Name:  "gcmode",
		Usage: `Blockchain garbage collection mode ("full", "archive")`,
		Value: "full",
	}
	SnapshotFlag = cli.BoolFlag{
		Name:  "snapshot",
		Usage: `Enables snapshot-database mode -- experimental work in progress feature`,
	}
	TxLookupLimitFlag = cli.Int64Flag{
		Name:  "txlookuplimit",
		Usage: "Number of recent blocks to maintain transactions index by-hash for (default = index all blocks)",
		Value: 0,
	}
	LightKDFFlag = cli.BoolFlag{
		Name:  "lightkdf",
		Usage: "Reduce key-derivation RAM & CPU usage at some expense of KDF strength",
	}
	DeprecatedAuthorizationListFlag = cli.StringFlag{
		Name:  "whitelist",
		Usage: "[DEPRECATED: will be replaced by 'authorizationlist'] Comma separated block number-to-hash mappings to authorize (<number>=<hash>)",
	}
	AuthorizationListFlag = cli.StringFlag{
		Name:  "authorizationlist",
		Usage: "Comma separated block number-to-hash mappings to authorize (<number>=<hash>)",
	}
```

## Light server and client settings

```go

    // Light server and client settings
	LightServeFlag = cli.IntFlag{
		Name:  "light.serve",
		Usage: "Maximum percentage of time allowed for serving LES requests (multi-threaded processing allows values over 100)",
		Value: eth.DefaultConfig.LightServ,
	}
	LightIngressFlag = cli.IntFlag{
		Name:  "light.ingress",
		Usage: "Incoming bandwidth limit for serving light clients (kilobytes/sec, 0 = unlimited)",
		Value: eth.DefaultConfig.LightIngress,
	}
	LightEgressFlag = cli.IntFlag{
		Name:  "light.egress",
		Usage: "Outgoing bandwidth limit for serving light clients (kilobytes/sec, 0 = unlimited)",
		Value: eth.DefaultConfig.LightEgress,
	}
	LightMaxPeersFlag = cli.IntFlag{
		Name:  "light.maxpeers",
		Usage: "Maximum number of light clients to serve, or light servers to attach to",
		Value: eth.DefaultConfig.LightPeers,
	}
	UltraLightServersFlag = cli.StringFlag{
		Name:  "ulc.servers",
		Usage: "List of trusted ultra-light servers",
		Value: strings.Join(eth.DefaultConfig.UltraLightServers, ","),
	}
	UltraLightFractionFlag = cli.IntFlag{
		Name:  "ulc.fraction",
		Usage: "Minimum % of trusted ultra-light servers required to announce a new head",
		Value: eth.DefaultConfig.UltraLightFraction,
	}
	UltraLightOnlyAnnounceFlag = cli.BoolFlag{
		Name:  "ulc.onlyannounce",
		Usage: "Ultra light server sends announcements only",
	}
	LightNoPruneFlag = cli.BoolFlag{
		Name:  "light.nopruning",
		Usage: "Disable ancient light chain data pruning",
	}
```

## Ethash settings

```go
	// Ethash settings
	EthashCacheDirFlag = DirectoryFlag{
		Name:  "ethash.cachedir",
		Usage: "Directory to store the ethash verification caches (default = inside the datadir)",
	}
	EthashCachesInMemoryFlag = cli.IntFlag{
		Name:  "ethash.cachesinmem",
		Usage: "Number of recent ethash caches to keep in memory (16MB each)",
		Value: eth.DefaultConfig.Ethash.CachesInMem,
	}
	EthashCachesOnDiskFlag = cli.IntFlag{
		Name:  "ethash.cachesondisk",
		Usage: "Number of recent ethash caches to keep on disk (16MB each)",
		Value: eth.DefaultConfig.Ethash.CachesOnDisk,
	}
	EthashCachesLockMmapFlag = cli.BoolFlag{
		Name:  "ethash.cacheslockmmap",
		Usage: "Lock memory maps of recent ethash caches",
	}
	EthashDatasetDirFlag = DirectoryFlag{
		Name:  "ethash.dagdir",
		Usage: "Directory to store the ethash mining DAGs",
		Value: DirectoryString(eth.DefaultConfig.Ethash.DatasetDir),
	}
	EthashDatasetsInMemoryFlag = cli.IntFlag{
		Name:  "ethash.dagsinmem",
		Usage: "Number of recent ethash mining DAGs to keep in memory (1+GB each)",
		Value: eth.DefaultConfig.Ethash.DatasetsInMem,
	}
	EthashDatasetsOnDiskFlag = cli.IntFlag{
		Name:  "ethash.dagsondisk",
		Usage: "Number of recent ethash mining DAGs to keep on disk (1+GB each)",
		Value: eth.DefaultConfig.Ethash.DatasetsOnDisk,
	}
	EthashDatasetsLockMmapFlag = cli.BoolFlag{
		Name:  "ethash.dagslockmmap",
		Usage: "Lock memory maps for recent ethash mining DAGs",
	}
```

## Transaction pool settings

```go
	// Transaction pool settings
	TxPoolLocalsFlag = cli.StringFlag{
		Name:  "txpool.locals",
		Usage: "Comma separated accounts to treat as locals (no flush, priority inclusion)",
	}
	TxPoolNoLocalsFlag = cli.BoolFlag{
		Name:  "txpool.nolocals",
		Usage: "Disables price exemptions for locally submitted transactions",
	}
	TxPoolJournalFlag = cli.StringFlag{
		Name:  "txpool.journal",
		Usage: "Disk journal for local transaction to survive node restarts",
		Value: core.DefaultTxPoolConfig.Journal,
	}
	TxPoolRejournalFlag = cli.DurationFlag{
		Name:  "txpool.rejournal",
		Usage: "Time interval to regenerate the local transaction journal",
		Value: core.DefaultTxPoolConfig.Rejournal,
	}
	TxPoolPriceLimitFlag = cli.Uint64Flag{
		Name:  "txpool.pricelimit",
		Usage: "Minimum gas price limit to enforce for acceptance into the pool",
		Value: eth.DefaultConfig.TxPool.PriceLimit,
	}
	TxPoolPriceBumpFlag = cli.Uint64Flag{
		Name:  "txpool.pricebump",
		Usage: "Price bump percentage to replace an already existing transaction",
		Value: eth.DefaultConfig.TxPool.PriceBump,
	}
	TxPoolAccountSlotsFlag = cli.Uint64Flag{
		Name:  "txpool.accountslots",
		Usage: "Minimum number of executable transaction slots guaranteed per account",
		Value: eth.DefaultConfig.TxPool.AccountSlots,
	}
	TxPoolGlobalSlotsFlag = cli.Uint64Flag{
		Name:  "txpool.globalslots",
		Usage: "Maximum number of executable transaction slots for all accounts",
		Value: eth.DefaultConfig.TxPool.GlobalSlots,
	}
	TxPoolAccountQueueFlag = cli.Uint64Flag{
		Name:  "txpool.accountqueue",
		Usage: "Maximum number of non-executable transaction slots permitted per account",
		Value: eth.DefaultConfig.TxPool.AccountQueue,
	}
	TxPoolGlobalQueueFlag = cli.Uint64Flag{
		Name:  "txpool.globalqueue",
		Usage: "Maximum number of non-executable transaction slots for all accounts",
		Value: eth.DefaultConfig.TxPool.GlobalQueue,
	}
	TxPoolLifetimeFlag = cli.DurationFlag{
		Name:  "txpool.lifetime",
		Usage: "Maximum amount of time non-executable transaction are queued",
		Value: eth.DefaultConfig.TxPool.Lifetime,
	}
```

## Performance tuning settings

```go
	// Performance tuning settings
	CacheFlag = cli.IntFlag{
		Name:  "cache",
		Usage: "Megabytes of memory allocated to internal caching (default = 4096 mainnet full node, 128 light mode)",
		Value: 1024,
	}
	CacheDatabaseFlag = cli.IntFlag{
		Name:  "cache.database",
		Usage: "Percentage of cache memory allowance to use for database io",
		Value: 50,
	}
	CacheTrieFlag = cli.IntFlag{
		Name:  "cache.trie",
		Usage: "Percentage of cache memory allowance to use for trie caching (default = 15% full mode, 30% archive mode)",
		Value: 15,
	}
	CacheTrieJournalFlag = cli.StringFlag{
		Name:  "cache.trie.journal",
		Usage: "Disk journal directory for trie cache to survive node restarts",
		Value: eth.DefaultConfig.TrieCleanCacheJournal,
	}
	CacheTrieRejournalFlag = cli.DurationFlag{
		Name:  "cache.trie.rejournal",
		Usage: "Time interval to regenerate the trie cache journal",
		Value: eth.DefaultConfig.TrieCleanCacheRejournal,
	}
	CacheGCFlag = cli.IntFlag{
		Name:  "cache.gc",
		Usage: "Percentage of cache memory allowance to use for trie pruning (default = 25% full mode, 0% archive mode)",
		Value: 25,
	}
	CacheSnapshotFlag = cli.IntFlag{
		Name:  "cache.snapshot",
		Usage: "Percentage of cache memory allowance to use for snapshot caching (default = 10% full mode, 20% archive mode)",
		Value: 10,
	}
	CacheNoPrefetchFlag = cli.BoolFlag{
		Name:  "cache.noprefetch",
		Usage: "Disable heuristic state prefetch during block import (less CPU and disk IO, more time waiting for data)",
	}
	CachePreimagesFlag = cli.BoolTFlag{
		Name:  "cache.preimages",
		Usage: "Enable recording the SHA3/keccak preimages of trie keys (default: true)",
	}
```

## Miner settings

```go
	// Miner settings
	MiningEnabledFlag = cli.BoolFlag{
		Name:  "mine",
		Usage: "Enable mining",
	}
	MinerThreadsFlag = cli.IntFlag{
		Name:  "miner.threads",
		Usage: "Number of CPU threads to use for mining",
		Value: 0,
	}
	MinerNotifyFlag = cli.StringFlag{
		Name:  "miner.notify",
		Usage: "Comma separated HTTP URL list to notify of new work packages",
	}
	MinerGasTargetFlag = cli.Uint64Flag{
		Name:  "miner.gastarget",
		Usage: "Target gas floor for mined blocks",
		Value: eth.DefaultConfig.Miner.GasFloor,
	}
	MinerGasLimitFlag = cli.Uint64Flag{
		Name:  "miner.gaslimit",
		Usage: "Target gas ceiling for mined blocks",
		Value: eth.DefaultConfig.Miner.GasCeil,
	}
	MinerGasPriceFlag = BigFlag{
		Name:  "miner.gasprice",
		Usage: "Minimum gas price for mining a transaction",
		Value: eth.DefaultConfig.Miner.GasPrice,
	}
	MinerEtherbaseFlag = cli.StringFlag{
		Name:  "miner.etherbase",
		Usage: "Public address for block mining rewards (default = first account)",
		Value: "0",
	}
	MinerExtraDataFlag = cli.StringFlag{
		Name:  "miner.extradata",
		Usage: "Block extra data set by the miner (default = client version)",
	}
	MinerRecommitIntervalFlag = cli.DurationFlag{
		Name:  "miner.recommit",
		Usage: "Time interval to recreate the block being mined",
		Value: eth.DefaultConfig.Miner.Recommit,
	}
	MinerNoVerfiyFlag = cli.BoolFlag{
		Name:  "miner.noverify",
		Usage: "Disable remote sealing verification",
	}
```

## Account settings

```go
	// Account settings
	UnlockedAccountFlag = cli.StringFlag{
		Name:  "unlock",
		Usage: "Comma separated list of accounts to unlock",
		Value: "",
	}
	PasswordFileFlag = cli.StringFlag{
		Name:  "password",
		Usage: "Password file to use for non-interactive password input",
		Value: "",
	}
	ExternalSignerFlag = cli.StringFlag{
		Name:  "signer",
		Usage: "External signer (url or path to ipc file)",
		Value: "",
	}
	VMEnableDebugFlag = cli.BoolFlag{
		Name:  "vmdebug",
		Usage: "Record information useful for VM and contract debugging",
	}
	InsecureUnlockAllowedFlag = cli.BoolFlag{
		Name:  "allow-insecure-unlock",
		Usage: "Allow insecure account unlocking when account-related RPCs are exposed by http",
	}
	RPCGlobalGasCapFlag = cli.Uint64Flag{
		Name:  "rpc.gascap",
		Usage: "Sets a cap on gas that can be used in eth_call/estimateGas (0=infinite)",
		Value: eth.DefaultConfig.RPCGasCap,
	}
	RPCGlobalTxFeeCapFlag = cli.Float64Flag{
		Name:  "rpc.txfeecap",
		Usage: "Sets a cap on transaction fee (in ether) that can be sent via the RPC APIs (0 = no cap)",
		Value: eth.DefaultConfig.RPCTxFeeCap,
	}
```

## Logging and debug settings

```go
	// Logging and debug settings
	EthStatsURLFlag = cli.StringFlag{
		Name:  "ethstats",
		Usage: "Reporting URL of a ethstats service (nodename:secret@host:port)",
	}
	FakePoWFlag = cli.BoolFlag{
		Name:  "fakepow",
		Usage: "Disables proof-of-work verification",
	}
	NoCompactionFlag = cli.BoolFlag{
		Name:  "nocompaction",
		Usage: "Disables db compaction after import",
	}
```

## RPC Client Settings

```go
	// RPC Client Settings
	RPCClientToken = cli.StringFlag{
		Name:  "rpcclitoken",
		Usage: "RPC Client access token",
	}
	RPCClientTLSCert = cli.StringFlag{
		Name:  "rpcclitls.cert",
		Usage: "Server's TLS certificate PEM file on connection by client",
	}
	RPCClientTLSCaCert = cli.StringFlag{
		Name:  "rpcclitls.cacert",
		Usage: "CA certificate PEM file for provided server's TLS certificate on connection by client",
	}
	RPCClientTLSCipherSuites = cli.StringFlag{
		Name:  "rpcclitls.ciphersuites",
		Usage: "Customize supported cipher suites when using TLS connection. Value is a comma-separated cipher suite string",
	}
	RPCClientTLSInsecureSkipVerify = cli.BoolFlag{
		Name:  "rpcclitls.insecureskipverify",
		Usage: "Disable verification of server's TLS certificate on connection by client",
	}
```

## RPC settings

```go
	// RPC settings
	IPCDisabledFlag = cli.BoolFlag{
		Name:  "ipcdisable",
		Usage: "Disable the IPC-RPC server",
	}
	IPCPathFlag = DirectoryFlag{
		Name:  "ipcpath",
		Usage: "Filename for IPC socket/pipe within the datadir (explicit paths escape it)",
	}
	HTTPEnabledFlag = cli.BoolFlag{
		Name:  "http",
		Usage: "Enable the HTTP-RPC server",
	}
	HTTPListenAddrFlag = cli.StringFlag{
		Name:  "http.addr",
		Usage: "HTTP-RPC server listening interface",
		Value: node.DefaultHTTPHost,
	}
	HTTPPortFlag = cli.IntFlag{
		Name:  "http.port",
		Usage: "HTTP-RPC server listening port",
		Value: node.DefaultHTTPPort,
	}
	HTTPCORSDomainFlag = cli.StringFlag{
		Name:  "http.corsdomain",
		Usage: "Comma separated list of domains from which to accept cross origin requests (browser enforced)",
		Value: "",
	}
	HTTPVirtualHostsFlag = cli.StringFlag{
		Name:  "http.vhosts",
		Usage: "Comma separated list of virtual hostnames from which to accept requests (server enforced). Accepts '*' wildcard.",
		Value: strings.Join(node.DefaultConfig.HTTPVirtualHosts, ","),
	}
	HTTPApiFlag = cli.StringFlag{
		Name:  "http.api",
		Usage: "API's offered over the HTTP-RPC interface",
		Value: "",
	}
	GraphQLEnabledFlag = cli.BoolFlag{
		Name:  "graphql",
		Usage: "Enable GraphQL on the HTTP-RPC server. Note that GraphQL can only be started if an HTTP server is started as well.",
	}
	GraphQLCORSDomainFlag = cli.StringFlag{
		Name:  "graphql.corsdomain",
		Usage: "Comma separated list of domains from which to accept cross origin requests (browser enforced)",
		Value: "",
	}
	GraphQLVirtualHostsFlag = cli.StringFlag{
		Name:  "graphql.vhosts",
		Usage: "Comma separated list of virtual hostnames from which to accept requests (server enforced). Accepts '*' wildcard.",
		Value: strings.Join(node.DefaultConfig.GraphQLVirtualHosts, ","),
	}
	WSEnabledFlag = cli.BoolFlag{
		Name:  "ws",
		Usage: "Enable the WS-RPC server",
	}
	WSListenAddrFlag = cli.StringFlag{
		Name:  "ws.addr",
		Usage: "WS-RPC server listening interface",
		Value: node.DefaultWSHost,
	}
	WSPortFlag = cli.IntFlag{
		Name:  "ws.port",
		Usage: "WS-RPC server listening port",
		Value: node.DefaultWSPort,
	}
	WSApiFlag = cli.StringFlag{
		Name:  "ws.api",
		Usage: "API's offered over the WS-RPC interface",
		Value: "",
	}
	WSAllowedOriginsFlag = cli.StringFlag{
		Name:  "ws.origins",
		Usage: "Origins from which to accept websockets requests",
		Value: "",
	}
	ExecFlag = cli.StringFlag{
		Name:  "exec",
		Usage: "Execute JavaScript statement",
	}
	PreloadJSFlag = cli.StringFlag{
		Name:  "preload",
		Usage: "Comma separated list of JavaScript files to preload into the console",
	}
```

## Network Settings

```go
	// Network Settings
	MaxPeersFlag = cli.IntFlag{
		Name:  "maxpeers",
		Usage: "Maximum number of network peers (network disabled if set to 0)",
		Value: node.DefaultConfig.P2P.MaxPeers,
	}
	MaxPendingPeersFlag = cli.IntFlag{
		Name:  "maxpendpeers",
		Usage: "Maximum number of pending connection attempts (defaults used if set to 0)",
		Value: node.DefaultConfig.P2P.MaxPendingPeers,
	}
	ListenPortFlag = cli.IntFlag{
		Name:  "port",
		Usage: "Network listening port",
		Value: 30303,
	}
	BootnodesFlag = cli.StringFlag{
		Name:  "bootnodes",
		Usage: "Comma separated enode URLs for P2P discovery bootstrap",
		Value: "",
	}
	NodeKeyFileFlag = cli.StringFlag{
		Name:  "nodekey",
		Usage: "P2P node key file",
	}
	NodeKeyHexFlag = cli.StringFlag{
		Name:  "nodekeyhex",
		Usage: "P2P node key as hex (for testing)",
	}
	NATFlag = cli.StringFlag{
		Name:  "nat",
		Usage: "NAT port mapping mechanism (any|none|upnp|pmp|extip:<IP>)",
		Value: "any",
	}
	NoDiscoverFlag = cli.BoolFlag{
		Name:  "nodiscover",
		Usage: "Disables the peer discovery mechanism (manual peer addition)",
	}
	DiscoveryV5Flag = cli.BoolFlag{
		Name:  "v5disc",
		Usage: "Enables the experimental RLPx V5 (Topic Discovery) mechanism",
	}
	NetrestrictFlag = cli.StringFlag{
		Name:  "netrestrict",
		Usage: "Restricts network communication to the given IP networks (CIDR masks)",
	}
	DNSDiscoveryFlag = cli.StringFlag{
		Name:  "discovery.dns",
		Usage: "Sets DNS discovery entry points (use \"\" to disable DNS)",
	}
```

## ATM the url is left to the user and deployment to

```go
	// ATM the url is left to the user and deployment to
	JSpathFlag = cli.StringFlag{
		Name:  "jspath",
		Usage: "JavaScript root path for `loadScript`",
		Value: ".",
	}
```

## Gas price oracle settings

```go
	// Gas price oracle settings
	GpoBlocksFlag = cli.IntFlag{
		Name:  "gpo.blocks",
		Usage: "Number of recent blocks to check for gas prices",
		Value: eth.DefaultConfig.GPO.Blocks,
	}
	GpoPercentileFlag = cli.IntFlag{
		Name:  "gpo.percentile",
		Usage: "Suggested gas price is the given percentile of a set of recent transaction gas prices",
		Value: eth.DefaultConfig.GPO.Percentile,
	}
	GpoMaxGasPriceFlag = cli.Int64Flag{
		Name:  "gpo.maxprice",
		Usage: "Maximum gas price will be recommended by gpo",
		Value: eth.DefaultConfig.GPO.MaxPrice.Int64(),
	}
```

## Whisper settings

```go
	WhisperEnabledFlag = cli.BoolFlag{
		Name:  "shh",
		Usage: "Enable Whisper",
	}
	WhisperMaxMessageSizeFlag = cli.IntFlag{
		Name:  "shh.maxmessagesize",
		Usage: "Max message size accepted",
		Value: 1024 * 1024,
	}
	WhisperMinPOWFlag = cli.Float64Flag{
		Name:  "shh.pow",
		Usage: "Minimum POW accepted",
		Value: 0.2,
	}
	WhisperRestrictConnectionBetweenLightClientsFlag = cli.BoolFlag{
		Name:  "shh.restrict-light",
		Usage: "Restrict connection between two whisper light clients",
	}
```

## Metrics flags

```go
	// Metrics flags
	MetricsEnabledFlag = cli.BoolFlag{
		Name:  "metrics",
		Usage: "Enable metrics collection and reporting",
	}
	MetricsEnabledExpensiveFlag = cli.BoolFlag{
		Name:  "metrics.expensive",
		Usage: "Enable expensive metrics collection and reporting",
	}

	// MetricsHTTPFlag defines the endpoint for a stand-alone metrics HTTP endpoint.
	// Since the pprof service enables sensitive/vulnerable behavior, this allows a user
	// to enable a public-OK metrics endpoint without having to worry about ALSO exposing
	// other profiling behavior or information.
	MetricsHTTPFlag = cli.StringFlag{
		Name:  "metrics.addr",
		Usage: "Enable stand-alone metrics HTTP server listening interface",
		Value: "127.0.0.1",
	}
	MetricsPortFlag = cli.IntFlag{
		Name:  "metrics.port",
		Usage: "Metrics HTTP server listening port",
		Value: 6060,
	}
	MetricsEnableInfluxDBFlag = cli.BoolFlag{
		Name:  "metrics.influxdb",
		Usage: "Enable metrics export/push to an external InfluxDB database",
	}
	MetricsInfluxDBEndpointFlag = cli.StringFlag{
		Name:  "metrics.influxdb.endpoint",
		Usage: "InfluxDB API endpoint to report metrics to",
		Value: "http://localhost:8086",
	}
	MetricsInfluxDBDatabaseFlag = cli.StringFlag{
		Name:  "metrics.influxdb.database",
		Usage: "InfluxDB database name to push reported metrics to",
		Value: "geth",
	}
	MetricsInfluxDBUsernameFlag = cli.StringFlag{
		Name:  "metrics.influxdb.username",
		Usage: "Username to authorize access to the database",
		Value: "test",
	}
	MetricsInfluxDBPasswordFlag = cli.StringFlag{
		Name:  "metrics.influxdb.password",
		Usage: "Password to authorize access to the database",
		Value: "test",
	}
	// Tags are part of every measurement sent to InfluxDB. Queries on tags are faster in InfluxDB.
	// For example `host` tag could be used so that we can group all nodes and average a measurement
	// across all of them, but also so that we can select a specific node and inspect its measurements.
	// https://docs.influxdata.com/influxdb/v1.4/concepts/key_concepts/#tag-key
	MetricsInfluxDBTagsFlag = cli.StringFlag{
		Name:  "metrics.influxdb.tags",
		Usage: "Comma-separated InfluxDB tags (key/values) attached to all measurements",
		Value: "host=localhost",
	}
```

## EVM settings

```go
	EWASMInterpreterFlag = cli.StringFlag{
		Name:  "vm.ewasm",
		Usage: "External ewasm configuration (default = built-in interpreter)",
		Value: "",
	}
	EVMInterpreterFlag = cli.StringFlag{
		Name:  "vm.evm",
		Usage: "External EVM configuration (default = built-in interpreter)",
		Value: "",
	}

	// Quorum - added configurable call timeout for execution of calls
	EVMCallTimeOutFlag = cli.IntFlag{
		Name:  "vm.calltimeout",
		Usage: "Timeout duration in seconds for message call execution without creating a transaction. Value 0 means no timeout.",
		Value: 5,
	}

	// Quorum
	// immutability threshold which can be passed as a parameter at geth start
	QuorumImmutabilityThreshold = cli.IntFlag{
		Name:  "immutabilitythreshold",
		Usage: "overrides the default immutability threshold for Quorum nodes. Its the threshold beyond which block data will be moved to ancient db",
		Value: 3162240,
	}
```

## Raft flags

```go
	// Raft flags
	RaftModeFlag = cli.BoolFlag{
		Name:  "raft",
		Usage: "If enabled, uses Raft instead of Quorum Chain for consensus",
	}
	RaftBlockTimeFlag = cli.IntFlag{
		Name:  "raftblocktime",
		Usage: "Amount of time between raft block creations in milliseconds",
		Value: 50,
	}
	RaftJoinExistingFlag = cli.IntFlag{
		Name:  "raftjoinexisting",
		Usage: "The raft ID to assume when joining an pre-existing cluster",
		Value: 0,
	}

	EmitCheckpointsFlag = cli.BoolFlag{
		Name:  "emitcheckpoints",
		Usage: "If enabled, emit specially formatted logging checkpoints",
	}
	RaftPortFlag = cli.IntFlag{
		Name:  "raftport",
		Usage: "The port to bind for the raft transport",
		Value: 50400,
	}
	RaftDNSEnabledFlag = cli.BoolFlag{
		Name:  "raftdnsenable",
		Usage: "Enable DNS resolution of peers",
	}
```

## Permission

```go
	// Permission
	EnableNodePermissionFlag = cli.BoolFlag{
		Name:  "permissioned",
		Usage: "If enabled, the node will allow only a defined list of nodes to connect",
	}
	AllowedFutureBlockTimeFlag = cli.Uint64Flag{
		Name:  "allowedfutureblocktime",
		Usage: "Max time (in seconds) from current time allowed for blocks, before they're considered future blocks",
		Value: 0,
	}
```

## Plugins settings

```go
	// Plugins settings
	PluginSettingsFlag = cli.StringFlag{
		Name:  "plugins",
		Usage: "The URI of configuration which describes plugins being used. E.g.: file:///opt/geth/plugins.json",
	}
	PluginLocalVerifyFlag = cli.BoolFlag{
		Name:  "plugins.localverify",
		Usage: "If enabled, verify plugin integrity from local file system. This requires plugin signature file and PGP public key file to be available",
	}
	PluginPublicKeyFlag = cli.StringFlag{
		Name:  "plugins.publickey",
		Usage: fmt.Sprintf("The URI of PGP public key for local plugin verification. E.g.: file:///opt/geth/pubkey.pgp.asc. This flag is only valid if --%s is set (default = file:///<pluginBaseDir>/%s)", PluginLocalVerifyFlag.Name, plugin.DefaultPublicKeyFile),
	}
	PluginSkipVerifyFlag = cli.BoolFlag{
		Name:  "plugins.skipverify",
		Usage: "If enabled, plugin integrity is NOT verified",
	}
	// account plugin flags
	AccountPluginNewAccountConfigFlag = cli.StringFlag{
		Name:  "plugins.account.config",
		Usage: "Value will be passed to an account plugin if being used.  See the account plugin implementation's documentation for further details",
	}
```

## Istanbul settings

```go
	// Istanbul settings
	IstanbulRequestTimeoutFlag = cli.Uint64Flag{
		Name:  "istanbul.requesttimeout",
		Usage: "Timeout for each Istanbul round in milliseconds",
		Value: eth.DefaultConfig.Istanbul.RequestTimeout,
	}
	IstanbulBlockPeriodFlag = cli.Uint64Flag{
		Name:  "istanbul.blockperiod",
		Usage: "Default minimum difference between two consecutive block's timestamps in seconds",
		Value: eth.DefaultConfig.Istanbul.BlockPeriod,
	}
	// Multitenancy setting
	MultitenancyFlag = cli.BoolFlag{
		Name:  "multitenancy",
		Usage: "Enable multitenancy support for this node. This requires RPC Security Plugin to also be configured.",
	}

	// Revert Reason
	RevertReasonFlag = cli.BoolFlag{
		Name:  "revertreason",
		Usage: "Enable saving revert reason in the transaction receipts for this node.",
	}
```

## Private transactions

```go
	// Private state cache
	PrivateCacheTrieJournalFlag = cli.StringFlag{
		Name:  "private.cache.trie.journal",
		Usage: "Disk journal directory for private trie cache to survive node restarts",
		Value: eth.DefaultConfig.PrivateTrieCleanCacheJournal,
	}

	QuorumEnablePrivacyMarker = cli.BoolFlag{
		Name:  "privacymarker.enable",
		Usage: "Enable use of privacy marker transactions (PMT) for this node.",
	}

	// Quorum Private Transaction Manager connection options
	QuorumPTMUnixSocketFlag = DirectoryFlag{
		Name:  "ptm.socket",
		Usage: "Path to the ipc file when using unix domain socket for the private transaction manager connection",
	}
	QuorumPTMUrlFlag = cli.StringFlag{
		Name:  "ptm.url",
		Usage: "URL when using http connection to private transaction manager",
	}
	QuorumPTMTimeoutFlag = cli.UintFlag{
		Name:  "ptm.timeout",
		Usage: "Timeout (seconds) for the private transaction manager connection. Zero value means timeout disabled.",
		Value: http2.DefaultConfig.Timeout,
	}
	QuorumPTMDialTimeoutFlag = cli.UintFlag{
		Name:  "ptm.dialtimeout",
		Usage: "Dial timeout (seconds) for the private transaction manager connection. Zero value means timeout disabled.",
		Value: http2.DefaultConfig.DialTimeout,
	}
	QuorumPTMHttpIdleTimeoutFlag = cli.UintFlag{
		Name:  "ptm.http.idletimeout",
		Usage: "Idle timeout (seconds) for the private transaction manager connection. Zero value means timeout disabled.",
		Value: http2.DefaultConfig.HttpIdleConnTimeout,
	}
	QuorumPTMHttpWriteBufferSizeFlag = cli.IntFlag{
		Name:  "ptm.http.writebuffersize",
		Usage: "Size of the write buffer (bytes) for the private transaction manager connection. Zero value uses http.Transport default.",
		Value: 0,
	}
	QuorumPTMHttpReadBufferSizeFlag = cli.IntFlag{
		Name:  "ptm.http.readbuffersize",
		Usage: "Size of the read buffer (bytes) for the private transaction manager connection. Zero value uses http.Transport default.",
		Value: 0,
	}
	QuorumPTMTlsModeFlag = cli.StringFlag{
		Name:  "ptm.tls.mode",
		Usage: `If "off" then TLS disabled (default). If "strict" then will use TLS for http connection to private transaction manager`,
	}
	QuorumPTMTlsRootCaFlag = DirectoryFlag{
		Name:  "ptm.tls.rootca",
		Usage: "Path to file containing root CA certificate for TLS connection to private transaction manager (defaults to host's certificates)",
	}
	QuorumPTMTlsClientCertFlag = DirectoryFlag{
		Name:  "ptm.tls.clientcert",
		Usage: "Path to file containing client certificate (or chain of certs) for TLS connection to private transaction manager",
	}
	QuorumPTMTlsClientKeyFlag = DirectoryFlag{
		Name:  "ptm.tls.clientkey",
		Usage: "Path to file containing client's private key for TLS connection to private transaction manager",
	}
	QuorumPTMTlsInsecureSkipVerify = cli.BoolFlag{
		Name:  "ptm.tls.insecureskipverify",
		Usage: "Disable verification of server's TLS certificate on connection to private transaction manager",
	}
)

```