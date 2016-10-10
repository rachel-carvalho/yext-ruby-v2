# YextClient::ListingsApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_publisher_suggestion**](ListingsApi.md#get_publisher_suggestion) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Get
[**list_listings**](ListingsApi.md#list_listings) | **GET** /accounts/{accountId}/powerlistings/listings | Listings: List
[**list_publisher_suggestions**](ListingsApi.md#list_publisher_suggestions) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions | Publisher Suggestions: List
[**list_publishers**](ListingsApi.md#list_publishers) | **GET** /accounts/{accountId}/powerlistings/publishers | Publishers: List
[**opt_in_listings**](ListingsApi.md#opt_in_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optin | Listings: Opt In
[**opt_out_listings**](ListingsApi.md#opt_out_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optout | Listings: Opt Out
[**update_publisher_suggestion**](ListingsApi.md#update_publisher_suggestion) | **PUT** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Update


# **get_publisher_suggestion**
> InlineResponse2006 get_publisher_suggestion(account_id, vsuggestion_id, )

Publisher Suggestions: Get

Fetches details of a specific Publisher Suggestion

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

api_instance = YextClient::ListingsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

suggestion_id = "suggestion_id_example" # String | 


begin
  #Publisher Suggestions: Get
  result = api_instance.get_publisher_suggestion(account_id, vsuggestion_id, )
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ListingsApi->get_publisher_suggestion: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **suggestion_id** | **String**|  | 

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_listings**
> InlineResponse2003 list_listings(account_id, v, opts)

Listings: List

Retrieve all Listings matching the given criteria including status and reasons why a Listing may be unavailable

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

api_instance = YextClient::ListingsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 20, # Integer | Number of results to return
  offset: "0", # String | Number of results to skip. Used to page through results
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
}

begin
  #Listings: List
  result = api_instance.list_listings(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ListingsApi->list_listings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **limit** | **Integer**| Number of results to return | [optional] [default to 20]
 **offset** | **String**| Number of results to skip. Used to page through results | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP  | [optional] 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_publisher_suggestions**
> InlineResponse2005 list_publisher_suggestions(account_id, v, opts)

Publisher Suggestions: List

Retrieve suggestions publishers have submitted for the Locations in an account

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

api_instance = YextClient::ListingsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: "0", # String | Number of results to skip. Used to page through results
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
  statuses: ["statuses_example"] # Array<String> | When specified, only Publisher Suggestions with the provided statuses will be returned  **Example:** PENDING,EXPIRED 
}

begin
  #Publisher Suggestions: List
  result = api_instance.list_publisher_suggestions(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ListingsApi->list_publisher_suggestions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **limit** | **Integer**| Number of results to return | [optional] [default to 10]
 **offset** | **String**| Number of results to skip. Used to page through results | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP  | [optional] 
 **statuses** | [**Array&lt;String&gt;**](String.md)| When specified, only Publisher Suggestions with the provided statuses will be returned  **Example:** PENDING,EXPIRED  | [optional] 

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_publishers**
> InlineResponse2004 list_publishers(account_id, v, opts)

Publishers: List

Retrieve list of Publishers

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

api_instance = YextClient::ListingsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  subset: "RELEVANT_ONLY" # String | **ALL** - return all publishers  **RELEVANT_ONLY** - only return publishers relevant to the account based on supported countries and location types 
}

begin
  #Publishers: List
  result = api_instance.list_publishers(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ListingsApi->list_publishers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **subset** | **String**| **ALL** - return all publishers  **RELEVANT_ONLY** - only return publishers relevant to the account based on supported countries and location types  | [optional] [default to RELEVANT_ONLY]

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **opt_in_listings**
> InlineResponseDefault opt_in_listings(account_id, v, opts)

Listings: Opt In

Opts designated locations into designated publishers **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you get a 400 error.

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

api_instance = YextClient::ListingsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
}

begin
  #Listings: Opt In
  result = api_instance.opt_in_listings(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ListingsApi->opt_in_listings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP  | [optional] 

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **opt_out_listings**
> InlineResponseDefault opt_out_listings(account_id, v, opts)

Listings: Opt Out

Opts designated locations out of designated publishers  **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you get a 400 error. 

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

api_instance = YextClient::ListingsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
}

begin
  #Listings: Opt Out
  result = api_instance.opt_out_listings(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ListingsApi->opt_out_listings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP  | [optional] 

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_publisher_suggestion**
> InlineResponseDefault update_publisher_suggestion(account_id, vsuggestion_id, status)

Publisher Suggestions: Update

Accept or reject a Publisher Suggestion

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

api_instance = YextClient::ListingsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

suggestion_id = "suggestion_id_example" # String | 

status = "status_example" # String | The status of the Publisher Suggestion


begin
  #Publisher Suggestions: Update
  result = api_instance.update_publisher_suggestion(account_id, vsuggestion_id, status)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ListingsApi->update_publisher_suggestion: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **suggestion_id** | **String**|  | 
 **status** | **String**| The status of the Publisher Suggestion | 

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



