#!/bin/bash

@test "Send request from 'web' to the Stirling PDF api" {
    run ddev exec "curl -X 'GET' 'http://stirling-pdf:8080/api/v1/info/status' -H 'accept: */*'"

    [ "$status" -eq 0 ]
    [[ "$output" == *"\"status\":\"UP\"}"* ]]
}

@test "Send request to an endpoint that requires authentication" {
    apiKey="16131b6c-c7b0-468f-b35c-9bfd5a613d9d"
    run ddev exec "curl -X 'POST' 'http://stirling-pdf:8080/api/v1/security/get-info-on-pdf' -s -H 'X-API-KEY: ${apiKey}' -H 'accept: */*' -H 'Content-Type: multipart/form-data' -F 'fileInput=@tests/testdata/Test.pdf;type=application/pdf'"

    [ "$status" -eq 0 ]
    [[ "$(echo "$output" | yq ".Metadata.Producer")" == *"Acrobat Distiller 4.0 for Windows"* ]]
    [[ "$(echo "$output" | yq ".BasicInfo.FileSizeInBytes")" == *"80387"* ]]
}
