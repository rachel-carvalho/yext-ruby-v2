=begin
#Yext API

## Policies and Conventions  This section gives you the basic information you need to use our APIs.  ## Authentication All requests must be authenticated using an app’s API key.  <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?<b>api_key=API_KEY</b>&v=YYYYMMDD</pre>  The API key should be kept secret, as each app has exactly one API key.  ## Versioning All requests must be versioned using the **`v`** parameter.   <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?api_key=API_KEY&<b>v=YYYYMMDD</b></pre>  The **`v`** parameter (a date in `YYYYMMDD` format) is designed to give you the freedom to adapt to Yext API changes on your own schedule. When you pass this parameter, any changes we made to the API after the specified date will not affect the behavior of the request or the content of the response.  **NOTE:** Yext has the ability to make changes that affect previous versions of the API, if necessary.  ## Serialization API v2 only accepts data in JSON format.  ## Content-Type Headers For all requests that include a request body, the Content-Type header must be included and set to `application/json`.  ## Errors and Warnings There are three kinds of issues that can be reported for a given request:  * **`FATAL_ERROR`**     * An issue caused the entire request to be rejected. * **`NON_FATAL_ERROR`**     * An item is rejected, but other items present in the request are accepted (e.g., one invalid Product List item).      * A field is rejected, but the item otherwise is accepted (e.g., invalid website URL in a Location). * **`WARNING`**     * The request did not adhere to our best practices or recommendations, but the data was accepted anyway (e.g., data was sent that may cause some listings to become unavailable, a deprecated API was used, or we changed the format of a field's content to meet our requirements).  ## Validation Modes *(Available December 2016)*  API v2 will support two request validation modes: *Strict Mode* and *Lenient Mode*.  In Strict Mode, both `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported simply as `FATAL_ERROR`s, and any error will cause the entire request to fail.  In Lenient Mode, `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported as such, and only `FATAL_ERROR`s will cause a request to fail.  All requests will be processed in Strict Mode by default.  To activate Lenient Mode, append the parameter `validation=lenient` to your request URLs.  ### Dates and times * We always use milliseconds since epoch (a.k.a. Unix time) for timestamps (e.g., review creation times, webhook update times). * We always use ISO 8601 without timezone for local date times (e.g., Event start time, Event end time). * Dates are transmitted as strings: `“YYYY-MM-DD”`.  ## Account ID In keeping with RESTful design principles, every URL in API v2 has an account ID prefix. This prefix helps to ensure that you have unique URLs for all resources.  In addition to specifying resources by explicit account ID, the following two macros are defined: * **`me`** - refers to the account that owns the API key sent with the request * **`all`** - refers to the account that owns the API key sent with the request, as well as all sub-accounts (recursively)  **IMPORTANT:** The **`me`** macro is supported in all API methods.  The **`all`** macro will only be supported in certain URLs, as noted in the reference documentation.  ### Examples This URL refers to all locations in account 123. <pre>https://api.yext.com/v2/accounts/<b>123</b>/locations?api_key=456&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456. <pre>https://api.yext.com/v2/accounts/<b>me</b>/locations?<b>api_key=456</b>&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456, as well as all locations from any of its child accounts. <pre>https://api.yext.com/v2/accounts/<b>all</b>/locations?<b>api_key=456</b>&v=20160822</pre>  ## Actor Headers *(Available December 2016)*  To attribute changes to a particular user or employee, all requests may be passed with the following headers.  **NOTE:** If you choose to provide actor headers, and we are unable to authenticate the request using the values you provide, the request will result in an error and fail.  * Attribute activity to Admin user via admin login cookie *(for Yext’s use only)*     * Header: `YextEmployee`     * Value: Admin user’s AlphaLogin cookie * Attribute activity to Admin user via email address and password     * Headers: `YextEmployeeEmail`, `YextEmployeePassword`     * Values: Admin user’s email address, Admin user’s Admin password * Attribute activity to customer user via login cookie     * Header: `YextUser`     * Value: Customer user’s YextAppsLogin cookie * Attribute activity to customer user via email address and password     * Headers: `YextUserEmail`, `YextUserPassword`     * Values: Customer user’s email address, Customer user’s password  Changes will be logged as follows:  * App with no designated actor     * History Entry \"Updated By\" Value: `App [App ID] - ‘[App Name]’`     * Example: `App 432 - ‘Hello World App’` * App with customer user actor     * History Entry \"Updated By\" Value: `[user name] ([user email]) (App [App ID] - ‘[App Name]’)`     * Example: `Jordan Smith (jsmith@example.com) (App 432 - ‘Hello World App’)` * App with Yext employee actor   * History Entry \"Updated By\" Value: `[employee username] (App [App ID] - ‘[App Name]’)`   * Example: `hlerman (App 432 - ‘Hello World App’)`  ## Response Format * **`meta`**     * Response metadata  * **`meta.uuid`**     * Unique ID for this request / response * **`meta.errors[]`**     * List of errors and warnings  * **`meta.errors[].code`**     * Code that uniquely identifies the error or warning  * **`meta.errors[].type`**     * One of:         * `FATAL_ERROR`         * `NON_FATAL_ERROR`         * `WARNING`     * See \"Errors and Warnings\" above for details. * **`meta.errors[].message`**     * An explanation of the issue * **`response`**     * The main content (body) of the response  Example: <pre><code> {     \"meta\": {         \"uuid\": \"bb0c7e19-4dc3-4891-bfa5-8593b1f124ad\",         \"errors\": [             {                 \"code\": ...error code...,                 \"type\": ...error, fatal error, non fatal error, or warning...,                 \"message\": ...explanation of the issue...             }         ]     },     \"response\": {         ...results...     } } </code></pre>  ## Status Codes * `200 OK`    * Either there are no errors or warnings, or the only issues are of type `WARNING`. * `207 Multi-Status`     * There are errors of type `itemError` or `fieldError` (but none of type `requestError`). * `400 Bad Request`     * A parameter is invalid, or a required parameter is missing. This includes the case where no API key is provided and the case where a resource ID is specified incorrectly in a path.     * This status is if any of the response errors are of type `requestError`. * `401 Unauthorized`     * The API key provided is invalid.     * `403 Forbidden`     * The requested information cannot be viewed by the acting user.  * `404 Not Found`     * The endpoint does not exist. * `405 Method Not Allowed`     * The request is using a method that is not allowed (e.g., POST with a GET-only endpoint). * `409 Conflict`     * The request could not be completed in its current state.     * Use the information included in the response to modify the request and retry. * `429 Too Many Requests`     * You have exceeded your rate limit / quota. * `500 Internal Server Error`     * Yext’s servers are not operating as expected. The request is likely valid but should be resent later. * `504 Timeout`     * Yext’s servers took too long to handle this request, and it timed out.  ## Quotas and Rate Limits Default quotas and rate limits are as follows.  * **Location Cloud API** *(includes Analytics, PowerListings®, Location Manager, Reviews, Social, and User endpoints)*: 5,000 requests per hour * **Administrative API**: 1 qps * **Live API**: 100,000 requests per hour  **NOTE:** Webhook requests do not count towards an account’s quota.  For the most current and accurate rate-limit usage information for a particular request type, check the **`Rate-Limit-Remaining`** and **`Rate-Limit-Limit`** HTTP headers of your API responses.  If you are currently over your limit, our API will return a `429` error, and the response object returned by our API will be empty. We will also include a **`Rate-Limit-Reset`** header in the response, which indicates when you will have additional quota.  ## Client- vs. Yext-assigned IDs You can set the ID for the following objects when you create them. If you do not provide an ID, Yext will generate one for you.  * Account * User * Location * Bio List * Menu List * Product List * Event List * Bio List Item * Menu List Item * Product List Item * Event List Item  ## Logging All API requests are logged. API logs can be found in your Developer Console and are stored for 90 days. 

