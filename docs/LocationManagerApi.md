# YextClient::LocationManagerApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_bio**](LocationManagerApi.md#create_bio) | **POST** /accounts/{accountId}/bios | Bios: Create
[**create_event**](LocationManagerApi.md#create_event) | **POST** /accounts/{accountId}/locations/events | Events: Create
[**create_location**](LocationManagerApi.md#create_location) | **POST** /accounts/{accountId}/locations | Locations: Create
[**create_menu**](LocationManagerApi.md#create_menu) | **POST** /accounts/{accountId}/menus | Menus: Create
[**create_product**](LocationManagerApi.md#create_product) | **POST** /accounts/{accountId}/products | Products: Create
[**delete_bio_list**](LocationManagerApi.md#delete_bio_list) | **DELETE** /accounts/{accountId}/bios/{listId} | Bios: Delete
[**delete_event_list**](LocationManagerApi.md#delete_event_list) | **DELETE** /accounts/{accountId}/locations/events/{listId} | Events: Delete
[**delete_language_profile**](LocationManagerApi.md#delete_language_profile) | **DELETE** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Delete
[**delete_menu_list**](LocationManagerApi.md#delete_menu_list) | **DELETE** /accounts/{accountId}/menus/{listId} | Menus: Delete
[**delete_product_list**](LocationManagerApi.md#delete_product_list) | **DELETE** /accounts/{accountId}/locations/products/{listId} | Products: Delete
[**get_bio**](LocationManagerApi.md#get_bio) | **GET** /accounts/{accountId}/bios/{listId} | Bios: Get
[**get_bios**](LocationManagerApi.md#get_bios) | **GET** /accounts/{accountId}/bios | Bios: List
[**get_business_categories**](LocationManagerApi.md#get_business_categories) | **GET** /categories | Categories: List
[**get_custom_fields**](LocationManagerApi.md#get_custom_fields) | **GET** /accounts/{accountId}/customfields | Custom Fields: List
[**get_event**](LocationManagerApi.md#get_event) | **GET** /accounts/{accountId}/locations/events/{listId} | Events: Get
[**get_events**](LocationManagerApi.md#get_events) | **GET** /accounts/{accountId}/locations/events | Events: List
[**get_google_keywords**](LocationManagerApi.md#get_google_keywords) | **GET** /googlefields | Google Fields: List
[**get_language_profile**](LocationManagerApi.md#get_language_profile) | **GET** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Get
[**get_language_profiles**](LocationManagerApi.md#get_language_profiles) | **GET** /accounts/{accountId}/locations/{locationId}/profiles | Language Profiles: List
[**get_location**](LocationManagerApi.md#get_location) | **GET** /accounts/{accountId}/locations/{locationId} | Locations: Get
[**get_location_folders**](LocationManagerApi.md#get_location_folders) | **GET** /accounts/{accountId}/folders | Folders: List
[**get_locations**](LocationManagerApi.md#get_locations) | **GET** /accounts/{accountId}/locations | Locations: List
[**get_menu**](LocationManagerApi.md#get_menu) | **GET** /accounts/{accountId}/menus/{listId} | Menus: Get
[**get_menus**](LocationManagerApi.md#get_menus) | **GET** /accounts/{accountId}/menus | Menus: List
[**get_product**](LocationManagerApi.md#get_product) | **GET** /accounts/{accountId}/locations/products/{listId} | Products: Get
[**get_products**](LocationManagerApi.md#get_products) | **GET** /accounts/{accountId}/products | Products: List
[**update_bio**](LocationManagerApi.md#update_bio) | **PUT** /accounts/{accountId}/bios/{listId} | Bios: Update
[**update_event**](LocationManagerApi.md#update_event) | **PUT** /accounts/{accountId}/locations/events/{listId} | Events: Update
[**update_location**](LocationManagerApi.md#update_location) | **PUT** /accounts/{accountId}/locations/{locationId} | Locations: Update
[**update_menu**](LocationManagerApi.md#update_menu) | **PUT** /accounts/{accountId}/menus/{listId} | Menus: Update
[**update_product**](LocationManagerApi.md#update_product) | **PUT** /accounts/{accountId}/locations/products/{listId} | Products: Update
[**upsert_language_profile**](LocationManagerApi.md#upsert_language_profile) | **PUT** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Upsert


# **create_bio**
> InlineResponse201 create_bio(account_id, vbody)

Bios: Create

Create new Bio ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Bio.new # Bio | 


begin
  #Bios: Create
  result = api_instance.create_bio(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->create_bio: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Bio**](Bio.md)|  | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_event**
> InlineResponse2012 create_event(account_id, vbody)

Events: Create

Create a new Events ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Event.new # Event | 


begin
  #Events: Create
  result = api_instance.create_event(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->create_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Event**](Event.md)|  | 

### Return type

[**InlineResponse2012**](InlineResponse2012.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_location**
> InlineResponse2011 create_location(account_id, vlocation_request)

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

location_request = YextClient::Location.new # Location | 


begin
  #Locations: Create
  result = api_instance.create_location(account_id, vlocation_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->create_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **location_request** | [**Location**](Location.md)|  | 

### Return type

[**InlineResponse2011**](InlineResponse2011.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_menu**
> InlineResponse2013 create_menu(account_id, vbody)

Menus: Create

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Menu.new # Menu | 


begin
  #Menus: Create
  result = api_instance.create_menu(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->create_menu: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Menu**](Menu.md)|  | 

### Return type

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_product**
> InlineResponse20011 create_product(account_id, vbody)

Products: Create

Create a new Product ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Product.new # Product | 


begin
  #Products: Create
  result = api_instance.create_product(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->create_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Product**](Product.md)|  | 

### Return type

[**InlineResponse20011**](InlineResponse20011.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_bio_list**
> InlineResponseDefault delete_bio_list(account_id, list_id, v)

Bios: Delete

Delete an existing Bios ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Bios: Delete
  result = api_instance.delete_bio_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->delete_bio_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_event_list**
> InlineResponseDefault delete_event_list(account_id, list_id, v)

Events: Delete

Delete an existing Events ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Events: Delete
  result = api_instance.delete_event_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->delete_event_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_language_profile**
> InlineResponseDefault delete_language_profile(account_id, location_id, language_code, v)

Language Profiles: Delete

Remove a Language Profile from a location

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

language_code = "language_code_example" # String | Locale code

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Language Profiles: Delete
  result = api_instance.delete_language_profile(account_id, location_id, language_code, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->delete_language_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **language_code** | **String**| Locale code | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_menu_list**
> InlineResponseDefault delete_menu_list(account_id, list_id, v)

Menus: Delete

Delete an existing Menu

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Menus: Delete
  result = api_instance.delete_menu_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->delete_menu_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_product_list**
> InlineResponseDefault delete_product_list(account_id, list_id, v)

Products: Delete

Delete an existing Products ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Products: Delete
  result = api_instance.delete_product_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->delete_product_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponseDefault**](InlineResponseDefault.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_bio**
> InlineResponse201 get_bio(account_id, list_id, v)

Bios: Get

Retrieve a specific Bios ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Bios: Get
  result = api_instance.get_bio(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_bio: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_bios**
> InlineResponse2004 get_bios(account_id, v, opts)

Bios: List

Retrieve all Bio ECls for an account

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results
}

begin
  #Bios: List
  result = api_instance.get_bios(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_bios: #{e}"
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

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_business_categories**
> InlineResponse20030 get_business_categories(v, opts)

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

api_instance = YextClient::LocationManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  language: "en", # String | Only categories that apply to this language will be returned.  **Example:** en 
  country: "US" # String | Only categories that apply in this country will be returned.  **Example:** US 
}

begin
  #Categories: List
  result = api_instance.get_business_categories(v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_business_categories: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **language** | **String**| Only categories that apply to this language will be returned.  **Example:** en  | [optional] [default to en]
 **country** | **String**| Only categories that apply in this country will be returned.  **Example:** US  | [optional] [default to US]

### Return type

[**InlineResponse20030**](InlineResponse20030.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_custom_fields**
> InlineResponse2005 get_custom_fields(vaccount_id, , opts)

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

api_instance = YextClient::LocationManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format

account_id = "account_id_example" # String | 

opts = { 
  offset: 0 # Integer | Number of results to skip. Used to page through results
  limit: 100 # Integer | Number of results to return
}

begin
  #Custom Fields: List
  result = api_instance.get_custom_fields(vaccount_id, , opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_custom_fields: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **account_id** | **String**|  | 
 **offset** | **Integer**| Number of results to skip. Used to page through results | [optional] [default to 0]
 **limit** | **Integer**| Number of results to return | [optional] [default to 100]

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_event**
> InlineResponse2012 get_event(account_id, list_id, v)

Events: Get

Retrieve a specific Events ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Events: Get
  result = api_instance.get_event(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse2012**](InlineResponse2012.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_events**
> InlineResponse20010 get_events(account_id, v, opts)

Events: List

Retrieve all Events content lists for an account

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results
}

begin
  #Events: List
  result = api_instance.get_events(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_events: #{e}"
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

[**InlineResponse20010**](InlineResponse20010.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_google_keywords**
> InlineResponse20031 get_google_keywords(v)

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

api_instance = YextClient::LocationManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Google Fields: List
  result = api_instance.get_google_keywords(v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_google_keywords: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse20031**](InlineResponse20031.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_language_profile**
> InlineResponse20012 get_language_profile(account_id, location_id, language_code, v)

Language Profiles: Get

Gets the the requested Language Profile for a given Location

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

language_code = "language_code_example" # String | Locale code

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Language Profiles: Get
  result = api_instance.get_language_profile(account_id, location_id, language_code, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_language_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **language_code** | **String**| Locale code | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_language_profiles**
> InlineResponse20013 get_language_profiles(account_id, location_id, v)

Language Profiles: List

Get Language Profiles for a Location.

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Language Profiles: List
  result = api_instance.get_language_profiles(account_id, location_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_language_profiles: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse20013**](InlineResponse20013.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_location**
> InlineResponse20012 get_location(account_id, location_id, v)

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Locations: Get
  result = api_instance.get_location(account_id, location_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_location_folders**
> InlineResponse2006 get_location_folders(account_id, v, opts)

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  offset: 0 # Integer | Number of results to skip. Used to page through results
  limit: 100 # Integer | Number of results to return
}

begin
  #Folders: List
  result = api_instance.get_location_folders(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_location_folders: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **offset** | **Integer**| Number of results to skip. Used to page through results | [optional] [default to 0]
 **limit** | **Integer**| Number of results to return | [optional] [default to 100]

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_locations**
> InlineResponse2009 get_locations(account_id, v, opts)

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results
}

begin
  #Locations: List
  result = api_instance.get_locations(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_locations: #{e}"
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

[**InlineResponse2009**](InlineResponse2009.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_menu**
> InlineResponse2013 get_menu(account_id, list_id, v)

Menus: Get

Retrieve a specific Menu

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Menus: Get
  result = api_instance.get_menu(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_menu: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_menus**
> InlineResponse20014 get_menus(account_id, v, opts)

Menus: List

Retrieve all Menu ECLs for an account

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results
}

begin
  #Menus: List
  result = api_instance.get_menus(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_menus: #{e}"
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

[**InlineResponse20014**](InlineResponse20014.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_product**
> InlineResponse20011 get_product(account_id, list_id, v)

Products: Get

Retrieve a specific Products ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format


begin
  #Products: Get
  result = api_instance.get_product(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]

### Return type

[**InlineResponse20011**](InlineResponse20011.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_products**
> InlineResponse20025 get_products(account_id, v, opts)

Products: List

Retrieve all Products content lists for an account

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results
}

begin
  #Products: List
  result = api_instance.get_products(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->get_products: #{e}"
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

[**InlineResponse20025**](InlineResponse20025.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_bio**
> InlineResponse201 update_bio(account_id, list_id, vbody)

Bios: Update

Update an existing Bios ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Bio.new # Bio | 


begin
  #Bios: Update
  result = api_instance.update_bio(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->update_bio: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Bio**](Bio.md)|  | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_event**
> InlineResponse2012 update_event(account_id, list_id, vbody)

Events: Update

Update an existing Events ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Event.new # Event | 


begin
  #Events: Update
  result = api_instance.update_event(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->update_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Event**](Event.md)|  | 

### Return type

[**InlineResponse2012**](InlineResponse2012.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_location**
> InlineResponse2011 update_location(account_id, location_id, vlocation_request)

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format

location_request = YextClient::Location.new # Location | 


begin
  #Locations: Update
  result = api_instance.update_location(account_id, location_id, vlocation_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->update_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **location_request** | [**Location**](Location.md)|  | 

### Return type

[**InlineResponse2011**](InlineResponse2011.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_menu**
> InlineResponse2013 update_menu(account_id, list_id, vbody)

Menus: Update

Update an existing Menu

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Menu.new # Menu | 


begin
  #Menus: Update
  result = api_instance.update_menu(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->update_menu: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Menu**](Menu.md)|  | 

### Return type

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_product**
> InlineResponse20011 update_product(account_id, list_id, vbody)

Products: Update

Update an existing Product ECL

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Product.new # Product | 


begin
  #Products: Update
  result = api_instance.update_product(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->update_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Product**](Product.md)|  | 

### Return type

[**InlineResponse20011**](InlineResponse20011.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **upsert_language_profile**
> InlineResponse20012 upsert_language_profile(account_id, location_id, language_code, vbody, opts)

Language Profiles: Upsert

Creates and / or sets the fields for a Language Profile  **NOTE:** You can change a Language Profile’s language by supplying a different (but unused) language code. 

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

api_instance = YextClient::LocationManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

language_code = "language_code_example" # String | Locale code

v = "20161012" # String | A date in `YYYYMMDD` format

body = YextClient::Location.new # Location | 

opts = { 
  primary: true # BOOLEAN | When present and set to true, the specified profile will become the location’s primary Language Profile
}

begin
  #Language Profiles: Upsert
  result = api_instance.upsert_language_profile(account_id, location_id, language_code, vbody, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling LocationManagerApi->upsert_language_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **language_code** | **String**| Locale code | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | [default to 20161012]
 **body** | [**Location**](Location.md)|  | 
 **primary** | **BOOLEAN**| When present and set to true, the specified profile will become the location’s primary Language Profile | [optional] 

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



