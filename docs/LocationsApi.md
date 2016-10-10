# YextClient::LocationsApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_location**](LocationsApi.md#create_location) | **POST** /accounts/{accountId}/locations | Locations: Create
[**get_business_categories**](LocationsApi.md#get_business_categories) | **GET** /categories | Categories: List
[**get_custom_fields**](LocationsApi.md#get_custom_fields) | **GET** /accounts/{accountId}/customfields | Custom Fields: List
[**get_google_keywords**](LocationsApi.md#get_google_keywords) | **GET** /googlefields | Google Fields: List
[**get_location**](LocationsApi.md#get_location) | **GET** /accounts/{accountId}/locations/{locationId} | Locations: Get
[**get_location_folders**](LocationsApi.md#get_location_folders) | **GET** /accounts/{accountId}/folders | Folders: List
[**get_locations**](LocationsApi.md#get_locations) | **GET** /accounts/{accountId}/locations | Locations: List
[**update_location**](LocationsApi.md#update_location) | **PUT** /accounts/{accountId}/locations/{locationId} | Locations: Update


# **create_location**
> InlineResponse201 create_location(account_id, vlocation_request)

Locations: Create

Create a new Location

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

api_instance = YextClient::LocationsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

location_request = YextClient::Location.new # Location | 


begin
  #Locations: Create
  result = api_instance.create_location(account_id, vlocation_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->create_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **location_request** | [**Location**](Location.md)|  | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_business_categories**
> InlineResponse2007 get_business_categories(v, opts)

Categories: List

Get available Categories.  All Locations are required to have an associated Category to assist with organization and search. Yext provides a hierarchy of business categories for this purpose, exposed by this API. 

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

api_instance = YextClient::LocationsApi.new

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  language: "en", # String | Only categories that apply to this language will be returned.
  country: "us" # String | Only categories that apply in this country will be returned.
}

begin
  #Categories: List
  result = api_instance.get_business_categories(v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->get_business_categories: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **language** | **String**| Only categories that apply to this language will be returned. | [optional] [default to en]
 **country** | **String**| Only categories that apply in this country will be returned. | [optional] [default to us]

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_custom_fields**
> InlineResponse200 get_custom_fields(vaccount_id, , opts)

Custom Fields: List

Returns a list of Custom Fields in an Account.

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

api_instance = YextClient::LocationsApi.new

v = "v_example" # String | A date in `YYYYMMDD` format

account_id = "account_id_example" # String | 

opts = { 
  offset: "0", # String | Number of results to skip. Used to page through results
  limit: 100 # Integer | Number of results to return
}

begin
  #Custom Fields: List
  result = api_instance.get_custom_fields(vaccount_id, , opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->get_custom_fields: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **account_id** | **String**|  | 
 **offset** | **String**| Number of results to skip. Used to page through results | [optional] [default to 0]
 **limit** | **Integer**| Number of results to return | [optional] [default to 100]

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_google_keywords**
> InlineResponse2008 get_google_keywords(v)

Google Fields: List

Use the Google Attributes API to retrieve a complete list of Google's location attributes for each business category. This list includes attributes that may not apply to all Partner Locations in an account. The attributes available to a Partner Location depends on its primary business category. You can view and edit the attributes of Partner Locationsvia the googleKeywords field in the Locations API.

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

api_instance = YextClient::LocationsApi.new

v = "v_example" # String | A date in `YYYYMMDD` format


begin
  #Google Fields: List
  result = api_instance.get_google_keywords(v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->get_google_keywords: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 

### Return type

[**InlineResponse2008**](InlineResponse2008.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_location**
> InlineResponse201 get_location(account_id, location_id, v)

Locations: Get

Gets the primary profile for a single Location.

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

api_instance = YextClient::LocationsApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format


begin
  #Locations: Get
  result = api_instance.get_location(account_id, location_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->get_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_location_folders**
> InlineResponse2001 get_location_folders(account_id, v, opts)

Folders: List

Returns a list of Location Folders in an Account.

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

api_instance = YextClient::LocationsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  offset: "0", # String | Number of results to skip. Used to page through results
  limit: 100 # Integer | Number of results to return
}

begin
  #Folders: List
  result = api_instance.get_location_folders(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->get_location_folders: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **offset** | **String**| Number of results to skip. Used to page through results | [optional] [default to 0]
 **limit** | **Integer**| Number of results to return | [optional] [default to 100]

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_locations**
> InlineResponse2002 get_locations(account_id, v, opts)

Locations: List

Get multiple Locations (primary profiles only).

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

api_instance = YextClient::LocationsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: "0", # String | Number of results to skip. Used to page through results
}

begin
  #Locations: List
  result = api_instance.get_locations(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->get_locations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **limit** | **Integer**| Number of results to return | [optional] [default to 10]
 **offset** | **String**| Number of results to skip. Used to page through results | [optional] [default to 0]

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_location**
> InlineResponse201 update_location(account_id, location_id, vlocation_request)

Locations: Update

Updates the primary profile for a Location.  **NOTE:** Despite using the PUT method, Locations: Update only updates supplied fields. Omitted fields are not modified.  **NOTE:** The Location's primary profile language can be changed by calling this endpoint with a different, but unused, language code. 

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

api_instance = YextClient::LocationsApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

location_request = YextClient::Location.new # Location | 


begin
  #Locations: Update
  result = api_instance.update_location(account_id, location_id, vlocation_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationsApi->update_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **location_request** | [**Location**](Location.md)|  | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



