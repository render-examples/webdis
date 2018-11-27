#!/usr/bin/env bash

tmp_dir=$(mktemp -d)
config_file=$tmp_dir/webdis.json

cat <<EOF > "$config_file"
  {
   "daemonize" : false,
   "database" : 0,
   "http_host" : "0.0.0.0",
   "verbosity" : 6,
   "logfile" : "/tmp/webdis.log",
   "redis_port" : ${REDIS_PORT:-6379},
   "redis_host" : "${REDIS_HOST:-localhost}",
   "http_port" : ${PORT:-7379},
   "redis_auth" : null,
   "websockets" : false,
   "threads" : 5,
   "pool_size" : 20,
   "acl" : [
      {
         "disabled" : [
            "DEBUG"
         ]
      },
      {
         "http_basic_auth" : "user:password",
         "enabled" : [
            "DEBUG"
         ]
      }
   ]
}
EOF

exec webdis "$config_file"
