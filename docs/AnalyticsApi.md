# YextClient::AnalyticsApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activity_log**](AnalyticsApi.md#activity_log) | **GET** /accounts/{accountId}/analytics/activity | Activity Log
[**create_reports**](AnalyticsApi.md#create_reports) | **GET** /accounts/{accountId}/analytics/reports | Create Reports
[**get_max_dates**](AnalyticsApi.md#get_max_dates) | **GET** /accounts/{accountId}/analytics/maxdates | Max Dates
[**report_status**](AnalyticsApi.md#report_status) | **GET** /accounts/{accountId}/analytics/standardreports/{reportId} | Report Status


# **activity_log**
> InlineResponse200 activity_log(account_id, , opts)

Activity Log

Fetches account activity information.

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

api_instance = YextClient::AnalyticsApi.new

account_id = "account_id_example" # String | 

opts = { 
  body: YextClient::ActivityLogRequest.new # ActivityLogRequest | 
}

begin
  #Activity Log
  result = api_instance.activity_log(account_id, , opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->activity_log: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **body** | [**ActivityLogRequest**](ActivityLogRequest.md)|  | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_reports**
> InlineResponse2002 create_reports(account_id, , opts)

Create Reports

Begins the process of producing a report.

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

api_instance = YextClient::AnalyticsApi.new

account_id = "account_id_example" # String | 

opts = { 
  async: true, # BOOLEAN | Defaults to false.  When true, the report’s ID will be returned immediately and the report results can be fetched later.  When false, the report results will be returned immediately, but an error may occur if the data requested is too large
  callback: "callback_example", # String | Optional.  When async=true and callback is specified, the provided URL will be called when the report is ready.  The URL must of of the form:       POST https://[your domain]/[your path]  It must accept the following parameters:      id:     (int)     - The ID of the report that is ready      status: (string)  - one of [DONE, FAILED]      url:    (string)  - When status=DONE, contains the URL to download the report data as a text file. 
  body: YextClient::CreateReportRequestBody.new # CreateReportRequestBody | JSON object containing any filters to be applied to the report
}

begin
  #Create Reports
  result = api_instance.create_reports(account_id, , opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->create_reports: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **async** | **BOOLEAN**| Defaults to false.  When true, the report’s ID will be returned immediately and the report results can be fetched later.  When false, the report results will be returned immediately, but an error may occur if the data requested is too large | [optional] 
 **callback** | **String**| Optional.  When async&#x3D;true and callback is specified, the provided URL will be called when the report is ready.  The URL must of of the form:       POST https://[your domain]/[your path]  It must accept the following parameters:      id:     (int)     - The ID of the report that is ready      status: (string)  - one of [DONE, FAILED]      url:    (string)  - When status&#x3D;DONE, contains the URL to download the report data as a text file.  | [optional] 
 **body** | [**CreateReportRequestBody**](CreateReportRequestBody.md)| JSON object containing any filters to be applied to the report | [optional] 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_max_dates**
> InlineResponse2001 get_max_dates(account_id, )

Max Dates

The dates through which reporting data is available.

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

api_instance = YextClient::AnalyticsApi.new

account_id = "account_id_example" # String | 


begin
  #Max Dates
  result = api_instance.get_max_dates(account_id, )
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->get_max_dates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **report_status**
> InlineResponse2003 report_status(account_id, report_id)

Report Status

Checks the status of a Report created with async=true.

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

api_instance = YextClient::AnalyticsApi.new

account_id = "account_id_example" # String | 

report_id = 56 # Integer | 


begin
  #Report Status
  result = api_instance.report_status(account_id, report_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->report_status: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **report_id** | **Integer**|  | 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



