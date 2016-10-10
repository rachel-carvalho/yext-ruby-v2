# yext-client

YextClient - the Ruby gem for the Yext API

# Policies and Conventions  This section gives you the basic information you need to use our APIs.  ## Authentication All requests must be authenticated using an app’s API key.  <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?<b>api_key=API_KEY</b>&v=YYYYMMDD</pre>  The API key should be kept secret, as each app has exactly one API key.  ## Versioning All requests must be versioned using the v parameter.   <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?api_key=API_KEY&<b>v=YYYYMMDD</b></pre>  The **`v`** parameter (a date in `YYYYMMDD` format) is designed to give you the freedom to adapt to Yext API changes on your own schedule. When you pass this parameter, any changes we made to the API after the specified date will not affect the behavior of the request or the content of the response.  **NOTE:** Yext has the ability to make changes that affect previous versions of the API, if necessary.  ## Errors and Warnings There are three kinds of issues that can be reported for a given request:  * **`FATAL_ERROR`**     * An issue caused the entire request to be rejected. * **`NON_FATAL_ERROR`**     * An item is rejected, but other items present in the request are accepted (e.g., one invalid Product List item).      * A field is rejected, but the item otherwise is accepted (e.g., invalid website URL in a Location). * **`WARNING`**     * The request did not adhere to our best practices or recommendations, but the data was accepted anyway (e.g., data was sent that may cause some listings to become unavailable, a deprecated API was used, or we changed the format of a field's content to meet our requirements).  ## Validation Modes API v2 will support two request validation modes: *Strict Mode* and *Lenient Mode*.  In Strict Mode, both `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported simply as `FATAL_ERROR`s, and any error will cause the entire request to fail.  In Lenient Mode, `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported as such, and only `FATAL_ERROR`s will cause a request to fail.  All requests will be processed in Strict Mode by default.  To activate Lenient Mode, append the parameter `validation=lenient` to your request URLs.  ## Serialization API v2 only accepts data in JSON format.  ### Dates and times * We always use milliseconds since epoch (a.k.a. Unix time) for timestamps (e.g., review creation times, webhook update times). * We always use ISO 8601 without timezone for local date times (e.g., Event start time, Event end time). * Dates are transmitted as strings: `“YYYY-MM-DD”`.  ## Account ID In keeping with RESTful design principles, every URL in API v2 has an account ID prefix. This prefix helps to ensure that you have unique URLs for all resources.  In addition to specifying resources by explicit account ID, the following two macros are defined: * **`me`** - refers to the account that owns the API key sent with the request * **`all`** - refers to the account that owns the API key sent with the request, as well as all sub-accounts (recursively)  **IMPORTANT:** The **`me`** macro is supported in all API methods.  The **`all`** macro will only be supported in certain URLs, as noted in the reference documentation.  ### Examples This URL refers to all locations in account 123. <pre>https://api.yext.com/v2/accounts/<b>123</b>/locations?api_key=456&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456. <pre>https://api.yext.com/v2/accounts/<b>me</b>/locations?<b>api_key=456</b>&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456, as well as all locations from any of its child accounts. <pre>https://api.yext.com/v2/accounts/<b>all</b>/locations?<b>api_key=456</b>&v=20160822</pre>  ## Actor Headers To attribute changes to a particular user or employee, all requests may be passed with the following headers.  **NOTE:** If you choose to provide actor headers, and we are unable to authenticate the request using the values you provide, the request will result in an error and fail.  * Attribute activity to Admin user via admin login cookie *(for Yext’s use only)*     * Header: `YextEmployee`     * Value: Admin user’s AlphaLogin cookie * Attribute activity to Admin user via email address and password     * Headers: `YextEmployeeEmail`, `YextEmployeePassword`     * Values: Admin user’s email address, Admin user’s Admin password * Attribute activity to customer user via login cookie     * Header: `YextUser`     * Value: Customer user’s YextAppsLogin cookie * Attribute activity to customer user via email address and password     * Headers: `YextUserEmail`, `YextUserPassword`     * Values: Customer user’s email address, Customer user’s password  Changes will be logged as follows:  * App with no designated actor     * History Entry \"Updated By\" Value: `App [App ID] - ‘[App Name]’`     * Example: `App 432 - ‘Hello World App’` * App with customer user actor     * History Entry \"Updated By\" Value: `[user name] ([user email]) (App [App ID] - ‘[App Name]’)`     * Example: `Jordan Smith (jsmith@example.com) (App 432 - ‘Hello World App’)` * App with Yext employee actor## Response Format   * History Entry \"Updated By\" Value: `[employee username] (App [App ID] - ‘[App Name]’)`   * Example: `hlerman (App 432 - ‘Hello World App’)`  ## Response Format * **`meta`**     * Response metadata  * **`meta.uuid`**     * Unique ID for this request / response * **`meta.errors[]`**     * List of errors and warnings  * **`meta.errors[].code`**     * Code that uniquely identifies the error or warning  * **`meta.errors[].type`**     * One of:         * `FATAL_ERROR`         * `NON_FATAL_ERROR`         * `WARNING`     * See \"Errors and Warnings\" above for details. * **`meta.errors[].message`**     *  An explanation of the issue * **`response`**     * An explanation of the issue   Example: <pre><code> {     \"meta\": {         \"uuid\": \"bb0c7e19-4dc3-4891-bfa5-8593b1f124ad\",         \"errors\": [             {                 \"code\": ...error code...,                 \"type\": ...error, fatal error, non fatal error, or warning...,                 \"message\": ...explanation of the issue...             }         ]     },     \"response\": {         ...results...     } } </code></pre>  ## Status Codes * `200 OK`    * Either there are no errors or warnings, or the only issues are of type `WARNING`. * `207 Multi-Status`     * There are errors of type `itemError` or `fieldError` (but none of type `requestError`). * `400 Bad Request`     * A parameter is invalid, or a required parameter is missing. This includes the case where no API key is provided and the case where a resource ID is specified incorrectly in a path.     * This status is if any of the response errors are of type `requestError`. * `401 Unauthorized`     * The API key provided is invalid.     * `403 Forbidden`     * The requested information cannot be viewed by the acting user.  * `404 Not Found`     * The endpoint does not exist. * `405 Method Not Allowed`     * The request is using a method that is not allowed (e.g., POST with a GET-only endpoint). * `409 Conflict`     * The request could not be completed in its current state.     * Use the information included in the response to modify the request and retry. * `429 Too Many Requests`     * You have exceeded your rate limit / quota. * `500 Internal Server Error`     * Yext’s servers are not operating as expected. The request is likely valid but should be resent later. * `504 Timeout`     * Yext’s servers took too long to handle this request, and it timed out.  ## Quotas and Rate Limits Default quotas and rate limits are as follows.  * **Location Cloud API** *(includes Analytics, PowerListings, Location Manager, Reviews, Social, and User endpoints)*: 5,000 requests per hour * **Administrative API**: 1 qps * **Live API**: 100,000 requests per hour  **NOTE:** Webhook requests do not count towards an account’s quota.  For the most current and accurate rate-limit usage information for a particular request type, check the **`RateLimit-Remaining`** and **`RateLimit-Limit`** HTTP headers of your API responses.  If you are currently over your limit, our API will return a `429` error, and the response object returned by our API will be empty. We will also include a **`RateLimit-Reset`** header in the response, which indicates when you will have additional quota.  ## Client- vs. Yext-assigned IDs You can set the ID for the following objects when you create them. If you do not provide an ID, Yext will generate one for you.  * Account * User * Location * Bio List * Menu List * Product List * Event List * Bio List Item * Menu List Item * Product List Item * Event List Item  ## Logging All API requests are logged, and can be found in your Developer Console.  API logs are stored for 90 days. 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 0.0.2
- Package version: 1.0.0
- Build date: 2016-10-10T17:53:51.466-04:00
- Build package: class io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build yext-client.gemspec
```

Then either install the gem locally:

```shell
gem install ./yext-client-1.0.0.gem
```
(for development, run `gem install --dev ./yext-client-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'yext-client', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'yext-client', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'yext-client'

