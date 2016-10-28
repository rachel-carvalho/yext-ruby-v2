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

require "uri"

module YextClient
  class ReviewsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Comments: Create
    # Creates a new Comment on a Review.
    # @param account_id 
    # @param review_id ID of this Review
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :content Content of the new comment.
    # @option opts [String] :visibility  (default to PRIVATE)
    # @option opts [Integer] :parent_id If this Comment is in response to another comment, use this field to specify the ID of the parent Comment.
    # @return [InlineResponse2015]
    def create_comment(account_id, review_id, v, opts = {})
      data, _status_code, _headers = create_comment_with_http_info(account_id, review_id, v, opts)
      return data
    end

    # Comments: Create
    # Creates a new Comment on a Review.
    # @param account_id 
    # @param review_id ID of this Review
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :content Content of the new comment.
    # @option opts [String] :visibility 
    # @option opts [Integer] :parent_id If this Comment is in response to another comment, use this field to specify the ID of the parent Comment.
    # @return [Array<(InlineResponse2015, Fixnum, Hash)>] InlineResponse2015 data, response status code and response headers
    def create_comment_with_http_info(account_id, review_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ReviewsApi.create_comment ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ReviewsApi.create_comment" if account_id.nil?
      # verify the required parameter 'review_id' is set
      fail ArgumentError, "Missing the required parameter 'review_id' when calling ReviewsApi.create_comment" if review_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ReviewsApi.create_comment" if v.nil?
      if opts[:'visibility'] && !['PUBLIC', 'PRIVATE'].include?(opts[:'visibility'])
        fail ArgumentError, 'invalid value for "visibility", must be one of PUBLIC, PRIVATE'
      end
      # resource path
      local_var_path = "/accounts/{accountId}/reviews/{reviewId}/comments".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'reviewId' + '}', review_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'content'] = opts[:'content'] if !opts[:'content'].nil?
      query_params[:'visibility'] = opts[:'visibility'] if !opts[:'visibility'].nil?
      query_params[:'parentId'] = opts[:'parent_id'] if !opts[:'parent_id'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2015')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReviewsApi#create_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reviews: Get
    # Retrieve a specific Review.
    # @param account_id 
    # @param review_id ID of this Review
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse20027]
    def get_review(account_id, review_id, v, opts = {})
      data, _status_code, _headers = get_review_with_http_info(account_id, review_id, v, opts)
      return data
    end

    # Reviews: Get
    # Retrieve a specific Review.
    # @param account_id 
    # @param review_id ID of this Review
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse20027, Fixnum, Hash)>] InlineResponse20027 data, response status code and response headers
    def get_review_with_http_info(account_id, review_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ReviewsApi.get_review ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ReviewsApi.get_review" if account_id.nil?
      # verify the required parameter 'review_id' is set
      fail ArgumentError, "Missing the required parameter 'review_id' when calling ReviewsApi.get_review" if review_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ReviewsApi.get_review" if v.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/reviews/{reviewId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'reviewId' + '}', review_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse20027')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReviewsApi#get_review\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reviews: List
    # Retrieve all Reviews matching the given criteria.  **NOTE:** Yelp Reviews are **not** included. 
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return. (default to 100)
    # @option opts [Integer] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [Array<String>] :location_ids When provided, only reviews for the requested locations will be returned.  By default, reviews will be returned for all locations subscribed to Review Monitoring.  **Example:** loc123,loc456,loc789 
    # @option opts [String] :folder_id When provided, only reviews for locations in the given folder and its subfolders will be included in the results.
    # @option opts [Array<String>] :countries When present, only reviews for locations in the given countries will be returned. Countries are denoted by ISO 3166 2-letter country codes.
    # @option opts [Array<String>] :location_labels When present, only reviews for location with the provided labels will be returned.
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @option opts [String] :review_content When specified, only reviews that include the provided content will be returned.
    # @option opts [Float] :min_rating When specified, only reviews with the provided minimum rating or higher will be returned.
    # @option opts [Float] :max_rating 
    # @option opts [String] :min_publisher_date When specified, only reviews with a publisher date on or after the given date will be returned.
    # @option opts [String] :max_publisher_date When specified, only reviews with a publisher date on or before the given date will be returned.
    # @option opts [String] :min_last_yext_update_date When specified, only reviews with a last Yext update date on or after the given date will be returned.
    # @option opts [String] :max_last_yext_update_date When specified, only reviews with a last Yext update date on or before the given date will be returned.
    # @option opts [String] :awaiting_response When specified, only reviews that are awaiting an owner reply on the given objects will be returned.  For example, when &#x60;awaitingResponse&#x3D;COMMENT&#x60;, reviews will only be returned if they have at least one comment that has not been responded to by the owner. 
    # @option opts [Integer] :min_non_owner_comments When specified, only reviews that have at least the provided number of non-owner comments will be returned.
    # @option opts [String] :reviewer_name When specified, only reviews whose authorName contains the provided string will be returned.
    # @option opts [String] :reviewer_email When specified, only reviews whose authorEmail matches the provided email address will be returned.
    # @return [InlineResponse20026]
    def list_reviews(account_id, v, opts = {})
      data, _status_code, _headers = list_reviews_with_http_info(account_id, v, opts)
      return data
    end

    # Reviews: List
    # Retrieve all Reviews matching the given criteria.  **NOTE:** Yelp Reviews are **not** included. 
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return.
    # @option opts [Integer] :offset Number of results to skip. Used to page through results
    # @option opts [Array<String>] :location_ids When provided, only reviews for the requested locations will be returned.  By default, reviews will be returned for all locations subscribed to Review Monitoring.  **Example:** loc123,loc456,loc789 
    # @option opts [String] :folder_id When provided, only reviews for locations in the given folder and its subfolders will be included in the results.
    # @option opts [Array<String>] :countries When present, only reviews for locations in the given countries will be returned. Countries are denoted by ISO 3166 2-letter country codes.
    # @option opts [Array<String>] :location_labels When present, only reviews for location with the provided labels will be returned.
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @option opts [String] :review_content When specified, only reviews that include the provided content will be returned.
    # @option opts [Float] :min_rating When specified, only reviews with the provided minimum rating or higher will be returned.
    # @option opts [Float] :max_rating 
    # @option opts [String] :min_publisher_date When specified, only reviews with a publisher date on or after the given date will be returned.
    # @option opts [String] :max_publisher_date When specified, only reviews with a publisher date on or before the given date will be returned.
    # @option opts [String] :min_last_yext_update_date When specified, only reviews with a last Yext update date on or after the given date will be returned.
    # @option opts [String] :max_last_yext_update_date When specified, only reviews with a last Yext update date on or before the given date will be returned.
    # @option opts [String] :awaiting_response When specified, only reviews that are awaiting an owner reply on the given objects will be returned.  For example, when &#x60;awaitingResponse&#x3D;COMMENT&#x60;, reviews will only be returned if they have at least one comment that has not been responded to by the owner. 
    # @option opts [Integer] :min_non_owner_comments When specified, only reviews that have at least the provided number of non-owner comments will be returned.
    # @option opts [String] :reviewer_name When specified, only reviews whose authorName contains the provided string will be returned.
    # @option opts [String] :reviewer_email When specified, only reviews whose authorEmail matches the provided email address will be returned.
    # @return [Array<(InlineResponse20026, Fixnum, Hash)>] InlineResponse20026 data, response status code and response headers
    def list_reviews_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ReviewsApi.list_reviews ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ReviewsApi.list_reviews" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ReviewsApi.list_reviews" if v.nil?
      if !opts[:'limit'].nil? && opts[:'limit'] > 100.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling ReviewsApi.list_reviews, must be smaller than or equal to 100.0.'
      end

      if opts[:'awaiting_response'] && !['REVIEW', 'COMMENT', 'REVIEW_OR_COMMENT'].include?(opts[:'awaiting_response'])
        fail ArgumentError, 'invalid value for "awaiting_response", must be one of REVIEW, COMMENT, REVIEW_OR_COMMENT'
      end
      # resource path
      local_var_path = "/accounts/{accountId}/reviews".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'locationIds'] = @api_client.build_collection_param(opts[:'location_ids'], :csv) if !opts[:'location_ids'].nil?
      query_params[:'folderId'] = opts[:'folder_id'] if !opts[:'folder_id'].nil?
      query_params[:'countries'] = @api_client.build_collection_param(opts[:'countries'], :csv) if !opts[:'countries'].nil?
      query_params[:'locationLabels'] = @api_client.build_collection_param(opts[:'location_labels'], :csv) if !opts[:'location_labels'].nil?
      query_params[:'publisherIds'] = @api_client.build_collection_param(opts[:'publisher_ids'], :csv) if !opts[:'publisher_ids'].nil?
      query_params[:'reviewContent'] = opts[:'review_content'] if !opts[:'review_content'].nil?
      query_params[:'minRating'] = opts[:'min_rating'] if !opts[:'min_rating'].nil?
      query_params[:'maxRating'] = opts[:'max_rating'] if !opts[:'max_rating'].nil?
      query_params[:'minPublisherDate'] = opts[:'min_publisher_date'] if !opts[:'min_publisher_date'].nil?
      query_params[:'maxPublisherDate'] = opts[:'max_publisher_date'] if !opts[:'max_publisher_date'].nil?
      query_params[:'minLastYextUpdateDate'] = opts[:'min_last_yext_update_date'] if !opts[:'min_last_yext_update_date'].nil?
      query_params[:'maxLastYextUpdateDate'] = opts[:'max_last_yext_update_date'] if !opts[:'max_last_yext_update_date'].nil?
      query_params[:'awaitingResponse'] = opts[:'awaiting_response'] if !opts[:'awaiting_response'].nil?
      query_params[:'minNonOwnerComments'] = opts[:'min_non_owner_comments'] if !opts[:'min_non_owner_comments'].nil?
      query_params[:'reviewerName'] = opts[:'reviewer_name'] if !opts[:'reviewer_name'].nil?
      query_params[:'reviewerEmail'] = opts[:'reviewer_email'] if !opts[:'reviewer_email'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse20026')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReviewsApi#list_reviews\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
