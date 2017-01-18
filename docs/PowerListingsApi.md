# YextClient::PowerListingsApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_duplicate**](PowerListingsApi.md#create_duplicate) | **POST** /accounts/{accountId}/powerlistings/duplicates | Duplicates: Create (January 2017)
[**delete_duplicate**](PowerListingsApi.md#delete_duplicate) | **DELETE** /accounts/{accountId}/powerlistings/duplicates/{duplicateId} | Duplicates: Delete (January 2017)
[**get_publisher_suggestion**](PowerListingsApi.md#get_publisher_suggestion) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Get
[**list_duplicates**](PowerListingsApi.md#list_duplicates) | **GET** /accounts/{accountId}/powerlistings/duplicates | Duplicates: List (January 2017)
[**list_listings**](PowerListingsApi.md#list_listings) | **GET** /accounts/{accountId}/powerlistings/listings | Listings: List
[**list_publisher_suggestions**](PowerListingsApi.md#list_publisher_suggestions) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions | Publisher Suggestions: List
[**list_publishers**](PowerListingsApi.md#list_publishers) | **GET** /accounts/{accountId}/powerlistings/publishers | Publishers: List
[**opt_in_listings**](PowerListingsApi.md#opt_in_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optin | Listings: Opt In
[**opt_out_listings**](PowerListingsApi.md#opt_out_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optout | Listings: Opt Out
[**suppress_duplicate**](PowerListingsApi.md#suppress_duplicate) | **PUT** /accounts/{accountId}/powerlistings/duplicates/{duplicateId} | Duplicates: Suppress (January 2017)
[**update_publisher_suggestion**](PowerListingsApi.md#update_publisher_suggestion) | **PUT** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Update


# **create_duplicate**
> IdResponse create_duplicate(account_id, vurl, opts)

Duplicates: Create (January 2017)

Creates a new Duplicate with status SUPPRESSION_REQUESTED

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

url = "url_example" # String | URL of the Duplicate listing

opts = { 
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
}

begin
  #Duplicates: Create (January 2017)
  result = api_instance.create_duplicate(account_id, vurl, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->create_duplicate: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **url** | **String**| URL of the Duplicate listing | 
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP  | [optional] 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_duplicate**
> ErrorResponse delete_duplicate(account_id, vduplicate_id)

Duplicates: Delete (January 2017)

Indicates that a Duplicate should be ignored

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

duplicate_id = "duplicate_id_example" # String | 


begin
  #Duplicates: Delete (January 2017)
  result = api_instance.delete_duplicate(account_id, vduplicate_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->delete_duplicate: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **duplicate_id** | **String**|  | 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_publisher_suggestion**
> PublisherSuggestionResponse get_publisher_suggestion(account_id, vsuggestion_id, )

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

suggestion_id = "suggestion_id_example" # String | 


begin
  #Publisher Suggestions: Get
  result = api_instance.get_publisher_suggestion(account_id, vsuggestion_id, )
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->get_publisher_suggestion: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **suggestion_id** | **String**|  | 

### Return type

[**PublisherSuggestionResponse**](PublisherSuggestionResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_duplicates**
> DuplicatesResponse list_duplicates(account_id, v, opts)

Duplicates: List (January 2017)

Retrieve Duplicates for an account

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results.
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  statuses: ["statuses_example"] # Array<String> | When specified, only Duplicates with the provided statuses will be returned  **Example:** POSSIBLE_DUPLICATE,SUPPRESSION_REQUESTED 
}

begin
  #Duplicates: List (January 2017)
  result = api_instance.list_duplicates(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->list_duplicates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return | [optional] [default to 10]
 **offset** | **Integer**| Number of results to skip. Used to page through results. | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP  | [optional] 
 **statuses** | [**Array&lt;String&gt;**](String.md)| When specified, only Duplicates with the provided statuses will be returned  **Example:** POSSIBLE_DUPLICATE,SUPPRESSION_REQUESTED  | [optional] 

### Return type

[**DuplicatesResponse**](DuplicatesResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_listings**
> ListingsResponse list_listings(account_id, v, opts)

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 100, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results.
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  language: "en" # String | One of the language codes that we support: - cs - Czech - da - Danish - nl - Dutch - en - English - en_GB - English (UK) - fi - Finnish - fr - French (France) - de - German (Germany) - hu - Hungarian - it - Italian - ja - Japanese - no - Norwegian - pt - Portuguese (Portugal) - sk - Slovak - es - Spanish (Spain) - sv - Swedish - tr - Turkish - zh_Hans - Chinese (Simplified) - zh_Hant - Chinese (Traditional) 
}

begin
  #Listings: List
  result = api_instance.list_listings(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->list_listings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return | [optional] [default to 100]
 **offset** | **Integer**| Number of results to skip. Used to page through results. | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP  | [optional] 
 **language** | **String**| One of the language codes that we support: - cs - Czech - da - Danish - nl - Dutch - en - English - en_GB - English (UK) - fi - Finnish - fr - French (France) - de - German (Germany) - hu - Hungarian - it - Italian - ja - Japanese - no - Norwegian - pt - Portuguese (Portugal) - sk - Slovak - es - Spanish (Spain) - sv - Swedish - tr - Turkish - zh_Hans - Chinese (Simplified) - zh_Hant - Chinese (Traditional)  | [optional] [default to en]

### Return type

[**ListingsResponse**](ListingsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_publisher_suggestions**
> PublisherSuggestionsResponse list_publisher_suggestions(account_id, v, opts)

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return
  offset: 0 # Integer | Number of results to skip. Used to page through results.
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  statuses: ["statuses_example"] # Array<String> | When specified, only Publisher Suggestions with the provided statuses will be returned  **Example:** WAITING_ON_CUSTOMER,EXPIRED 
}

begin
  #Publisher Suggestions: List
  result = api_instance.list_publisher_suggestions(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->list_publisher_suggestions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return | [optional] [default to 10]
 **offset** | **Integer**| Number of results to skip. Used to page through results. | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP  | [optional] 
 **statuses** | [**Array&lt;String&gt;**](String.md)| When specified, only Publisher Suggestions with the provided statuses will be returned  **Example:** WAITING_ON_CUSTOMER,EXPIRED  | [optional] 

### Return type

[**PublisherSuggestionsResponse**](PublisherSuggestionsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_publishers**
> PublishersResponse list_publishers(account_id, v, opts)

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  subset: "RELEVANT_ONLY" # String | **ALL** - return all publishers  **RELEVANT_ONLY** - only return publishers relevant to the account based on supported countries and location types 
}

begin
  #Publishers: List
  result = api_instance.list_publishers(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->list_publishers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **subset** | **String**| **ALL** - return all publishers  **RELEVANT_ONLY** - only return publishers relevant to the account based on supported countries and location types  | [optional] [default to RELEVANT_ONLY]

### Return type

[**PublishersResponse**](PublishersResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **opt_in_listings**
> ErrorResponse opt_in_listings(account_id, v, opts)

Listings: Opt In

Opts designated locations into designated publishers  **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you will receive a 400 error response. 

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
}

begin
  #Listings: Opt In
  result = api_instance.opt_in_listings(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->opt_in_listings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP  | [optional] 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **opt_out_listings**
> ErrorResponse opt_out_listings(account_id, v, opts)

Listings: Opt Out

Opts designated locations out of designated publishers  **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you will receive a 400 error response. 

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
}

begin
  #Listings: Opt Out
  result = api_instance.opt_out_listings(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->opt_out_listings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP  | [optional] 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **suppress_duplicate**
> ErrorResponse suppress_duplicate(account_id, vduplicate_id)

Duplicates: Suppress (January 2017)

Request suppression of a Duplicate

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

duplicate_id = "duplicate_id_example" # String | 


begin
  #Duplicates: Suppress (January 2017)
  result = api_instance.suppress_duplicate(account_id, vduplicate_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->suppress_duplicate: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **duplicate_id** | **String**|  | 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_publisher_suggestion**
> ErrorResponse update_publisher_suggestion(account_id, vsuggestion_id, status)

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

api_instance = YextClient::PowerListingsApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

suggestion_id = "suggestion_id_example" # String | 

status = "status_example" # String | The status of the Publisher Suggestion


begin
  #Publisher Suggestions: Update
  result = api_instance.update_publisher_suggestion(account_id, vsuggestion_id, status)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling PowerListingsApi->update_publisher_suggestion: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **suggestion_id** | **String**|  | 
 **status** | **String**| The status of the Publisher Suggestion | 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



