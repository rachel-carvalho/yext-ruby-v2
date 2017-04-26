# YextClient::OptimizationTasksApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_link_optimization_task**](OptimizationTasksApi.md#get_link_optimization_task) | **GET** /accounts/{accountId}/optimizationlink | Optimization Tasks: Get Link
[**get_optimization_tasks**](OptimizationTasksApi.md#get_optimization_tasks) | **GET** /accounts/{accountId}/optimizationtasks | Optimization Tasks: List


# **get_link_optimization_task**
> OptimizationTaskLinksResponse get_link_optimization_task(account_id, v, opts)

Optimization Tasks: Get Link

Retrieve a link to perform any pending Optimization Tasks given a set of Optimization Tasks and a location

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

api_instance = YextClient::OptimizationTasksApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  task_ids: "task_ids_example", # String | Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  If no IDs are provided, defaults to all available Optimization Tasks in the account. 
  location_id: "location_id_example", # String | Location ID to be used as a filter.  If no ID is provided, defaults to all Locations in the account. 
  mode: "PENDING_ONLY" # String | When mode is `PENDING_ONLY`, the resulting link will only ask the user to complete tasks that are pending or in progress (that have not been completed before).  When mode is `ALL_TASKS`, the resulting link will show the user all specified tasks for all specified locations, regardless of their status. If a task has been completed, the user is given the option to update the content they entered when completing the task. 
}

begin
  #Optimization Tasks: Get Link
  result = api_instance.get_link_optimization_task(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling OptimizationTasksApi->get_link_optimization_task: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **task_ids** | **String**| Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  If no IDs are provided, defaults to all available Optimization Tasks in the account.  | [optional] 
 **location_id** | **String**| Location ID to be used as a filter.  If no ID is provided, defaults to all Locations in the account.  | [optional] 
 **mode** | **String**| When mode is &#x60;PENDING_ONLY&#x60;, the resulting link will only ask the user to complete tasks that are pending or in progress (that have not been completed before).  When mode is &#x60;ALL_TASKS&#x60;, the resulting link will show the user all specified tasks for all specified locations, regardless of their status. If a task has been completed, the user is given the option to update the content they entered when completing the task.  | [optional] [default to PENDING_ONLY]

### Return type

[**OptimizationTaskLinksResponse**](OptimizationTaskLinksResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_optimization_tasks**
> OptimizationTasksResponse get_optimization_tasks(account_id, v, opts)

Optimization Tasks: List

List Optimization Tasks for the account, optionally filtered by task and location.

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

api_instance = YextClient::OptimizationTasksApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  task_ids: "task_ids_example", # String | Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  If no IDs are provided, defaults to all available Optimization Tasks in the account. 
  location_ids: "location_ids_example" # String | Comma-separated list of Location IDs to be used as a filter.  If no IDs are provided, defaults to all Locations in the account. 
}

begin
  #Optimization Tasks: List
  result = api_instance.get_optimization_tasks(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling OptimizationTasksApi->get_optimization_tasks: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **task_ids** | **String**| Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  If no IDs are provided, defaults to all available Optimization Tasks in the account.  | [optional] 
 **location_ids** | **String**| Comma-separated list of Location IDs to be used as a filter.  If no IDs are provided, defaults to all Locations in the account.  | [optional] 

### Return type

[**OptimizationTasksResponse**](OptimizationTasksResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



