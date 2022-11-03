@echo off

:: workday: 8:31-11:59, 14:31-17:34, 01:01-7:39
:: weekend: 01:01-8:29
:: free download speed: 20M, upload: 2M
curl http://127.0.0.1:6800/jsonrpc -H "Content-Type: application/json" -H "Accept: application/json" --data {\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"aria2.changeGlobalOption\",\"params\":[\"token:pp0816\",{\"max-overall-download-limit\":\"20M\",\"max-overall-upload-limit\":\"2M\"}]}
