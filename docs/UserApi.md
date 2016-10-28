# YextClient::UserApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_user**](UserApi.md#create_user) | **POST** /accounts/{accountId}/users | Users: Create
[**delete_user**](UserApi.md#delete_user) | **DELETE** /accounts/{accountId}/users/{userId} | Users: Delete
[**get_link_optimization_task**](UserApi.md#get_link_optimization_task) | **GET** /accounts/{accountId}/optimizationlink | Optimization Tasks: Get Link
[**get_optimization_tasks**](UserApi.md#get_optimization_tasks) | **GET** /accounts/{accountId}/optimizationtasks | Optimization Tasks: List
[**get_roles**](UserApi.md#get_roles) | **GET** /accounts/{accountId}/roles | Roles: Get
[**get_user**](UserApi.md#get_user) | **GET** /accounts/{accountId}/users/{userId} | Users: Get
[**get_users**](UserApi.md#get_users) | **GET** /accounts/{accountId}/users | Users: List
[**update_user**](UserApi.md#update_user) | **PUT** /accounts/{accountId}/users/{userId} | Users: Update


# **create_user**
> InlineResponse2016 create_user(account_id, vuser_request)

Users: Create

Create a new User

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

user_request = YextClient::User.new # User | 


begin
  #Users: Create
  result = api_instance.create_user(account_id, vuser_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->create_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **user_request** | [**User**](User.md)|  | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_user**
> InlineResponse2016 delete_user(account_id, vuser_id, user_request)

Users: Delete

Deletes an existing User.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

user_id = "user_id_example" # String | 

user_request = YextClient::User.new # User | 


begin
  #Users: Delete
  result = api_instance.delete_user(account_id, vuser_id, user_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->delete_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **user_id** | **String**|  | 
 **user_request** | [**User**](User.md)|  | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_link_optimization_task**
> InlineResponse20015 get_link_optimization_task(account_id, vtask_ids, location_idsmode)

Optimization Tasks: Get Link

Retrieve a link to perform any pending Optimization Tasks given a set of Optimization Tasks and Locations.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

task_ids = "task_ids_example" # String | Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account. 

location_ids = "location_ids_example" # String | Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible & completed for each Optimization Task.  Defaults to all Locations in the account. 

mode = "PENDING_ONLY" # String | When mode is PENDING_ONLY, the resulting link will only ask the user to complete tasks that are pending or in progress (that have not been completed before).  When mode is ALL_TASKS, the resulting link will ask the user to complete all specified tasks for all specified locations, regardless of whether they have been completed before, are pending, or are in progress. 


begin
  #Optimization Tasks: Get Link
  result = api_instance.get_link_optimization_task(account_id, vtask_ids, location_idsmode)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_link_optimization_task: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **task_ids** | **String**| Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account.  | 
 **location_ids** | **String**| Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible &amp; completed for each Optimization Task.  Defaults to all Locations in the account.  | 
 **mode** | **String**| When mode is PENDING_ONLY, the resulting link will only ask the user to complete tasks that are pending or in progress (that have not been completed before).  When mode is ALL_TASKS, the resulting link will ask the user to complete all specified tasks for all specified locations, regardless of whether they have been completed before, are pending, or are in progress.  | [default to PENDING_ONLY]

### Return type

[**InlineResponse20015**](InlineResponse20015.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_optimization_tasks**
> InlineResponse20016 get_optimization_tasks(account_id, vtask_ids, location_ids)

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

task_ids = "task_ids_example" # String | Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account. 

location_ids = "location_ids_example" # String | Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible & completed for each Optimization Task.  Defaults to all Locations in the account. 


begin
  #Optimization Tasks: List
  result = api_instance.get_optimization_tasks(account_id, vtask_ids, location_ids)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_optimization_tasks: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **task_ids** | **String**| Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account.  | 
 **location_ids** | **String**| Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible &amp; completed for each Optimization Task.  Defaults to all Locations in the account.  | 

### Return type

[**InlineResponse20016**](InlineResponse20016.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_roles**
> InlineResponse20028 get_roles(account_id, v)

Roles: Get

Retrieves a list of the roles that users can have within a customer’s account.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Roles: Get
  result = api_instance.get_roles(account_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_roles: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse20028**](InlineResponse20028.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_user**
> InlineResponse2016 get_user(account_id, vuser_id, )

Users: Get

Retrieves details of a specific User.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

user_id = "user_id_example" # String | 


begin
  #Users: Get
  result = api_instance.get_user(account_id, vuser_id, )
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **user_id** | **String**|  | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_users**
> InlineResponse20029 get_users(account_id, v, opts)

Users: List

Lists all Users in an account.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results
}

begin
  #Users: List
  result = api_instance.get_users(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_users: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **limit** | **Integer**| Number of results to return | [optional] [default to 10]
 **offset** | **Integer**| Number of results to skip. Used to page through results | [optional] [default to 0]

### Return type

[**InlineResponse20029**](InlineResponse20029.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_user**
> InlineResponse2016 update_user(account_id, vuser_id, user_request)

Users: Update

Updates an existing User.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

user_id = "user_id_example" # String | 

user_request = YextClient::User.new # User | 


begin
  #Users: Update
  result = api_instance.update_user(account_id, vuser_id, user_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->update_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **user_id** | **String**|  | 
 **user_request** | [**User**](User.md)|  | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