# Setup authorization
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

## Documentation for API Endpoints

All URIs are relative to *https://api.yext.com/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*YextClient::ListingsApi* | [**get_publisher_suggestion**](docs/ListingsApi.md#get_publisher_suggestion) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Get
*YextClient::ListingsApi* | [**list_listings**](docs/ListingsApi.md#list_listings) | **GET** /accounts/{accountId}/powerlistings/listings | Listings: List
*YextClient::ListingsApi* | [**list_publisher_suggestions**](docs/ListingsApi.md#list_publisher_suggestions) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions | Publisher Suggestions: List
*YextClient::ListingsApi* | [**list_publishers**](docs/ListingsApi.md#list_publishers) | **GET** /accounts/{accountId}/powerlistings/publishers | Publishers: List
*YextClient::ListingsApi* | [**opt_in_listings**](docs/ListingsApi.md#opt_in_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optin | Listings: Opt In
*YextClient::ListingsApi* | [**opt_out_listings**](docs/ListingsApi.md#opt_out_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optout | Listings: Opt Out
*YextClient::ListingsApi* | [**update_publisher_suggestion**](docs/ListingsApi.md#update_publisher_suggestion) | **PUT** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Update
*YextClient::LocationsApi* | [**create_location**](docs/LocationsApi.md#create_location) | **POST** /accounts/{accountId}/locations | Locations: Create
*YextClient::LocationsApi* | [**get_business_categories**](docs/LocationsApi.md#get_business_categories) | **GET** /categories | Categories: List
*YextClient::LocationsApi* | [**get_custom_fields**](docs/LocationsApi.md#get_custom_fields) | **GET** /accounts/{accountId}/customfields | Custom Fields: List
*YextClient::LocationsApi* | [**get_google_keywords**](docs/LocationsApi.md#get_google_keywords) | **GET** /googlefields | Google Fields: List
*YextClient::LocationsApi* | [**get_location**](docs/LocationsApi.md#get_location) | **GET** /accounts/{accountId}/locations/{locationId} | Locations: Get
*YextClient::LocationsApi* | [**get_location_folders**](docs/LocationsApi.md#get_location_folders) | **GET** /accounts/{accountId}/folders | Folders: List
*YextClient::LocationsApi* | [**get_locations**](docs/LocationsApi.md#get_locations) | **GET** /accounts/{accountId}/locations | Locations: List
*YextClient::LocationsApi* | [**update_location**](docs/LocationsApi.md#update_location) | **PUT** /accounts/{accountId}/locations/{locationId} | Locations: Update


## Documentation for Models

 - [YextClient::Category](docs/Category.md)
 - [YextClient::CustomField](docs/CustomField.md)
 - [YextClient::CustomOption](docs/CustomOption.md)
 - [YextClient::Folder](docs/Folder.md)
 - [YextClient::GoogleCategory](docs/GoogleCategory.md)
 - [YextClient::GoogleField](docs/GoogleField.md)
 - [YextClient::GoogleOption](docs/GoogleOption.md)
 - [YextClient::InlineResponse200](docs/InlineResponse200.md)
 - [YextClient::InlineResponse2001](docs/InlineResponse2001.md)
 - [YextClient::InlineResponse2001Response](docs/InlineResponse2001Response.md)
 - [YextClient::InlineResponse2002](docs/InlineResponse2002.md)
 - [YextClient::InlineResponse2002Response](docs/InlineResponse2002Response.md)
 - [YextClient::InlineResponse2003](docs/InlineResponse2003.md)
 - [YextClient::InlineResponse2003Response](docs/InlineResponse2003Response.md)
 - [YextClient::InlineResponse2004](docs/InlineResponse2004.md)
 - [YextClient::InlineResponse2005](docs/InlineResponse2005.md)
 - [YextClient::InlineResponse2005Response](docs/InlineResponse2005Response.md)
 - [YextClient::InlineResponse2006](docs/InlineResponse2006.md)
 - [YextClient::InlineResponse2007](docs/InlineResponse2007.md)
 - [YextClient::InlineResponse2007Response](docs/InlineResponse2007Response.md)
 - [YextClient::InlineResponse2008](docs/InlineResponse2008.md)
 - [YextClient::InlineResponse2008Response](docs/InlineResponse2008Response.md)
 - [YextClient::InlineResponse200Response](docs/InlineResponse200Response.md)
 - [YextClient::InlineResponse201](docs/InlineResponse201.md)
 - [YextClient::InlineResponseDefault](docs/InlineResponseDefault.md)
 - [YextClient::Listing](docs/Listing.md)
 - [YextClient::ListingStatusDetail](docs/ListingStatusDetail.md)
 - [YextClient::Location](docs/Location.md)
 - [YextClient::LocationClosed](docs/LocationClosed.md)
 - [YextClient::LocationEducationList](docs/LocationEducationList.md)
 - [YextClient::LocationGoogleAttributes](docs/LocationGoogleAttributes.md)
 - [YextClient::LocationHolidayHours](docs/LocationHolidayHours.md)
 - [YextClient::LocationPhoto](docs/LocationPhoto.md)
 - [YextClient::LocationServiceArea](docs/LocationServiceArea.md)
 - [YextClient::LocationType](docs/LocationType.md)
 - [YextClient::Publisher](docs/Publisher.md)
 - [YextClient::PublisherAlternateBrands](docs/PublisherAlternateBrands.md)
 - [YextClient::PublisherSuggestion](docs/PublisherSuggestion.md)
 - [YextClient::ResponseError](docs/ResponseError.md)
 - [YextClient::ResponseMeta](docs/ResponseMeta.md)


## Documentation for Authorization


### api_key

- **Type**: API key
- **API key parameter name**: api_key
- **Location**: URL query string

