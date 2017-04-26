# YextClient::KnowledgeManagerApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_bio**](KnowledgeManagerApi.md#create_bio) | **POST** /accounts/{accountId}/bios | Bios: Create
[**create_custom_field**](KnowledgeManagerApi.md#create_custom_field) | **POST** /accounts/{accountId}/customfields | Custom Fields: Create
[**create_event**](KnowledgeManagerApi.md#create_event) | **POST** /accounts/{accountId}/events | Events: Create
[**create_location**](KnowledgeManagerApi.md#create_location) | **POST** /accounts/{accountId}/locations | Locations: Create
[**create_menu**](KnowledgeManagerApi.md#create_menu) | **POST** /accounts/{accountId}/menus | Menus: Create
[**create_product**](KnowledgeManagerApi.md#create_product) | **POST** /accounts/{accountId}/products | Products: Create
[**delete_bio_list**](KnowledgeManagerApi.md#delete_bio_list) | **DELETE** /accounts/{accountId}/bios/{listId} | Bios: Delete
[**delete_custom_field**](KnowledgeManagerApi.md#delete_custom_field) | **DELETE** /accounts/{accountId}/customFields/{customFieldId} | Custom Fields: Delete
[**delete_event_list**](KnowledgeManagerApi.md#delete_event_list) | **DELETE** /accounts/{accountId}/events/{listId} | Events: Delete
[**delete_language_profile**](KnowledgeManagerApi.md#delete_language_profile) | **DELETE** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Delete
[**delete_menu_list**](KnowledgeManagerApi.md#delete_menu_list) | **DELETE** /accounts/{accountId}/menus/{listId} | Menus: Delete
[**delete_product_list**](KnowledgeManagerApi.md#delete_product_list) | **DELETE** /accounts/{accountId}/products/{listId} | Products: Delete
[**get_bio**](KnowledgeManagerApi.md#get_bio) | **GET** /accounts/{accountId}/bios/{listId} | Bios: Get
[**get_bios**](KnowledgeManagerApi.md#get_bios) | **GET** /accounts/{accountId}/bios | Bios: List
[**get_business_categories**](KnowledgeManagerApi.md#get_business_categories) | **GET** /categories | Categories: List
[**get_custom_field**](KnowledgeManagerApi.md#get_custom_field) | **GET** /accounts/{accountId}/customFields/{customFieldId} | Custom Fields: Get
[**get_custom_fields**](KnowledgeManagerApi.md#get_custom_fields) | **GET** /accounts/{accountId}/customfields | Custom Fields: List
[**get_event**](KnowledgeManagerApi.md#get_event) | **GET** /accounts/{accountId}/events/{listId} | Events: Get
[**get_events**](KnowledgeManagerApi.md#get_events) | **GET** /accounts/{accountId}/events | Events: List
[**get_google_keywords**](KnowledgeManagerApi.md#get_google_keywords) | **GET** /googlefields | Google Fields: List
[**get_language_profile**](KnowledgeManagerApi.md#get_language_profile) | **GET** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Get
[**get_language_profiles**](KnowledgeManagerApi.md#get_language_profiles) | **GET** /accounts/{accountId}/locations/{locationId}/profiles | Language Profiles: List
[**get_location**](KnowledgeManagerApi.md#get_location) | **GET** /accounts/{accountId}/locations/{locationId} | Locations: Get
[**get_location_folders**](KnowledgeManagerApi.md#get_location_folders) | **GET** /accounts/{accountId}/folders | Folders: List
[**get_locations**](KnowledgeManagerApi.md#get_locations) | **GET** /accounts/{accountId}/locations | Locations: List
[**get_menu**](KnowledgeManagerApi.md#get_menu) | **GET** /accounts/{accountId}/menus/{listId} | Menus: Get
[**get_menus**](KnowledgeManagerApi.md#get_menus) | **GET** /accounts/{accountId}/menus | Menus: List
[**get_product**](KnowledgeManagerApi.md#get_product) | **GET** /accounts/{accountId}/products/{listId} | Products: Get
[**get_products**](KnowledgeManagerApi.md#get_products) | **GET** /accounts/{accountId}/products | Products: List
[**search_locations**](KnowledgeManagerApi.md#search_locations) | **GET** /accounts/{accountId}/locationsearch | Locations: Search
[**update_bio**](KnowledgeManagerApi.md#update_bio) | **PUT** /accounts/{accountId}/bios/{listId} | Bios: Update
[**update_custom_field**](KnowledgeManagerApi.md#update_custom_field) | **PUT** /accounts/{accountId}/customFields/{customFieldId} | Custom Fields: Update
[**update_event**](KnowledgeManagerApi.md#update_event) | **PUT** /accounts/{accountId}/events/{listId} | Events: Update
[**update_location**](KnowledgeManagerApi.md#update_location) | **PUT** /accounts/{accountId}/locations/{locationId} | Locations: Update
[**update_menu**](KnowledgeManagerApi.md#update_menu) | **PUT** /accounts/{accountId}/menus/{listId} | Menus: Update
[**update_product**](KnowledgeManagerApi.md#update_product) | **PUT** /accounts/{accountId}/products/{listId} | Products: Update
[**upsert_language_profile**](KnowledgeManagerApi.md#upsert_language_profile) | **PUT** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Upsert


# **create_bio**
> IdResponse create_bio(account_id, vbody)

Bios: Create

Create new Bio List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Bio.new # Bio | 


begin
  #Bios: Create
  result = api_instance.create_bio(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->create_bio: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Bio**](Bio.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_custom_field**
> IdResponse create_custom_field(vaccount_id, body)

Custom Fields: Create

Creates a new Custom Field in an Account. 

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

api_instance = YextClient::KnowledgeManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format.

account_id = "account_id_example" # String | 

body = YextClient::CustomField.new # CustomField | 


begin
  #Custom Fields: Create
  result = api_instance.create_custom_field(vaccount_id, body)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->create_custom_field: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **account_id** | **String**|  | 
 **body** | [**CustomField**](CustomField.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_event**
> IdResponse create_event(account_id, vbody)

Events: Create

Create a new Event List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Event.new # Event | 


begin
  #Events: Create
  result = api_instance.create_event(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->create_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Event**](Event.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_location**
> IdResponse create_location(account_id, vlocation_request)

Locations: Create

Create a new Location.    ## Required fields * **`id`** * **`locationName`** * **`address`** * **`city`** * **`state`** * **`zip`** * **`countryCode`** * **`phone`** * **`categoryIds`** * **`featuredMessage`**   ## Optional fields that trigger warnings Submitting invalid values for certain optional fields will not trigger an error response. Instead, the success response will contain warning messages explaining why the invalid optional values were not stored in the system. The fields that generate warning messages are: <br><br> * **`paymentOptions`** * **`logo`** * **`photos`** * **`twitterHandle`** * **`facebookPageUrl`** * **`languages`**  

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

location_request = YextClient::Location.new # Location | 


begin
  #Locations: Create
  result = api_instance.create_location(account_id, vlocation_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->create_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **location_request** | [**Location**](Location.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_menu**
> IdResponse create_menu(account_id, vbody)

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Menu.new # Menu | 


begin
  #Menus: Create
  result = api_instance.create_menu(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->create_menu: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Menu**](Menu.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_product**
> IdResponse create_product(account_id, vbody)

Products: Create

Create a new Product List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Product.new # Product | 


begin
  #Products: Create
  result = api_instance.create_product(account_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->create_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Product**](Product.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_bio_list**
> ErrorResponse delete_bio_list(account_id, list_id, v)

Bios: Delete

Delete an existing Bios List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Bios: Delete
  result = api_instance.delete_bio_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->delete_bio_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_custom_field**
> ErrorResponse delete_custom_field(vaccount_id, custom_field_id)

Custom Fields: Delete

Deletes a Custom Field in an Account.  The Custom Field will be removed from all locations, and all content entered in the Custom Field will be deleted permanently. 

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

api_instance = YextClient::KnowledgeManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format.

account_id = "account_id_example" # String | 

custom_field_id = "custom_field_id_example" # String | 


begin
  #Custom Fields: Delete
  result = api_instance.delete_custom_field(vaccount_id, custom_field_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->delete_custom_field: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **account_id** | **String**|  | 
 **custom_field_id** | **String**|  | 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_event_list**
> ErrorResponse delete_event_list(account_id, list_id, v)

Events: Delete

Delete an existing Event List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Events: Delete
  result = api_instance.delete_event_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->delete_event_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_language_profile**
> ErrorResponse delete_language_profile(account_id, location_id, language_code, v)

Language Profiles: Delete

Remove a Language Profile from a location.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

language_code = "language_code_example" # String | Locale code.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Language Profiles: Delete
  result = api_instance.delete_language_profile(account_id, location_id, language_code, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->delete_language_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **language_code** | **String**| Locale code. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_menu_list**
> ErrorResponse delete_menu_list(account_id, list_id, v)

Menus: Delete

Delete an existing Menu.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Menus: Delete
  result = api_instance.delete_menu_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->delete_menu_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_product_list**
> ErrorResponse delete_product_list(account_id, list_id, v)

Products: Delete

Delete an existing Products List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Products: Delete
  result = api_instance.delete_product_list(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->delete_product_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_bio**
> BioListResponse get_bio(account_id, list_id, v)

Bios: Get

Retrieve a specific Bios List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Bios: Get
  result = api_instance.get_bio(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_bio: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**BioListResponse**](BioListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_bios**
> BioListsResponse get_bios(account_id, v, opts)

Bios: List

Retrieve all Bio Lists for an account.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return.
  offset: 0 # Integer | Number of results to return.
}

begin
  #Bios: List
  result = api_instance.get_bios(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_bios: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 10]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]

### Return type

[**BioListsResponse**](BioListsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_business_categories**
> BusinessCategoriesResponse get_business_categories(v, opts)

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

api_instance = YextClient::KnowledgeManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  language: "en", # String | Only categories that apply to this language will be returned.  **Example:** en 
  country: "US" # String | Only categories that apply in this country will be returned.  **Example:** US 
}

begin
  #Categories: List
  result = api_instance.get_business_categories(v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_business_categories: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **language** | **String**| Only categories that apply to this language will be returned.  **Example:** en  | [optional] [default to en]
 **country** | **String**| Only categories that apply in this country will be returned.  **Example:** US  | [optional] [default to US]

### Return type

[**BusinessCategoriesResponse**](BusinessCategoriesResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_custom_field**
> CustomFieldResponse get_custom_field(vaccount_id, custom_field_id)

Custom Fields: Get

Gets a specific Custom Field in an Account.

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

api_instance = YextClient::KnowledgeManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format.

account_id = "account_id_example" # String | 

custom_field_id = "custom_field_id_example" # String | 


begin
  #Custom Fields: Get
  result = api_instance.get_custom_field(vaccount_id, custom_field_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_custom_field: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **account_id** | **String**|  | 
 **custom_field_id** | **String**|  | 

### Return type

[**CustomFieldResponse**](CustomFieldResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_custom_fields**
> CustomFieldsResponse get_custom_fields(vaccount_id, , opts)

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

api_instance = YextClient::KnowledgeManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format.

account_id = "account_id_example" # String | 

opts = { 
  offset: 0 # Integer | Number of results to return.
  limit: 100 # Integer | Number of results to return.
}

begin
  #Custom Fields: List
  result = api_instance.get_custom_fields(vaccount_id, , opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_custom_fields: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **account_id** | **String**|  | 
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 100]

### Return type

[**CustomFieldsResponse**](CustomFieldsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_event**
> EventListResponse get_event(account_id, list_id, v)

Events: Get

Retrieve a specific Event List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Events: Get
  result = api_instance.get_event(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**EventListResponse**](EventListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_events**
> EventListsResponse get_events(account_id, v, opts)

Events: List

Retrieve all Event Lists for an account.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return.
  offset: 0 # Integer | Number of results to return.
}

begin
  #Events: List
  result = api_instance.get_events(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_events: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 10]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]

### Return type

[**EventListsResponse**](EventListsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_google_keywords**
> GoogleFieldsResponse get_google_keywords(v)

Google Fields: List

Use the Google Fields endpoint to retrieve a complete list of Google's location attributes for each business category. This list includes attributes that may not apply to all Locations in an account. The set of attributes available to a Location depends on its primary business category. You can view and edit the attributes of Locations in the googleAttributes Location field.

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

api_instance = YextClient::KnowledgeManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Google Fields: List
  result = api_instance.get_google_keywords(v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_google_keywords: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**GoogleFieldsResponse**](GoogleFieldsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_language_profile**
> LocationResponse get_language_profile(account_id, location_id, language_code, v, opts)

Language Profiles: Get

Gets the the requested Language Profile for a given Location.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

language_code = "language_code_example" # String | Locale code.

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  resolve_placeholders: false # BOOLEAN | Optional parameter to resolve all embedded fields in a Location object response. - `false` (default): Location object returns placeholder labels, e.g. \"Your [[CITY]] store\" - `true`: Location object returns placeholder values, e.g. \"Your Fairfax store\"  
}

begin
  #Language Profiles: Get
  result = api_instance.get_language_profile(account_id, location_id, language_code, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_language_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **language_code** | **String**| Locale code. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **resolve_placeholders** | **BOOLEAN**| Optional parameter to resolve all embedded fields in a Location object response. - &#x60;false&#x60; (default): Location object returns placeholder labels, e.g. \&quot;Your [[CITY]] store\&quot; - &#x60;true&#x60;: Location object returns placeholder values, e.g. \&quot;Your Fairfax store\&quot;   | [optional] [default to false]

### Return type

[**LocationResponse**](LocationResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_language_profiles**
> LanguageProfilesResponse get_language_profiles(account_id, location_id, v, opts)

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  resolve_placeholders: false # BOOLEAN | Optional parameter to resolve all embedded fields in a Location object response. - `false` (default): Location object returns placeholder labels, e.g. \"Your [[CITY]] store\" - `true`: Location object returns placeholder values, e.g. \"Your Fairfax store\"  
}

begin
  #Language Profiles: List
  result = api_instance.get_language_profiles(account_id, location_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_language_profiles: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **resolve_placeholders** | **BOOLEAN**| Optional parameter to resolve all embedded fields in a Location object response. - &#x60;false&#x60; (default): Location object returns placeholder labels, e.g. \&quot;Your [[CITY]] store\&quot; - &#x60;true&#x60;: Location object returns placeholder values, e.g. \&quot;Your Fairfax store\&quot;   | [optional] [default to false]

### Return type

[**LanguageProfilesResponse**](LanguageProfilesResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_location**
> LocationResponse get_location(account_id, location_id, v, opts)

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  resolve_placeholders: false # BOOLEAN | Optional parameter to resolve all embedded fields in a Location object response. - `false` (default): Location object returns placeholder labels, e.g. \"Your [[CITY]] store\" - `true`: Location object returns placeholder values, e.g. \"Your Fairfax store\"  
}

begin
  #Locations: Get
  result = api_instance.get_location(account_id, location_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **resolve_placeholders** | **BOOLEAN**| Optional parameter to resolve all embedded fields in a Location object response. - &#x60;false&#x60; (default): Location object returns placeholder labels, e.g. \&quot;Your [[CITY]] store\&quot; - &#x60;true&#x60;: Location object returns placeholder values, e.g. \&quot;Your Fairfax store\&quot;   | [optional] [default to false]

### Return type

[**LocationResponse**](LocationResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_location_folders**
> FoldersResponse get_location_folders(account_id, v, opts)

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  offset: 0 # Integer | Number of results to return.
  limit: 100 # Integer | Number of results to return.
}

begin
  #Folders: List
  result = api_instance.get_location_folders(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_location_folders: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 100]

### Return type

[**FoldersResponse**](FoldersResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_locations**
> LocationsResponse get_locations(account_id, v, opts)

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return.
  offset: 0 # Integer | Number of results to return.
  resolve_placeholders: false # BOOLEAN | Optional parameter to resolve all embedded fields in a Location object response. - `false` (default): Location object returns placeholder labels, e.g. \"Your [[CITY]] store\" - `true`: Location object returns placeholder values, e.g. \"Your Fairfax store\"  
}

begin
  #Locations: List
  result = api_instance.get_locations(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_locations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 10]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]
 **resolve_placeholders** | **BOOLEAN**| Optional parameter to resolve all embedded fields in a Location object response. - &#x60;false&#x60; (default): Location object returns placeholder labels, e.g. \&quot;Your [[CITY]] store\&quot; - &#x60;true&#x60;: Location object returns placeholder values, e.g. \&quot;Your Fairfax store\&quot;   | [optional] [default to false]

### Return type

[**LocationsResponse**](LocationsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_menu**
> MenuListResponse get_menu(account_id, list_id, v)

Menus: Get

Retrieve a specific Menu.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Menus: Get
  result = api_instance.get_menu(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_menu: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**MenuListResponse**](MenuListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_menus**
> MenuListsResponse get_menus(account_id, v, opts)

Menus: List

Retrieve all Menus for an account.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return.
  offset: 0 # Integer | Number of results to return.
}

begin
  #Menus: List
  result = api_instance.get_menus(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_menus: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 10]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]

### Return type

[**MenuListsResponse**](MenuListsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_product**
> ProductListResponse get_product(account_id, list_id, v)

Products: Get

Retrieve a specific Product List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Products: Get
  result = api_instance.get_product(account_id, list_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ProductListResponse**](ProductListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_products**
> ProductListsResponse get_products(account_id, v, opts)

Products: List

Retrieve all Product Lists for an account.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return.
  offset: 0 # Integer | Number of results to return.
}

begin
  #Products: List
  result = api_instance.get_products(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->get_products: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 10]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]

### Return type

[**ProductListsResponse**](ProductListsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **search_locations**
> LocationsResponse search_locations(account_id, v, opts)

Locations: Search

Get multiple Locations (primary profiles only) that match provided filters.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return.
  offset: 0, # Integer | Number of results to skip. Used to page through results.
  filters: "filters_example" # String | A set of filters that is applied to the set of locations that would otherwise be returned. Should be provided as a URL-encoded string containing a JSON object. The JSON object will be an array with one or more filter objects defined. All filter objects will apply as an intersection (i.e. AND). Field names reference Location fields, as well as custom fields using the format custom###, where ### is the custom field’s ID.  The filter types are the following. Note there may be multiple available specifications for a given filter type:  <table style=\"width:100%\">   <tr>     <th>Filter Type</th>     <th>Syntax</th>     <th>Description</th>   </tr>   <tr>     <td>Full</td>     <td>fieldName: {contains: $search}</td>     <td>$search is the search string</td>   </tr>   <tr>     <td>Text</td>     <td>fieldName: {$type: [$search,...]}</td>     <td>$type is one of [contains,doesNotContain,startsWith,equalTo], $search is an array of search strings, combined with OR</td>   </tr>   <tr>     <td>Text</td>     <td>fieldName: $type</td>     <td>$type is one of [empty,notEmpty]</td>   </tr>   <tr>     <td>Number</td>     <td>fieldName: {$type: $value}</td>     <td>$type is one of [eq,lt,gt,le,ge], $value is the numeric value</td>   </tr>   <tr>     <td>Number</td>     <td>fieldName: {$type: [$value1, $value2]}</td>     <td>$type is one of [between], $value1 and $value2 are numeric values</td>   </tr>   <tr>     <td>Date</td>     <td>fieldName: {$type: $value}</td>     <td>$type is one of [eq,lt,gt,le,ge], $value is a string of \"YYYY-MM-DD” formatted date</td>   </tr>   <tr>     <td>Date</td>     <td>fieldName: $type</td>     <td>$type is one of [empty,notEmpty]</td>   </tr>   <tr>     <td>Date</td>     <td>fieldName: {$type: [$value1, $value2]}</td>     <td>$type is one of [between], $value1 and $value2 are strings of \"YYYY-MM-DD” formatted date</td>   </tr>   <tr>     <td>Categories</td>     <td>fieldName: {$type: [$id,...]}</td>     <td>$type is one of [includes,notIncludes], $id is an array of numeric category IDs, combined with OR</td>   </tr>   <tr>     <td>Categories</td>     <td>fieldName: $type</td>     <td>$type is one of [none]</td>   </tr>   <tr>     <td>Assets</td>     <td>fieldName: {$type: [$id,...]}</td>     <td>$type is one of [includes,notIncludes], $id is an array of numeric category IDs, combined with OR</td>   </tr>   <tr>     <td>Assets</td>     <td>fieldName: $type</td>     <td>$type is one of [none]</td>   </tr>   <tr>     <td>Country</td>     <td>fieldName: {$type: [$country,...]}</td>     <td>$type is one of [includes,notIncludes], $country is an array of country code strings, combined with OR</td>   </tr>   <tr>     <td>PrimaryLanguage</td>     <td>fieldName: {$type: [$language,...]}</td>     <td>$type is one of [is,isNot], $language is an array of language code strings, combined with OR</td>   </tr>   <tr>     <td>AlternateLanguage</td>     <td>fieldName: {$type: [$language,...]}</td>     <td>$type is one of [is,isNot], $language is an array of language code strings, combined with OR</td>   </tr>   <tr>     <td>StringSingle</td>     <td>fieldName: {$type: [$string,...]}</td>     <td>$type is one of [is,isNot], $string is an array of strings, combined with OR</td>   </tr>   <tr>     <td>StringList</td>     <td>fieldName: {$type: [$string,...]}</td>     <td>$type is one of [includes,notIncludes], $string is an array of strings, combined with OR</td>   </tr>   <tr>     <td>LocationType</td>     <td>fieldName: {$type: [$id,...]}</td>     <td>$type is one of [is,isNot], $id is an array of location type IDs, combined with OR</td>   </tr>   <tr>     <td>Bool</td>     <td>fieldName: $type</td>     <td>$type is one of [true,false]</td>   </tr>   <tr>     <td>Option</td>     <td>fieldName: {$type: $id}</td>     <td>$type is one of [is,isNot], $id is an option ID (For single option custom fields)</td>   </tr>   <tr>     <td>Option</td>     <td>fieldName: {$type: [$id,...]}</td>     <td>$type is one of [includes,notIncludes], $string is an array of strings, combined with OR (For multi option custom fields)</td>   </tr>   <tr>     <td>IdList</td>     <td>fieldName: {$type: [$id,...]}</td>     <td>$type is one of [includes,notIncludes], $id is an array of IDs, combined with OR</td>   </tr> </table>  The following fields can be specified in the request (Field name/Filter Type/Example(s)):  <table style=\"width:100%\">   <tr>     <th>Field Name</th>     <th>Filter Type</th>     <th>Example(s)</th>   </tr>   <tr>     <td>location</td>     <td>Full</td>     <td>\"location”: {\"contains”: \"Atlanta”}</td>   </tr>   <tr>     <td>name</td>     <td>Text</td>     <td>\"name”: {\"startsWith”: [\"Guitar”]}, \"name”: {\"contains”: [\"A”,”B”]}</td>   </tr>   <tr>     <td>address</td>     <td>Text</td>     <td>\"address”: {\"startsWith”: [\"South”]}</td>   </tr>   <tr>     <td>address2</td>     <td>Text</td>     <td>\"address2”: {\"contains”: [\"Suite”]}</td>   </tr>   <tr>     <td>city</td>     <td>Text</td>     <td>\"city”: {\"contains”: [\"Atlanta”]}</td>   </tr>   <tr>     <td>state</td>     <td>Text</td>     <td>\"state”: {\"contains”: [\"AK”,”VA”]}</td>   </tr>   <tr>     <td>zip</td>     <td>Text</td>     <td>\"zip”: {\"contains”: [\"M5K 7QB”]}</td>   </tr>   <tr>     <td>phones</td>     <td>Text</td>     <td>\"phones”: {\"startsWith”: [\"703”,”571”]}</td>   </tr>   <tr>     <td>specialOffer</td>     <td>Text</td>     <td>\"specialOffer”: \"notEmpty”</td>   </tr>   <tr>     <td>emails</td>     <td>Text</td>     <td>\"emails”: {\"doesNotContain”: [\"@yext.com”]}</td>   </tr>   <tr>     <td>website</td>     <td>Text</td>     <td>\"website”: {\"equalTo”: [\"https://www.yext.com/”]}</td>   </tr>   <tr>     <td>categories</td>     <td>Categories</td>     <td>\"categories”: {\"includes”: [23,755,34]}</td>   </tr>   <tr>     <td>closed</td>     <td>Bool</td>     <td>\"closed”: true</td>   </tr>   <tr>     <td>storeId</td>     <td>Text</td>     <td>\"storeId”: {\"equalTo”: [\"MCD0001”]}</td>   </tr>   <tr>     <td>countryCode</td>     <td>Country</td>     <td>\"countryCode”: {\"notIncludes”: [\"US”]}</td>   </tr>   <tr>     <td>products</td>     <td>Text</td>     <td>\"products”: {\"startsWith”: [\"Burger”,”Fries”]}</td>   </tr>   <tr>     <td>services</td>     <td>Text</td>     <td>\"services”: {\"contains”: [\"Manicures”]}</td>   </tr>   <tr>     <td>specialties</td>     <td>Text</td>     <td>\"services”: \"notEmpty”</td>   </tr>   <tr>     <td>associations</td>     <td>Text</td>     <td>\"associations”: \"empty”</td>   </tr>   <tr>     <td>brands</td>     <td>Text</td>     <td>\"brands”: {\"equalTo”: [\"North Face”]}</td>   </tr>   <tr>     <td>languages</td>     <td>Text</td>     <td>\"languages”: {\"equalTo”: [\"English”,”Spanish”]}</td>   </tr>   <tr>     <td>keywords</td>     <td>Text</td>     <td>\"keywords”: {\"startsWith”: [\"Franchise”]}</td>   </tr>   <tr>     <td>menuIds</td>     <td>IdList</td>     <td>\"menuIds”: {\"includes”: [23,755,34]}</td>   </tr>   <tr>     <td>productListIds</td>     <td>IdList</td>     <td>\"productListIds”: {\"notIncludes”: [2]}</td>   </tr>   <tr>     <td>calendarIds</td>     <td>IdList</td>     <td>\"calendarIds”: {\"notIncludes”: [34]}</td>   </tr>   <tr>     <td>bioIds</td>     <td>IdList</td>     <td>\"bioIds”: {\"includes”: [23,34]}</td>   </tr>   <tr>     <td>custom###</td>     <td>Text, Number, Date, Bool, or Option</td>     <td>\"custom123”: {\"equalTo”: [\"asdf”]}</td>   </tr>   <tr>     <td>folder</td>     <td>int64</td>     <td>\"folder”: 123</td>   </tr>   <tr>     <td>primary_language</td>     <td>PrimaryLanguage</td>     <td>\"primary_language”: {\"is”: \"fr_CA”}</td>   </tr> </table> 
}

begin
  #Locations: Search
  result = api_instance.search_locations(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->search_locations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 10]
 **offset** | **Integer**| Number of results to skip. Used to page through results. | [optional] [default to 0]
 **filters** | **String**| A set of filters that is applied to the set of locations that would otherwise be returned. Should be provided as a URL-encoded string containing a JSON object. The JSON object will be an array with one or more filter objects defined. All filter objects will apply as an intersection (i.e. AND). Field names reference Location fields, as well as custom fields using the format custom###, where ### is the custom field’s ID.  The filter types are the following. Note there may be multiple available specifications for a given filter type:  &lt;table style&#x3D;\&quot;width:100%\&quot;&gt;   &lt;tr&gt;     &lt;th&gt;Filter Type&lt;/th&gt;     &lt;th&gt;Syntax&lt;/th&gt;     &lt;th&gt;Description&lt;/th&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Full&lt;/td&gt;     &lt;td&gt;fieldName: {contains: $search}&lt;/td&gt;     &lt;td&gt;$search is the search string&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$search,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [contains,doesNotContain,startsWith,equalTo], $search is an array of search strings, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;fieldName: $type&lt;/td&gt;     &lt;td&gt;$type is one of [empty,notEmpty]&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Number&lt;/td&gt;     &lt;td&gt;fieldName: {$type: $value}&lt;/td&gt;     &lt;td&gt;$type is one of [eq,lt,gt,le,ge], $value is the numeric value&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Number&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$value1, $value2]}&lt;/td&gt;     &lt;td&gt;$type is one of [between], $value1 and $value2 are numeric values&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Date&lt;/td&gt;     &lt;td&gt;fieldName: {$type: $value}&lt;/td&gt;     &lt;td&gt;$type is one of [eq,lt,gt,le,ge], $value is a string of \&quot;YYYY-MM-DD” formatted date&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Date&lt;/td&gt;     &lt;td&gt;fieldName: $type&lt;/td&gt;     &lt;td&gt;$type is one of [empty,notEmpty]&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Date&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$value1, $value2]}&lt;/td&gt;     &lt;td&gt;$type is one of [between], $value1 and $value2 are strings of \&quot;YYYY-MM-DD” formatted date&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Categories&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$id,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [includes,notIncludes], $id is an array of numeric category IDs, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Categories&lt;/td&gt;     &lt;td&gt;fieldName: $type&lt;/td&gt;     &lt;td&gt;$type is one of [none]&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Assets&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$id,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [includes,notIncludes], $id is an array of numeric category IDs, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Assets&lt;/td&gt;     &lt;td&gt;fieldName: $type&lt;/td&gt;     &lt;td&gt;$type is one of [none]&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Country&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$country,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [includes,notIncludes], $country is an array of country code strings, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;PrimaryLanguage&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$language,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [is,isNot], $language is an array of language code strings, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;AlternateLanguage&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$language,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [is,isNot], $language is an array of language code strings, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;StringSingle&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$string,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [is,isNot], $string is an array of strings, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;StringList&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$string,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [includes,notIncludes], $string is an array of strings, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;LocationType&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$id,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [is,isNot], $id is an array of location type IDs, combined with OR&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Bool&lt;/td&gt;     &lt;td&gt;fieldName: $type&lt;/td&gt;     &lt;td&gt;$type is one of [true,false]&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Option&lt;/td&gt;     &lt;td&gt;fieldName: {$type: $id}&lt;/td&gt;     &lt;td&gt;$type is one of [is,isNot], $id is an option ID (For single option custom fields)&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;Option&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$id,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [includes,notIncludes], $string is an array of strings, combined with OR (For multi option custom fields)&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;IdList&lt;/td&gt;     &lt;td&gt;fieldName: {$type: [$id,...]}&lt;/td&gt;     &lt;td&gt;$type is one of [includes,notIncludes], $id is an array of IDs, combined with OR&lt;/td&gt;   &lt;/tr&gt; &lt;/table&gt;  The following fields can be specified in the request (Field name/Filter Type/Example(s)):  &lt;table style&#x3D;\&quot;width:100%\&quot;&gt;   &lt;tr&gt;     &lt;th&gt;Field Name&lt;/th&gt;     &lt;th&gt;Filter Type&lt;/th&gt;     &lt;th&gt;Example(s)&lt;/th&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;location&lt;/td&gt;     &lt;td&gt;Full&lt;/td&gt;     &lt;td&gt;\&quot;location”: {\&quot;contains”: \&quot;Atlanta”}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;name&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;name”: {\&quot;startsWith”: [\&quot;Guitar”]}, \&quot;name”: {\&quot;contains”: [\&quot;A”,”B”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;address&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;address”: {\&quot;startsWith”: [\&quot;South”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;address2&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;address2”: {\&quot;contains”: [\&quot;Suite”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;city&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;city”: {\&quot;contains”: [\&quot;Atlanta”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;state&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;state”: {\&quot;contains”: [\&quot;AK”,”VA”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;zip&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;zip”: {\&quot;contains”: [\&quot;M5K 7QB”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;phones&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;phones”: {\&quot;startsWith”: [\&quot;703”,”571”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;specialOffer&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;specialOffer”: \&quot;notEmpty”&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;emails&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;emails”: {\&quot;doesNotContain”: [\&quot;@yext.com”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;website&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;website”: {\&quot;equalTo”: [\&quot;https://www.yext.com/”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;categories&lt;/td&gt;     &lt;td&gt;Categories&lt;/td&gt;     &lt;td&gt;\&quot;categories”: {\&quot;includes”: [23,755,34]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;closed&lt;/td&gt;     &lt;td&gt;Bool&lt;/td&gt;     &lt;td&gt;\&quot;closed”: true&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;storeId&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;storeId”: {\&quot;equalTo”: [\&quot;MCD0001”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;countryCode&lt;/td&gt;     &lt;td&gt;Country&lt;/td&gt;     &lt;td&gt;\&quot;countryCode”: {\&quot;notIncludes”: [\&quot;US”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;products&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;products”: {\&quot;startsWith”: [\&quot;Burger”,”Fries”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;services&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;services”: {\&quot;contains”: [\&quot;Manicures”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;specialties&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;services”: \&quot;notEmpty”&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;associations&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;associations”: \&quot;empty”&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;brands&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;brands”: {\&quot;equalTo”: [\&quot;North Face”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;languages&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;languages”: {\&quot;equalTo”: [\&quot;English”,”Spanish”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;keywords&lt;/td&gt;     &lt;td&gt;Text&lt;/td&gt;     &lt;td&gt;\&quot;keywords”: {\&quot;startsWith”: [\&quot;Franchise”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;menuIds&lt;/td&gt;     &lt;td&gt;IdList&lt;/td&gt;     &lt;td&gt;\&quot;menuIds”: {\&quot;includes”: [23,755,34]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;productListIds&lt;/td&gt;     &lt;td&gt;IdList&lt;/td&gt;     &lt;td&gt;\&quot;productListIds”: {\&quot;notIncludes”: [2]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;calendarIds&lt;/td&gt;     &lt;td&gt;IdList&lt;/td&gt;     &lt;td&gt;\&quot;calendarIds”: {\&quot;notIncludes”: [34]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;bioIds&lt;/td&gt;     &lt;td&gt;IdList&lt;/td&gt;     &lt;td&gt;\&quot;bioIds”: {\&quot;includes”: [23,34]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;custom###&lt;/td&gt;     &lt;td&gt;Text, Number, Date, Bool, or Option&lt;/td&gt;     &lt;td&gt;\&quot;custom123”: {\&quot;equalTo”: [\&quot;asdf”]}&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;folder&lt;/td&gt;     &lt;td&gt;int64&lt;/td&gt;     &lt;td&gt;\&quot;folder”: 123&lt;/td&gt;   &lt;/tr&gt;   &lt;tr&gt;     &lt;td&gt;primary_language&lt;/td&gt;     &lt;td&gt;PrimaryLanguage&lt;/td&gt;     &lt;td&gt;\&quot;primary_language”: {\&quot;is”: \&quot;fr_CA”}&lt;/td&gt;   &lt;/tr&gt; &lt;/table&gt;  | [optional] 

### Return type

[**LocationsResponse**](LocationsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_bio**
> BioListResponse update_bio(account_id, list_id, vbody)

Bios: Update

Update an existing Bios List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Bio.new # Bio | 


begin
  #Bios: Update
  result = api_instance.update_bio(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->update_bio: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Bio**](Bio.md)|  | 

### Return type

[**BioListResponse**](BioListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_custom_field**
> IdResponse update_custom_field(vaccount_id, custom_field_idbody)

Custom Fields: Update

Updates a single Custom Field in an Account.  Note that the only updatable values in an existing Custom Field are its name, group, description, alternate language behavior, as well as available options if its `type` is `SINGLE_OPTION` or `MULTI_OPTION`.  * If options are modified, every location with that option selected will have the new value.  * If options are deleted, all locations with that option will no longer have that option selected.  * If the deleted options are the only options selected for a location, the location will no longer have a value set for that Custom Field. 

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

api_instance = YextClient::KnowledgeManagerApi.new

v = "20161012" # String | A date in `YYYYMMDD` format.

account_id = "account_id_example" # String | 

custom_field_id = "custom_field_id_example" # String | 

body = YextClient::CustomFieldUpdate.new # CustomFieldUpdate | 


begin
  #Custom Fields: Update
  result = api_instance.update_custom_field(vaccount_id, custom_field_idbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->update_custom_field: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **account_id** | **String**|  | 
 **custom_field_id** | **String**|  | 
 **body** | [**CustomFieldUpdate**](CustomFieldUpdate.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_event**
> EventListResponse update_event(account_id, list_id, vbody)

Events: Update

Update an existing Event List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Event.new # Event | 


begin
  #Events: Update
  result = api_instance.update_event(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->update_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Event**](Event.md)|  | 

### Return type

[**EventListResponse**](EventListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_location**
> IdResponse update_location(account_id, location_id, vlocation_request)

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

location_request = YextClient::Location.new # Location | 


begin
  #Locations: Update
  result = api_instance.update_location(account_id, location_id, vlocation_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->update_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **location_request** | [**Location**](Location.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_menu**
> MenuListResponse update_menu(account_id, list_id, vbody)

Menus: Update

Update an existing Menu.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Menu.new # Menu | 


begin
  #Menus: Update
  result = api_instance.update_menu(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->update_menu: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Menu**](Menu.md)|  | 

### Return type

[**MenuListResponse**](MenuListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_product**
> ProductListResponse update_product(account_id, list_id, vbody)

Products: Update

Update an existing Product List.

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

list_id = "list_id_example" # String | ID of this List.

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Product.new # Product | 


begin
  #Products: Update
  result = api_instance.update_product(account_id, list_id, vbody)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->update_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **list_id** | **String**| ID of this List. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Product**](Product.md)|  | 

### Return type

[**ProductListResponse**](ProductListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **upsert_language_profile**
> ErrorResponse upsert_language_profile(account_id, location_id, language_code, vbody, opts)

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

api_instance = YextClient::KnowledgeManagerApi.new

account_id = "account_id_example" # String | 

location_id = "location_id_example" # String | 

language_code = "language_code_example" # String | Locale code.

v = "20161012" # String | A date in `YYYYMMDD` format.

body = YextClient::Location.new # Location | 

opts = { 
  primary: true # BOOLEAN | When present and set to true, the specified profile will become the location’s primary Language Profile.
}

begin
  #Language Profiles: Upsert
  result = api_instance.upsert_language_profile(account_id, location_id, language_code, vbody, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling KnowledgeManagerApi->upsert_language_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **location_id** | **String**|  | 
 **language_code** | **String**| Locale code. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **body** | [**Location**](Location.md)|  | 
 **primary** | **BOOLEAN**| When present and set to true, the specified profile will become the location’s primary Language Profile. | [optional] 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



