@echo off

:: workday: 7:40-8:30, 12:00-14:30, 17:35-01:00
:: weekend: 8:30-01:00
:: limit download speed: 360K, upload: 30K
curl http://127.0.0.1:6800/jsonrpc -H "Content-Type: application/json" -H "Accept: application/json" --data {\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"aria2.changeGlobalOption\",\"params\":[\"token:pp0816\",{\"max-overall-download-limit\":\"360K\",\"max-overall-upload-limit\":\"360K\"}]}
