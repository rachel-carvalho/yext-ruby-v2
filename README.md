# yext-client

YextClient - the Ruby gem for the Yext API

# Policies and Conventions  This section gives you the basic information you need to use our APIs.  ## Authentication All requests must be authenticated using an app’s API key.  <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?<b>api_key=API_KEY</b>&v=YYYYMMDD</pre>  The API key should be kept secret, as each app has exactly one API key.  ## Versioning All requests must be versioned using the **`v`** parameter.   <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?api_key=API_KEY&<b>v=YYYYMMDD</b></pre>  The **`v`** parameter (a date in `YYYYMMDD` format) is designed to give you the freedom to adapt to Yext API changes on your own schedule. When you pass this parameter, any changes we made to the API after the specified date will not affect the behavior of the request or the content of the response.  **NOTE:** Yext has the ability to make changes that affect previous versions of the API, if necessary.  ## Serialization API v2 only accepts data in JSON format.  ## Content-Type Headers For all requests that include a request body, the Content-Type header must be included and set to `application/json`.  ## Errors and Warnings There are three kinds of issues that can be reported for a given request:  * **`FATAL_ERROR`**     * An issue caused the entire request to be rejected. * **`NON_FATAL_ERROR`**     * An item is rejected, but other items present in the request are accepted (e.g., one invalid Product List item).      * A field is rejected, but the item otherwise is accepted (e.g., invalid website URL in a Location). * **`WARNING`**     * The request did not adhere to our best practices or recommendations, but the data was accepted anyway (e.g., data was sent that may cause some listings to become unavailable, a deprecated API was used, or we changed the format of a field's content to meet our requirements).  ## Validation Modes *(Available December 2016)*  API v2 will support two request validation modes: *Strict Mode* and *Lenient Mode*.  In Strict Mode, both `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported simply as `FATAL_ERROR`s, and any error will cause the entire request to fail.  In Lenient Mode, `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported as such, and only `FATAL_ERROR`s will cause a request to fail.  All requests will be processed in Strict Mode by default.  To activate Lenient Mode, append the parameter `validation=lenient` to your request URLs.  ### Dates and times * We always use milliseconds since epoch (a.k.a. Unix time) for timestamps (e.g., review creation times, webhook update times). * We always use ISO 8601 without timezone for local date times (e.g., Event start time, Event end time). * Dates are transmitted as strings: `“YYYY-MM-DD”`.  ## Account ID In keeping with RESTful design principles, every URL in API v2 has an account ID prefix. This prefix helps to ensure that you have unique URLs for all resources.  In addition to specifying resources by explicit account ID, the following two macros are defined: * **`me`** - refers to the account that owns the API key sent with the request * **`all`** - refers to the account that owns the API key sent with the request, as well as all sub-accounts (recursively)  **IMPORTANT:** The **`me`** macro is supported in all API methods.  The **`all`** macro will only be supported in certain URLs, as noted in the reference documentation.  ### Examples This URL refers to all locations in account 123. <pre>https://api.yext.com/v2/accounts/<b>123</b>/locations?api_key=456&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456. <pre>https://api.yext.com/v2/accounts/<b>me</b>/locations?<b>api_key=456</b>&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456, as well as all locations from any of its child accounts. <pre>https://api.yext.com/v2/accounts/<b>all</b>/locations?<b>api_key=456</b>&v=20160822</pre>  ## Actor Headers *(Available December 2016)*  To attribute changes to a particular user or employee, all requests may be passed with the following headers.  **NOTE:** If you choose to provide actor headers, and we are unable to authenticate the request using the values you provide, the request will result in an error and fail.  * Attribute activity to Admin user via admin login cookie *(for Yext’s use only)*     * Header: `YextEmployee`     * Value: Admin user’s AlphaLogin cookie * Attribute activity to Admin user via email address and password     * Headers: `YextEmployeeEmail`, `YextEmployeePassword`     * Values: Admin user’s email address, Admin user’s Admin password * Attribute activity to customer user via login cookie     * Header: `YextUser`     * Value: Customer user’s YextAppsLogin cookie * Attribute activity to customer user via email address and password     * Headers: `YextUserEmail`, `YextUserPassword`     * Values: Customer user’s email address, Customer user’s password  Changes will be logged as follows:  * App with no designated actor     * History Entry \"Updated By\" Value: `App [App ID] - ‘[App Name]’`     * Example: `App 432 - ‘Hello World App’` * App with customer user actor     * History Entry \"Updated By\" Value: `[user name] ([user email]) (App [App ID] - ‘[App Name]’)`     * Example: `Jordan Smith (jsmith@example.com) (App 432 - ‘Hello World App’)` * App with Yext employee actor   * History Entry \"Updated By\" Value: `[employee username] (App [App ID] - ‘[App Name]’)`   * Example: `hlerman (App 432 - ‘Hello World App’)`  ## Response Format * **`meta`**     * Response metadata  * **`meta.uuid`**     * Unique ID for this request / response * **`meta.errors[]`**     * List of errors and warnings  * **`meta.errors[].code`**     * Code that uniquely identifies the error or warning  * **`meta.errors[].type`**     * One of:         * `FATAL_ERROR`         * `NON_FATAL_ERROR`         * `WARNING`     * See \"Errors and Warnings\" above for details. * **`meta.errors[].message`**     * An explanation of the issue * **`response`**     * The main content (body) of the response  Example: <pre><code> {     \"meta\": {         \"uuid\": \"bb0c7e19-4dc3-4891-bfa5-8593b1f124ad\",         \"errors\": [             {                 \"code\": ...error code...,                 \"type\": ...error, fatal error, non fatal error, or warning...,                 \"message\": ...explanation of the issue...             }         ]     },     \"response\": {         ...results...     } } </code></pre>  ## Status Codes * `200 OK`    * Either there are no errors or warnings, or the only issues are of type `WARNING`. * `207 Multi-Status`     * There are errors of type `itemError` or `fieldError` (but none of type `requestError`). * `400 Bad Request`     * A parameter is invalid, or a required parameter is missing. This includes the case where no API key is provided and the case where a resource ID is specified incorrectly in a path.     * This status is if any of the response errors are of type `requestError`. * `401 Unauthorized`     * The API key provided is invalid.     * `403 Forbidden`     * The requested information cannot be viewed by the acting user.  * `404 Not Found`     * The endpoint does not exist. * `405 Method Not Allowed`     * The request is using a method that is not allowed (e.g., POST with a GET-only endpoint). * `409 Conflict`     * The request could not be completed in its current state.     * Use the information included in the response to modify the request and retry. * `429 Too Many Requests`     * You have exceeded your rate limit / quota. * `500 Internal Server Error`     * Yext’s servers are not operating as expected. The request is likely valid but should be resent later. * `504 Timeout`     * Yext’s servers took too long to handle this request, and it timed out.  ## Quotas and Rate Limits Default quotas and rate limits are as follows.  * **Location Cloud API** *(includes Analytics, PowerListings®, Location Manager, Reviews, Social, and User endpoints)*: 5,000 requests per hour * **Administrative API**: 1 qps * **Live API**: 100,000 requests per hour  **NOTE:** Webhook requests do not count towards an account’s quota.  For the most current and accurate rate-limit usage information for a particular request type, check the **`RateLimit-Remaining`** and **`RateLimit-Limit`** HTTP headers of your API responses.  If you are currently over your limit, our API will return a `429` error, and the response object returned by our API will be empty. We will also include a **`RateLimit-Reset`** header in the response, which indicates when you will have additional quota.  ## Client- vs. Yext-assigned IDs You can set the ID for the following objects when you create them. If you do not provide an ID, Yext will generate one for you.  * Account * User * Location * Bio List * Menu List * Product List * Event List * Bio List Item * Menu List Item * Product List Item * Event List Item  ## Logging All API requests are logged. API logs can be found in your Developer Console and are stored for 90 days. 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 0.0.2
- Package version: 1.0.0
- Build date: 2016-10-27T14:17:40.242-04:00
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