OpenAPI spec version: 0.0.2

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require 'spec_helper'
require 'json'

# Unit tests for YextClient::LocationManagerApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'LocationManagerApi' do
  before do
    # run before each test
    @instance = YextClient::LocationManagerApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of LocationManagerApi' do
    it 'should create an instact of LocationManagerApi' do
      expect(@instance).to be_instance_of(YextClient::LocationManagerApi)
    end
  end

  # unit tests for create_bio
  # Bios: Create
  # Create new Bio ECL
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse201]
  describe 'create_bio test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_event
  # Events: Create
  # Create a new Events ECL
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2012]
  describe 'create_event test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_location
  # Locations: Create
  # Create a new Location
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param location_request 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2011]
  describe 'create_location test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_menu
  # Menus: Create
  # 
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2013]
  describe 'create_menu test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_product
  # Products: Create
  # Create a new Product ECL
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse20011]
  describe 'create_product test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_bio_list
  # Bios: Delete
  # Delete an existing Bios ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponseDefault]
  describe 'delete_bio_list test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_event_list
  # Events: Delete
  # Delete an existing Events ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponseDefault]
  describe 'delete_event_list test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_language_profile
  # Language Profiles: Delete
  # Remove a Language Profile from a location
  # @param account_id 
  # @param location_id 
  # @param language_code Locale code
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponseDefault]
  describe 'delete_language_profile test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_menu_list
  # Menus: Delete
  # Delete an existing Menu
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponseDefault]
  describe 'delete_menu_list test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_product_list
  # Products: Delete
  # Delete an existing Products ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponseDefault]
  describe 'delete_product_list test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_bio
  # Bios: Get
  # Retrieve a specific Bios ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse201]
  describe 'get_bio test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_bios
  # Bios: List
  # Retrieve all Bio ECls for an account
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results
  # @return [InlineResponse2004]
  describe 'get_bios test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_business_categories
  # Categories: List
  # Get available Categories.  All Locations are required to have an associated Category to assist with organization and search. Yext provides a hierarchy of business categories for this purpose, exposed by this API. 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @option opts [String] :language Only categories that apply to this language will be returned.  **Example:** en 
  # @option opts [String] :country Only categories that apply in this country will be returned.  **Example:** US 
  # @return [InlineResponse20030]
  describe 'get_business_categories test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_custom_fields
  # Custom Fields: List
  # Returns a list of Custom Fields in an Account.
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param account_id 
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :offset Number of results to skip. Used to page through results
  # @option opts [Integer] :limit Number of results to return
  # @return [InlineResponse2005]
  describe 'get_custom_fields test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_event
  # Events: Get
  # Retrieve a specific Events ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2012]
  describe 'get_event test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_events
  # Events: List
  # Retrieve all Events content lists for an account
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results
  # @return [InlineResponse20010]
  describe 'get_events test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_google_keywords
  # Google Fields: List
  # Use the Google Attributes API to retrieve a complete list of Google&#39;s location attributes for each business category. This list includes attributes that may not apply to all Partner Locations in an account. The attributes available to a Partner Location depends on its primary business category. You can view and edit the attributes of Partner Locationsvia the googleKeywords field in the Locations API.
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse20031]
  describe 'get_google_keywords test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_language_profile
  # Language Profiles: Get
  # Gets the the requested Language Profile for a given Location
  # @param account_id 
  # @param location_id 
  # @param language_code Locale code
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse20012]
  describe 'get_language_profile test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_language_profiles
  # Language Profiles: List
  # Get Language Profiles for a Location.
  # @param account_id 
  # @param location_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse20013]
  describe 'get_language_profiles test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_location
  # Locations: Get
  # Gets the primary profile for a single Location.
  # @param account_id 
  # @param location_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse20012]
  describe 'get_location test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_location_folders
  # Folders: List
  # Returns a list of Location Folders in an Account.
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :offset Number of results to skip. Used to page through results
  # @option opts [Integer] :limit Number of results to return
  # @return [InlineResponse2006]
  describe 'get_location_folders test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_locations
  # Locations: List
  # Get multiple Locations (primary profiles only).
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results
  # @return [InlineResponse2009]
  describe 'get_locations test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_menu
  # Menus: Get
  # Retrieve a specific Menu
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2013]
  describe 'get_menu test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_menus
  # Menus: List
  # Retrieve all Menu ECLs for an account
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results
  # @return [InlineResponse20014]
  describe 'get_menus test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_product
  # Products: Get
  # Retrieve a specific Products ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse20011]
  describe 'get_product test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_products
  # Products: List
  # Retrieve all Products content lists for an account
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results
  # @return [InlineResponse20025]
  describe 'get_products test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_bio
  # Bios: Update
  # Update an existing Bios ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse201]
  describe 'update_bio test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_event
  # Events: Update
  # Update an existing Events ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2012]
  describe 'update_event test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_location
  # Locations: Update
  # Updates the primary profile for a Location.  **NOTE:** Despite using the PUT method, Locations: Update only updates supplied fields. Omitted fields are not modified.  **NOTE:** The Location&#39;s primary profile language can be changed by calling this endpoint with a different, but unused, language code. 
  # @param account_id 
  # @param location_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param location_request 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2011]
  describe 'update_location test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_menu
  # Menus: Update
  # Update an existing Menu
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2013]
  describe 'update_menu test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_product
  # Products: Update
  # Update an existing Product ECL
  # @param account_id 
  # @param list_id ID of this List
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse20011]
  describe 'update_product test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for upsert_language_profile
  # Language Profiles: Upsert
  # Creates and / or sets the fields for a Language Profile  **NOTE:** You can change a Language Profile’s language by supplying a different (but unused) language code. 
  # @param account_id 
  # @param location_id 
  # @param language_code Locale code
  # @param v A date in &#x60;YYYYMMDD&#x60; format
  # @param body 
  # @param [Hash] opts the optional parameters
  # @option opts [BOOLEAN] :primary When present and set to true, the specified profile will become the location’s primary Language Profile
  # @return [InlineResponse20012]
  describe 'upsert_language_profile test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
