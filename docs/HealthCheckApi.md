# YextClient::HealthCheckApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**health_check**](HealthCheckApi.md#health_check) | **GET** /healthy | Health Check


# **health_check**
> String health_check

Health Check

The Health Check endpoint allows you to monitor the status of Yext's systems.  A response with a status code other than 200 OK indicates that our systems are not operational.  The body of the response may contain information about the status. However, no part of your Yext integration should depend on the content of the response.  **NOTE:** This call does not require authentication. 

### Example
```ruby
# load the gem
require 'yext-client'
# setup authorization
YextClient.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['api_key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['api_key'] = 'Bearer'
end

api_instance = YextClient::HealthCheckApi.new

begin
  #Health Check
  result = api_instance.health_check
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling HealthCheckApi->health_check: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



