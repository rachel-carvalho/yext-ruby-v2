# YextClient::AnalyticsApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activity_log**](AnalyticsApi.md#activity_log) | **POST** /accounts/{accountId}/analytics/activity | Activity Log
[**create_reports**](AnalyticsApi.md#create_reports) | **POST** /accounts/{accountId}/analytics/reports | Create Reports
[**get_max_dates**](AnalyticsApi.md#get_max_dates) | **GET** /accounts/{accountId}/analytics/maxdates | Max Dates
[**report_status**](AnalyticsApi.md#report_status) | **GET** /accounts/{accountId}/analytics/standardreports/{reportId} | Report Status


# **activity_log**
> ActivitiesResponse activity_log(account_id, v, opts)

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

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  body: YextClient::ActivityLogRequest.new # ActivityLogRequest | 
}

begin
  #Activity Log
  result = api_instance.activity_log(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->activity_log: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**ActivityLogRequest**](ActivityLogRequest.md)|  | [optional] 

### Return type

[**ActivitiesResponse**](ActivitiesResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_reports**
> CreateReportsResponse create_reports(account_id, v, opts)

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

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  async: true, # BOOLEAN | Defaults to false.  When true, the report’s ID will be returned immediately and the report results can be fetched later.  When false, the report results will be returned immediately, but an error may occur if the data requested is too large.
  callback: "callback_example", # String | Optional.  When async=true and callback is specified, the provided URL will be called when the report is ready.  The URL must be of the form:       POST https://[your domain]/[your path]  It must accept the following parameters:      id:     (int)     - The ID of the report that is ready      status: (string)  - one of [DONE, FAILED]      url:    (string)  - When status=DONE, contains the URL to download the report data as a text file. 
  body: YextClient::CreateReportRequestBody.new # CreateReportRequestBody | JSON object containing any filters to be applied to the report
}

begin
  #Create Reports
  result = api_instance.create_reports(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->create_reports: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **async** | **BOOLEAN**| Defaults to false.  When true, the report’s ID will be returned immediately and the report results can be fetched later.  When false, the report results will be returned immediately, but an error may occur if the data requested is too large. | [optional] 
 **callback** | **String**| Optional.  When async&#x3D;true and callback is specified, the provided URL will be called when the report is ready.  The URL must be of the form:       POST https://[your domain]/[your path]  It must accept the following parameters:      id:     (int)     - The ID of the report that is ready      status: (string)  - one of [DONE, FAILED]      url:    (string)  - When status&#x3D;DONE, contains the URL to download the report data as a text file.  | [optional] 
 **body** | [**CreateReportRequestBody**](CreateReportRequestBody.md)| JSON object containing any filters to be applied to the report | [optional] 

### Return type

[**CreateReportsResponse**](CreateReportsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_max_dates**
> MaximumDatesResponse get_max_dates(account_id, v)

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

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Max Dates
  result = api_instance.get_max_dates(account_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->get_max_dates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**MaximumDatesResponse**](MaximumDatesResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **report_status**
> ReportStatusResponse report_status(account_id, vreport_id)

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

v = "20161012" # String | A date in `YYYYMMDD` format.

report_id = 56 # Integer | 


begin
  #Report Status
  result = api_instance.report_status(account_id, vreport_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling AnalyticsApi->report_status: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **report_id** | **Integer**|  | 

### Return type

[**ReportStatusResponse**](ReportStatusResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