If the Ruby gem is hosted at a git repository: https://github.com/yext/yext-ruby-v2, then add the following in the Gemfile:

    gem 'yext-client', :git => 'https://github.com/yext/yext-ruby-v2.git'

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

## Documentation for API Endpoints

All URIs are relative to *https://api.yext.com/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*YextClient::AnalyticsApi* | [**activity_log**](docs/AnalyticsApi.md#activity_log) | **POST** /accounts/{accountId}/analytics/activity | Activity Log
*YextClient::AnalyticsApi* | [**create_reports**](docs/AnalyticsApi.md#create_reports) | **GET** /accounts/{accountId}/analytics/reports | Create Reports
*YextClient::AnalyticsApi* | [**get_max_dates**](docs/AnalyticsApi.md#get_max_dates) | **GET** /accounts/{accountId}/analytics/maxdates | Max Dates
*YextClient::AnalyticsApi* | [**report_status**](docs/AnalyticsApi.md#report_status) | **GET** /accounts/{accountId}/analytics/standardreports/{reportId} | Report Status
*YextClient::LocationManagerApi* | [**create_bio**](docs/LocationManagerApi.md#create_bio) | **POST** /accounts/{accountId}/bios | Bios: Create
*YextClient::LocationManagerApi* | [**create_event**](docs/LocationManagerApi.md#create_event) | **POST** /accounts/{accountId}/locations/events | Events: Create
*YextClient::LocationManagerApi* | [**create_location**](docs/LocationManagerApi.md#create_location) | **POST** /accounts/{accountId}/locations | Locations: Create
*YextClient::LocationManagerApi* | [**create_menu**](docs/LocationManagerApi.md#create_menu) | **POST** /accounts/{accountId}/menus | Menus: Create
*YextClient::LocationManagerApi* | [**create_product**](docs/LocationManagerApi.md#create_product) | **POST** /accounts/{accountId}/products | Products: Create
*YextClient::LocationManagerApi* | [**delete_bio_list**](docs/LocationManagerApi.md#delete_bio_list) | **DELETE** /accounts/{accountId}/bios/{listId} | Bios: Delete
*YextClient::LocationManagerApi* | [**delete_event_list**](docs/LocationManagerApi.md#delete_event_list) | **DELETE** /accounts/{accountId}/locations/events/{listId} | Events: Delete
*YextClient::LocationManagerApi* | [**delete_language_profile**](docs/LocationManagerApi.md#delete_language_profile) | **DELETE** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Delete
*YextClient::LocationManagerApi* | [**delete_menu_list**](docs/LocationManagerApi.md#delete_menu_list) | **DELETE** /accounts/{accountId}/menus/{listId} | Menus: Delete
*YextClient::LocationManagerApi* | [**delete_product_list**](docs/LocationManagerApi.md#delete_product_list) | **DELETE** /accounts/{accountId}/locations/products/{listId} | Products: Delete
*YextClient::LocationManagerApi* | [**get_bio**](docs/LocationManagerApi.md#get_bio) | **GET** /accounts/{accountId}/bios/{listId} | Bios: Get
*YextClient::LocationManagerApi* | [**get_bios**](docs/LocationManagerApi.md#get_bios) | **GET** /accounts/{accountId}/bios | Bios: List
*YextClient::LocationManagerApi* | [**get_business_categories**](docs/LocationManagerApi.md#get_business_categories) | **GET** /categories | Categories: List
*YextClient::LocationManagerApi* | [**get_custom_fields**](docs/LocationManagerApi.md#get_custom_fields) | **GET** /accounts/{accountId}/customfields | Custom Fields: List
*YextClient::LocationManagerApi* | [**get_event**](docs/LocationManagerApi.md#get_event) | **GET** /accounts/{accountId}/locations/events/{listId} | Events: Get
*YextClient::LocationManagerApi* | [**get_events**](docs/LocationManagerApi.md#get_events) | **GET** /accounts/{accountId}/locations/events | Events: List
*YextClient::LocationManagerApi* | [**get_google_keywords**](docs/LocationManagerApi.md#get_google_keywords) | **GET** /googlefields | Google Fields: List
*YextClient::LocationManagerApi* | [**get_language_profile**](docs/LocationManagerApi.md#get_language_profile) | **GET** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Get
*YextClient::LocationManagerApi* | [**get_language_profiles**](docs/LocationManagerApi.md#get_language_profiles) | **GET** /accounts/{accountId}/locations/{locationId}/profiles | Language Profiles: List
*YextClient::LocationManagerApi* | [**get_location**](docs/LocationManagerApi.md#get_location) | **GET** /accounts/{accountId}/locations/{locationId} | Locations: Get
*YextClient::LocationManagerApi* | [**get_location_folders**](docs/LocationManagerApi.md#get_location_folders) | **GET** /accounts/{accountId}/folders | Folders: List
*YextClient::LocationManagerApi* | [**get_locations**](docs/LocationManagerApi.md#get_locations) | **GET** /accounts/{accountId}/locations | Locations: List
*YextClient::LocationManagerApi* | [**get_menu**](docs/LocationManagerApi.md#get_menu) | **GET** /accounts/{accountId}/menus/{listId} | Menus: Get
*YextClient::LocationManagerApi* | [**get_menus**](docs/LocationManagerApi.md#get_menus) | **GET** /accounts/{accountId}/menus | Menus: List
*YextClient::LocationManagerApi* | [**get_product**](docs/LocationManagerApi.md#get_product) | **GET** /accounts/{accountId}/locations/products/{listId} | Products: Get
*YextClient::LocationManagerApi* | [**get_products**](docs/LocationManagerApi.md#get_products) | **GET** /accounts/{accountId}/products | Products: List
*YextClient::LocationManagerApi* | [**update_bio**](docs/LocationManagerApi.md#update_bio) | **PUT** /accounts/{accountId}/bios/{listId} | Bios: Update
*YextClient::LocationManagerApi* | [**update_event**](docs/LocationManagerApi.md#update_event) | **PUT** /accounts/{accountId}/locations/events/{listId} | Events: Update
*YextClient::LocationManagerApi* | [**update_location**](docs/LocationManagerApi.md#update_location) | **PUT** /accounts/{accountId}/locations/{locationId} | Locations: Update
*YextClient::LocationManagerApi* | [**update_menu**](docs/LocationManagerApi.md#update_menu) | **PUT** /accounts/{accountId}/menus/{listId} | Menus: Update
*YextClient::LocationManagerApi* | [**update_product**](docs/LocationManagerApi.md#update_product) | **PUT** /accounts/{accountId}/locations/products/{listId} | Products: Update
*YextClient::LocationManagerApi* | [**upsert_language_profile**](docs/LocationManagerApi.md#upsert_language_profile) | **PUT** /accounts/{accountId}/locations/{locationId}/profiles/{language_code} | Language Profiles: Upsert
*YextClient::PowerListingsApi* | [**create_duplicate**](docs/PowerListingsApi.md#create_duplicate) | **POST** /accounts/{accountId}/powerlistings/duplicates | Duplicates: Create
*YextClient::PowerListingsApi* | [**delete_duplicate**](docs/PowerListingsApi.md#delete_duplicate) | **DELETE** /accounts/{accountId}/powerlistings/duplicates/{duplicateId} | Duplicates: Delete
*YextClient::PowerListingsApi* | [**get_publisher_suggestion**](docs/PowerListingsApi.md#get_publisher_suggestion) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Get
*YextClient::PowerListingsApi* | [**list_duplicates**](docs/PowerListingsApi.md#list_duplicates) | **GET** /accounts/{accountId}/powerlistings/duplicates | Duplicates: List
*YextClient::PowerListingsApi* | [**list_listings**](docs/PowerListingsApi.md#list_listings) | **GET** /accounts/{accountId}/powerlistings/listings | Listings: List
*YextClient::PowerListingsApi* | [**list_publisher_suggestions**](docs/PowerListingsApi.md#list_publisher_suggestions) | **GET** /accounts/{accountId}/powerlistings/publishersuggestions | Publisher Suggestions: List
*YextClient::PowerListingsApi* | [**list_publishers**](docs/PowerListingsApi.md#list_publishers) | **GET** /accounts/{accountId}/powerlistings/publishers | Publishers: List
*YextClient::PowerListingsApi* | [**opt_in_listings**](docs/PowerListingsApi.md#opt_in_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optin | Listings: Opt In
*YextClient::PowerListingsApi* | [**opt_out_listings**](docs/PowerListingsApi.md#opt_out_listings) | **PUT** /accounts/{accountId}/powerlistings/listings/optout | Listings: Opt Out
*YextClient::PowerListingsApi* | [**suppress_duplicate**](docs/PowerListingsApi.md#suppress_duplicate) | **PUT** /accounts/{accountId}/powerlistings/duplicates/{duplicateId} | Duplicates: Suppress
*YextClient::PowerListingsApi* | [**update_publisher_suggestion**](docs/PowerListingsApi.md#update_publisher_suggestion) | **PUT** /accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId} | Publisher Suggestions: Update
*YextClient::ReviewsApi* | [**create_comment**](docs/ReviewsApi.md#create_comment) | **POST** /accounts/{accountId}/reviews/{reviewId}/comments | Comments: Create
*YextClient::ReviewsApi* | [**get_review**](docs/ReviewsApi.md#get_review) | **GET** /accounts/{accountId}/reviews/{reviewId} | Reviews: Get
*YextClient::ReviewsApi* | [**list_reviews**](docs/ReviewsApi.md#list_reviews) | **GET** /accounts/{accountId}/reviews | Reviews: List
*YextClient::UserApi* | [**create_user**](docs/UserApi.md#create_user) | **POST** /accounts/{accountId}/users | Users: Create
*YextClient::UserApi* | [**delete_user**](docs/UserApi.md#delete_user) | **DELETE** /accounts/{accountId}/users/{userId} | Users: Delete
*YextClient::UserApi* | [**get_link_optimization_task**](docs/UserApi.md#get_link_optimization_task) | **GET** /accounts/{accountId}/optimizationlink | Optimization Tasks: Get Link
*YextClient::UserApi* | [**get_optimization_tasks**](docs/UserApi.md#get_optimization_tasks) | **GET** /accounts/{accountId}/optimizationtasks | Optimization Tasks: List
*YextClient::UserApi* | [**get_roles**](docs/UserApi.md#get_roles) | **GET** /accounts/{accountId}/roles | Roles: Get
*YextClient::UserApi* | [**get_user**](docs/UserApi.md#get_user) | **GET** /accounts/{accountId}/users/{userId} | Users: Get
*YextClient::UserApi* | [**get_users**](docs/UserApi.md#get_users) | **GET** /accounts/{accountId}/users | Users: List
*YextClient::UserApi* | [**update_user**](docs/UserApi.md#update_user) | **PUT** /accounts/{accountId}/users/{userId} | Users: Update


## Documentation for Models

 - [YextClient::Activity](docs/Activity.md)
 - [YextClient::ActivityFilter](docs/ActivityFilter.md)
 - [YextClient::ActivityLogRequest](docs/ActivityLogRequest.md)
 - [YextClient::AnalyticsFilter](docs/AnalyticsFilter.md)
 - [YextClient::BaseEcl](docs/BaseEcl.md)
 - [YextClient::BaseEclItem](docs/BaseEclItem.md)
 - [YextClient::BaseEclSection](docs/BaseEclSection.md)
 - [YextClient::Bio](docs/Bio.md)
 - [YextClient::BioItem](docs/BioItem.md)
 - [YextClient::BioSection](docs/BioSection.md)
 - [YextClient::Calories](docs/Calories.md)
 - [YextClient::Category](docs/Category.md)
 - [YextClient::ContentListCost](docs/ContentListCost.md)
 - [YextClient::ContentListCostOption](docs/ContentListCostOption.md)
 - [YextClient::ContentListPhoto](docs/ContentListPhoto.md)
 - [YextClient::CreateReportRequestBody](docs/CreateReportRequestBody.md)
 - [YextClient::CustomField](docs/CustomField.md)
 - [YextClient::CustomOption](docs/CustomOption.md)
 - [YextClient::Duplicate](docs/Duplicate.md)
 - [YextClient::DuplicateUnavailableReason](docs/DuplicateUnavailableReason.md)
 - [YextClient::Event](docs/Event.md)
 - [YextClient::EventItem](docs/EventItem.md)
 - [YextClient::EventSection](docs/EventSection.md)
 - [YextClient::Folder](docs/Folder.md)
 - [YextClient::GoogleCategory](docs/GoogleCategory.md)
 - [YextClient::GoogleField](docs/GoogleField.md)
 - [YextClient::GoogleOption](docs/GoogleOption.md)
 - [YextClient::InlineResponse200](docs/InlineResponse200.md)
 - [YextClient::InlineResponse2001](docs/InlineResponse2001.md)
 - [YextClient::InlineResponse20010](docs/InlineResponse20010.md)
 - [YextClient::InlineResponse20011](docs/InlineResponse20011.md)
 - [YextClient::InlineResponse20011Response](docs/InlineResponse20011Response.md)
 - [YextClient::InlineResponse20012](docs/InlineResponse20012.md)
 - [YextClient::InlineResponse20012Response](docs/InlineResponse20012Response.md)
 - [YextClient::InlineResponse20013](docs/InlineResponse20013.md)
 - [YextClient::InlineResponse20013Response](docs/InlineResponse20013Response.md)
 - [YextClient::InlineResponse20014](docs/InlineResponse20014.md)
 - [YextClient::InlineResponse20014Response](docs/InlineResponse20014Response.md)
 - [YextClient::InlineResponse20015](docs/InlineResponse20015.md)
 - [YextClient::InlineResponse20015Response](docs/InlineResponse20015Response.md)
 - [YextClient::InlineResponse20016](docs/InlineResponse20016.md)
 - [YextClient::InlineResponse20016Response](docs/InlineResponse20016Response.md)
 - [YextClient::InlineResponse20017](docs/InlineResponse20017.md)
 - [YextClient::InlineResponse20017Response](docs/InlineResponse20017Response.md)
 - [YextClient::InlineResponse20018](docs/InlineResponse20018.md)
 - [YextClient::InlineResponse20019](docs/InlineResponse20019.md)
 - [YextClient::InlineResponse20019Response](docs/InlineResponse20019Response.md)
 - [YextClient::InlineResponse2001Response](docs/InlineResponse2001Response.md)
 - [YextClient::InlineResponse2002](docs/InlineResponse2002.md)
 - [YextClient::InlineResponse20020](docs/InlineResponse20020.md)
 - [YextClient::InlineResponse20021](docs/InlineResponse20021.md)
 - [YextClient::InlineResponse20021Response](docs/InlineResponse20021Response.md)
 - [YextClient::InlineResponse20022](docs/InlineResponse20022.md)
 - [YextClient::InlineResponse20022Response](docs/InlineResponse20022Response.md)
 - [YextClient::InlineResponse20023](docs/InlineResponse20023.md)
 - [YextClient::InlineResponse20024](docs/InlineResponse20024.md)
 - [YextClient::InlineResponse20024Response](docs/InlineResponse20024Response.md)
 - [YextClient::InlineResponse20025](docs/InlineResponse20025.md)
 - [YextClient::InlineResponse20025Response](docs/InlineResponse20025Response.md)
 - [YextClient::InlineResponse20026](docs/InlineResponse20026.md)
 - [YextClient::InlineResponse20026Response](docs/InlineResponse20026Response.md)
 - [YextClient::InlineResponse20027](docs/InlineResponse20027.md)
 - [YextClient::InlineResponse20027Response](docs/InlineResponse20027Response.md)
 - [YextClient::InlineResponse2002Response](docs/InlineResponse2002Response.md)
 - [YextClient::InlineResponse2003](docs/InlineResponse2003.md)
 - [YextClient::InlineResponse2003Response](docs/InlineResponse2003Response.md)
 - [YextClient::InlineResponse2004](docs/InlineResponse2004.md)
 - [YextClient::InlineResponse2004Response](docs/InlineResponse2004Response.md)
 - [YextClient::InlineResponse2005](docs/InlineResponse2005.md)
 - [YextClient::InlineResponse2005Response](docs/InlineResponse2005Response.md)
 - [YextClient::InlineResponse2006](docs/InlineResponse2006.md)
 - [YextClient::InlineResponse2006Response](docs/InlineResponse2006Response.md)
 - [YextClient::InlineResponse2007](docs/InlineResponse2007.md)
 - [YextClient::InlineResponse2007Response](docs/InlineResponse2007Response.md)
 - [YextClient::InlineResponse2008](docs/InlineResponse2008.md)
 - [YextClient::InlineResponse2008Response](docs/InlineResponse2008Response.md)
 - [YextClient::InlineResponse2009](docs/InlineResponse2009.md)
 - [YextClient::InlineResponse200Response](docs/InlineResponse200Response.md)
 - [YextClient::InlineResponse201](docs/InlineResponse201.md)
 - [YextClient::InlineResponse2011](docs/InlineResponse2011.md)
 - [YextClient::InlineResponse2011Response](docs/InlineResponse2011Response.md)
 - [YextClient::InlineResponse2012](docs/InlineResponse2012.md)
 - [YextClient::InlineResponse2013](docs/InlineResponse2013.md)
 - [YextClient::InlineResponse2014](docs/InlineResponse2014.md)
 - [YextClient::InlineResponse2015](docs/InlineResponse2015.md)
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
 - [YextClient::Menu](docs/Menu.md)
 - [YextClient::MenuItem](docs/MenuItem.md)
 - [YextClient::MenuSection](docs/MenuSection.md)
 - [YextClient::OptimizationTask](docs/OptimizationTask.md)
 - [YextClient::Photos](docs/Photos.md)
 - [YextClient::Product](docs/Product.md)
 - [YextClient::ProductItem](docs/ProductItem.md)
 - [YextClient::ProductSection](docs/ProductSection.md)
 - [YextClient::Publisher](docs/Publisher.md)
 - [YextClient::PublisherAlternateBrands](docs/PublisherAlternateBrands.md)
 - [YextClient::PublisherSuggestion](docs/PublisherSuggestion.md)
 - [YextClient::ResponseError](docs/ResponseError.md)
 - [YextClient::ResponseMeta](docs/ResponseMeta.md)
 - [YextClient::Review](docs/Review.md)
 - [YextClient::ReviewComment](docs/ReviewComment.md)
 - [YextClient::Role](docs/Role.md)
 - [YextClient::Url](docs/Url.md)
 - [YextClient::User](docs/User.md)
 - [YextClient::UserAcl](docs/UserAcl.md)
 - [YextClient::Video](docs/Video.md)


## Documentation for Authorization


### api_key

- **Type**: API key
- **API key parameter name**: api_key
- **Location**: URL query string

