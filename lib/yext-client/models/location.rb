=begin
#Yext API

## Policies and Conventions  This section gives you the basic information you need to use our APIs.  ## Authentication All requests must be authenticated using an app’s API key.  <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?<b>api_key=API_KEY</b>&v=YYYYMMDD</pre>  The API key should be kept secret, as each app has exactly one API key.  ## Versioning All requests must be versioned using the **`v`** parameter.   <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?api_key=API_KEY&<b>v=YYYYMMDD</b></pre>  The **`v`** parameter (a date in `YYYYMMDD` format) is designed to give you the freedom to adapt to Yext API changes on your own schedule. When you pass this parameter, any changes we made to the API after the specified date will not affect the behavior of the request or the content of the response.  **NOTE:** Yext has the ability to make changes that affect previous versions of the API, if necessary.  ## Serialization API v2 only accepts data in JSON format.  ## Content-Type Headers For all requests that include a request body, the Content-Type header must be included and set to `application/json`.  ## Errors and Warnings There are three kinds of issues that can be reported for a given request:  * **`FATAL_ERROR`**     * An issue caused the entire request to be rejected. * **`NON_FATAL_ERROR`**     * An item is rejected, but other items present in the request are accepted (e.g., one invalid Product List item).      * A field is rejected, but the item otherwise is accepted (e.g., invalid website URL in a Location). * **`WARNING`**     * The request did not adhere to our best practices or recommendations, but the data was accepted anyway (e.g., data was sent that may cause some listings to become unavailable, a deprecated API was used, or we changed the format of a field's content to meet our requirements).  ## Validation Modes *(Available December 2016)*  API v2 will support two request validation modes: *Strict Mode* and *Lenient Mode*.  In Strict Mode, both `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported simply as `FATAL_ERROR`s, and any error will cause the entire request to fail.  In Lenient Mode, `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported as such, and only `FATAL_ERROR`s will cause a request to fail.  All requests will be processed in Strict Mode by default.  To activate Lenient Mode, append the parameter `validation=lenient` to your request URLs.  ### Dates and times * We always use milliseconds since epoch (a.k.a. Unix time) for timestamps (e.g., review creation times, webhook update times). * We always use ISO 8601 without timezone for local date times (e.g., Event start time, Event end time). * Dates are transmitted as strings: `“YYYY-MM-DD”`.  ## Account ID In keeping with RESTful design principles, every URL in API v2 has an account ID prefix. This prefix helps to ensure that you have unique URLs for all resources.  In addition to specifying resources by explicit account ID, the following two macros are defined: * **`me`** - refers to the account that owns the API key sent with the request * **`all`** - refers to the account that owns the API key sent with the request, as well as all sub-accounts (recursively)  **IMPORTANT:** The **`me`** macro is supported in all API methods.  The **`all`** macro will only be supported in certain URLs, as noted in the reference documentation.  ### Examples This URL refers to all locations in account 123. <pre>https://api.yext.com/v2/accounts/<b>123</b>/locations?api_key=456&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456. <pre>https://api.yext.com/v2/accounts/<b>me</b>/locations?<b>api_key=456</b>&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456, as well as all locations from any of its child accounts. <pre>https://api.yext.com/v2/accounts/<b>all</b>/locations?<b>api_key=456</b>&v=20160822</pre>  ## Actor Headers *(Available December 2016)*  To attribute changes to a particular user or employee, all requests may be passed with the following headers.  **NOTE:** If you choose to provide actor headers, and we are unable to authenticate the request using the values you provide, the request will result in an error and fail.  * Attribute activity to Admin user via admin login cookie *(for Yext’s use only)*     * Header: `YextEmployee`     * Value: Admin user’s AlphaLogin cookie * Attribute activity to Admin user via email address and password     * Headers: `YextEmployeeEmail`, `YextEmployeePassword`     * Values: Admin user’s email address, Admin user’s Admin password * Attribute activity to customer user via login cookie     * Header: `YextUser`     * Value: Customer user’s YextAppsLogin cookie * Attribute activity to customer user via email address and password     * Headers: `YextUserEmail`, `YextUserPassword`     * Values: Customer user’s email address, Customer user’s password  Changes will be logged as follows:  * App with no designated actor     * History Entry \"Updated By\" Value: `App [App ID] - ‘[App Name]’`     * Example: `App 432 - ‘Hello World App’` * App with customer user actor     * History Entry \"Updated By\" Value: `[user name] ([user email]) (App [App ID] - ‘[App Name]’)`     * Example: `Jordan Smith (jsmith@example.com) (App 432 - ‘Hello World App’)` * App with Yext employee actor   * History Entry \"Updated By\" Value: `[employee username] (App [App ID] - ‘[App Name]’)`   * Example: `hlerman (App 432 - ‘Hello World App’)`  ## Response Format * **`meta`**     * Response metadata  * **`meta.uuid`**     * Unique ID for this request / response * **`meta.errors[]`**     * List of errors and warnings  * **`meta.errors[].code`**     * Code that uniquely identifies the error or warning  * **`meta.errors[].type`**     * One of:         * `FATAL_ERROR`         * `NON_FATAL_ERROR`         * `WARNING`     * See \"Errors and Warnings\" above for details. * **`meta.errors[].message`**     * An explanation of the issue * **`response`**     * The main content (body) of the response  Example: <pre><code> {     \"meta\": {         \"uuid\": \"bb0c7e19-4dc3-4891-bfa5-8593b1f124ad\",         \"errors\": [             {                 \"code\": ...error code...,                 \"type\": ...error, fatal error, non fatal error, or warning...,                 \"message\": ...explanation of the issue...             }         ]     },     \"response\": {         ...results...     } } </code></pre>  ## Status Codes * `200 OK`    * Either there are no errors or warnings, or the only issues are of type `WARNING`. * `207 Multi-Status`     * There are errors of type `itemError` or `fieldError` (but none of type `requestError`). * `400 Bad Request`     * A parameter is invalid, or a required parameter is missing. This includes the case where no API key is provided and the case where a resource ID is specified incorrectly in a path.     * This status is if any of the response errors are of type `requestError`. * `401 Unauthorized`     * The API key provided is invalid.     * `403 Forbidden`     * The requested information cannot be viewed by the acting user.  * `404 Not Found`     * The endpoint does not exist. * `405 Method Not Allowed`     * The request is using a method that is not allowed (e.g., POST with a GET-only endpoint). * `409 Conflict`     * The request could not be completed in its current state.     * Use the information included in the response to modify the request and retry. * `429 Too Many Requests`     * You have exceeded your rate limit / quota. * `500 Internal Server Error`     * Yext’s servers are not operating as expected. The request is likely valid but should be resent later. * `504 Timeout`     * Yext’s servers took too long to handle this request, and it timed out.  ## Quotas and Rate Limits Default quotas and rate limits are as follows.  * **Location Cloud API** *(includes Analytics, PowerListings®, Location Manager, Reviews, Social, and User endpoints)*: 5,000 requests per hour * **Administrative API**: 1 qps * **Live API**: 100,000 requests per hour  **NOTE:** Webhook requests do not count towards an account’s quota.  For the most current and accurate rate-limit usage information for a particular request type, check the **`RateLimit-Remaining`** and **`RateLimit-Limit`** HTTP headers of your API responses.  If you are currently over your limit, our API will return a `429` error, and the response object returned by our API will be empty. We will also include a **`RateLimit-Reset`** header in the response, which indicates when you will have additional quota.  ## Client- vs. Yext-assigned IDs You can set the ID for the following objects when you create them. If you do not provide an ID, Yext will generate one for you.  * Account * User * Location * Bio List * Menu List * Product List * Event List * Bio List Item * Menu List Item * Product List Item * Event List Item  ## Logging All API requests are logged. API logs can be found in your Developer Console and are stored for 90 days. 

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

require 'date'

module YextClient

  class Location
    # Primary key. Unique alphanumeric (Latin-1) ID assigned by the Customer.
    attr_accessor :id

    # Must refer to an **account.id** that already exists.
    attr_accessor :account_id

    # The timestamp of the most recent change to this location record.  Will be ignored when the client is saving location data to Yext.  **NOTE:** The timestamp may change even if observable fields stay the same. 
    attr_accessor :timestamp

    attr_accessor :location_type

    # Cannot include: * inappropriate language * HTML markup or entities * a URL or domain name * a phone number * control characters ([\\x00-\\x1F\\x7F])  Should be in appropriate letter case (e.g., not in all capital letters) 
    attr_accessor :location_name

    # The first name of the healthcare professional  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :first_name

    # The middle name of the healthcare professional  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :middle_name

    # The last name of the healthcare professional  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :last_name

    # The name of the office where the healthcare professional works, if different from **locationName**  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :office_name

    # The gender of the healthcare professional  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :gender

    # The National Provider Identifier (NPI) of the healthcare provider  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL or HEALTHCARE_FACILITY. 
    attr_accessor :npi

    # Must be a valid address  Cannot be a P.O. Box 
    attr_accessor :address

    # Cannot be a P.O. Box
    attr_accessor :address2

    # If true, do not show street address on listings. Defaults to false.
    attr_accessor :suppress_address

    # Provides additional information to help consumers get to the location. This string appears along with the location's address (e.g. In Menlo Mall, 3rd Floor).  It may also be used in conjunction with a hidden address (i.e., when **suppressAddress** is true) to give consumers information about where the location is found (e.g., Servicing the New York area).  Cannot be a P.O. Box 
    attr_accessor :display_address

    attr_accessor :city

    # The two-character state code, or DC for the District of Columbia
    attr_accessor :state

    # The five- or nine-digit ZIP code (the hyphen is optional)
    attr_accessor :zip

    # The country code (two-character ISO 3166-1) of the location's country . US is the only valid value.
    attr_accessor :country_code

    attr_accessor :service_area

    # Must be a valid 10-digit phone number.
    attr_accessor :phone

    # Set to true if the number listed in **phone** is a tracked phone number.  **NOTE:** When updating **isPhoneTracked**, you must provide a value for **phone** in the same request. 
    attr_accessor :is_phone_tracked

    # Must be a valid, non-toll-free 10-digit phone number.  Required if: * **isPhoneTracked** is true and the non-tracked number is a toll-free number, **OR** * **isPhoneTracked** is false and **phone** is a toll-free number 
    attr_accessor :local_phone

    # Must be a valid 10-digit phone number. Phone numbers for US locations must contain 10 digits.
    attr_accessor :alternate_phone

    # Must be a valid 10-digit phone number. Phone numbers for US locations must contain 10 digits.
    attr_accessor :fax_phone

    # Must be a valid 10-digit phone number. Phone numbers for US locations must contain 10 digits.
    attr_accessor :mobile_phone

    # Must be a valid 10-digit phone number. Phone numbers for US locations must contain 10 digits.
    attr_accessor :toll_free_phone

    # Must be a valid 10-digit phone number. Phone numbers for US locations must contain 10 digits.
    attr_accessor :tty_phone

    # Yext Category IDs. A Location must have at least one and at most 10 Categories.  IDs must be valid and selectable (i.e., cannot be parent categories).  **NOTE:** The list of category IDs that you send us must be comprehensive. For example, if you send us a list of IDs that does not include IDs that you sent in your last update, Yext considers the missing categories to be deleted, and we remove them from your listings. 
    attr_accessor :category_ids

    # The Featured Message. Default: Call today!  Cannot include: * inappropriate language * HTML markup * a URL or domain name * a phone number * control characters ([\\x00-\\x1F\\x7F]) * insufficient spacing  If you submit a Featured Message that contains profanity or more than 50 characters, it will be ignored. The success response will contain a warning message explaining why your Featured Message wasn't stored in the system. 
    attr_accessor :featured_message

    # Valid URL to which the Featured Message is linked
    attr_accessor :featured_message_url

    # The URL of the location's website. This URL will be shown on your listings unless you specify a value for **displayWebsiteUrl**.  Must be a valid URL and is required whenever **displayWebsiteUrl** is specified 
    attr_accessor :website_url

    # The URL that is shown on your listings in place of **websiteUrl**. You can use **displayWebsiteUrl** to display a short, memorable web address that redirects consumers to the URL given in **websiteUrl**.  Must be a valid URL and be specified along with **websiteUrl** 
    attr_accessor :display_website_url

    # A valid URL used for reservations at this location
    attr_accessor :reservation_url

    # Hours should be submitted as a comma-separated list of days, where each day's hours are specified as follows:  d:oh:om:ch:cm * d = day of the week –   * 1 – Sunday   * 2 – Monday   * 3 – Tuesday   * 4 – Wednesday   * 5 – Thursday   * 6 – Friday   * 7 – Saturday * oh:om = opening time in 24-hour format * ch:cm = closing time in 24-hour format  Times with single-digit hours (e.g., 9 AM) can be submitted with or without a leading zero (9:00 or 09:00).  **Example:** open 9 AM to 5 PM Monday and Tuesday, open 10 AM to 4 PM on Saturday – 2:9:00:17:00,3:9:00:17:00,7:10:00:16:00  SPECIAL CASES: * To indicate that a location is open 24 hours on a specific day, set 00:00 as both the opening and closing time for that day.   * **Example:** open all day on Saturdays – 7:00:00:00:00 * To indicate that a location is closed on a specific day, omit that day from the list or set it as closed (\"closed\" is not case sensitive).   * **Example:** closed on Sundays – 1:closed   * **NOTE:** If a location is closed seven days a week, set at least one day to closed. Otherwise, **hours** is an empty string, and we assume you are not submitting hours information for that location. * To indicate that a location has split hours on a specific day, submit a set of hours for each block of time the location is open.   * **Example:** open from 9:00 AM to 12:00 PM and again from 1:00 PM to 5:00 PM on Mondays – 2:9:00:12:00,2:13:00:17:00  **NOTE:** To set hours for specific days of the year rather than days of the week, use **holidayHours**. 
    attr_accessor :hours

    # Additional information about business hours that does not fit in **hours** (e.g., Closed during the winter)
    attr_accessor :additional_hours_text

    # Holiday hours for this location.  **NOTE:** hours must be set in order for holidayHours to appear on your listings) 
    attr_accessor :holiday_hours

    attr_accessor :description

    # A list of the conditions treated by the healthcare provider  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL or HEALTHCARE_FACILITY. 
    attr_accessor :conditions_treated

    # A list of the certifications held by the healthcare professional  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :certifications

    # A list of the types of education and training completed by the healthcare professional  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :education_list

    # A list of hospitals where the healthcare professional admits patients  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :admitting_hospitals

    # Indicates whether the healthcare provider is accepting new patients  Default is true  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL or HEALTHCARE_FACILITY. 
    attr_accessor :accepting_new_patients

    attr_accessor :closed

    # The payment methods accepted at this location  Valid elements depend on the location's country. For US locations, valid elements are: * AMERICANEXPRESS * CASH * CHECK * DINERSCLUB * DISCOVER * FINANCING * INVOICE * MASTERCARD * TRAVELERSCHECK * VISA 
    attr_accessor :payment_options

    # A list of insurance policies accepted by the healthcare provider  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :insurance_accepted

    attr_accessor :logo

    # Up to 50 Photos.  **NOTE:** The list of photos that you send us must be comprehensive. For example, if you send us a list of photos that does not include photos that you sent in your last update, Yext considers the missing photos to be deleted, and we remove them from your listings. 
    attr_accessor :photos

    # A portrait of the healthcare professional  **NOTE:** This field is only available to locations whose **locationType** is HEALTHCARE_PROFESSIONAL. 
    attr_accessor :headshot

    # Valid YouTube URLs for embedding a video on some publisher sites.  **NOTE:** Currently, only the first URL in the Array appears in your listings. 
    attr_accessor :video_urls

    # Valid Instagram username for the location (e.g., NewCityFiat (without the leading \"@\"))
    attr_accessor :instagram_handle

    # Valid Twitter handle for the location (e.g., JohnSmith (without the leading '@')). If you submit an invalid Twitter handle, it will be ignored. The success response will contain a warning message explaining why your Twitter handle wasn't stored in the system.
    attr_accessor :twitter_handle

    # The URL you would like to submit to Google My Business in place of the one given in **websiteUrl** (if applicable).  For example, if you want to analyze the traffic driven by your Google listings separately from other traffic, enter the alternate URL that you will use for tracking in this field. 
    attr_accessor :google_website_override

    # The cover photo for your business's Google profile  NOTE: Your cover photo must meet all of the following requirements: * have a 16:9 aspect ratio * be at least 480 x 270 pixels * be no more than 2120 x 1192 pixels 
    attr_accessor :google_cover_photo

    # The profile photo for your business's Google profile  **NOTE:** Your profile picture must meet all of the following requirements: * be a square * be at least 200 x 200 pixels * be no more than 500 x 500 pixels 
    attr_accessor :google_profile_photo

    # The photo Google will consider first when deciding which photo display with the location's business information on Google Maps or Search  One of: * UNSPECIFIED (default) * COVER - the photo in **googleCoverPhoto** * PROFILE - the photo in **googleProfilePhoto**  **NOTE:** If the value of a location's **googlePreferredPhoto** is UNSPECIFIED, **googlePreferredPhoto** will be omitted from the location's data in responses. 
    attr_accessor :google_preferred_photo

    # The Google My Business attributes for this location. 
    attr_accessor :google_attributes

    # URL for the location's Facebook Page.  Valid formats: * facebook.com/profile.php?id=[numId] * facebook.com/group.php?gid=[numId] * facebook.com/groups/[numId] * facebook.com/[Name] * facebook.com/pages/[Name]/[numId]  where [Name] is a String and [numId] is an Integer  If you submit a URL that is not in one of the valid formats, it will be ignored. The success response will contain a warning message explaining why the URL wasn't stored in the system.  **NOTE:** This value is automatically set to the location's Facebook Page URL. You can only manually set **facebookPageUrl** if the location meets one of the following criteria: * It is not subscribed to a Listings package that contains Facebook. * It is opted out of Facebook. 
    attr_accessor :facebook_page_url

    # The cover photo for your business's Facebook profile  Displayed as a 851 x 315 pixel image  You must have a cover photo in order for your listing to appear on Facebook.  **NOTE:** Your cover photo must be at least 400 pixels wide. 
    attr_accessor :facebook_cover_photo

    # The profile picture for your business's Facebook profile  You must have a profile picture in order for your listing to appear on Facebook.  **NOTE:** Your profile picture must be larger than 180 x 180 pixels. 
    attr_accessor :facebook_profile_picture

    # Indicates whether the embedded Uber link for this location appears as text or a button  When consumers click on this link on a mobile device, the Uber app (if installed) will open with your location set as the trip destination. If the Uber app is not installed, the consumer will be prompted to download it. 
    attr_accessor :uber_link_type

    # The text of the embedded Uber link  Default is Ride there with Uber.  **NOTE:** This field is only available if **uberLinkType** is TEXT. 
    attr_accessor :uber_link_text

    # The text of the call-to-action that will appear in the Uber app during a trip to your location (e.g., Check out our menu!)  **NOTE:** If a value for **uberTripBrandingText** is provided, a value must also be provided for **uberTripBrandingUrl**. 
    attr_accessor :uber_trip_branding_text

    # The URL that the consumer will be redirected to when tapping on the call-to-action in the Uber app during a trip to your location.  **NOTE:** If a value for **uberTripBrandingUrl** is provided, a value must also be provided for **uberTripBrandingText**. 
    attr_accessor :uber_trip_branding_url

    # The ID that enables **uberTripBrandingText** and **uberTripBrandingUrl**. For more information, contact your Account Manager.
    attr_accessor :uber_client_id

    # The Yext-powered code that can be copied and pasted into the markup of emails or web pages where the embedded Uber link should appear
    attr_accessor :uber_embed_code

    # The Yext-powered link that can be copied and pasted into the markup of Yext Pages where the embedded Uber link should appear
    attr_accessor :uber_link

    # The year that this location was opened, not the number of years it was open  Minimum of 1000, maximum of current year + 10. 
    attr_accessor :year_established

    # Longitude where the map pin should be displayed, as provided by you  Between -180.0 and 180.0, inclusive 
    attr_accessor :display_lat

    # Longitude to use for driving directions to the location, as provided by you  Between -180.0 and 180.0, inclusive 
    attr_accessor :routable_lat

    # Longitude where the map pin should be displayed, as calculated by Yext  Between -180.0 and 180.0, inclusive 
    attr_accessor :yext_display_lat

    # Longitude to use for driving directions to the location, as calculated by Yext  Between -180.0 and 180.0, inclusive 
    attr_accessor :yext_routable_lat

    # Up to five emails addresses for reaching this location  Must be valid email addresses 
    attr_accessor :emails

    # Up to 100 specialties (e.g., for food and dining: Chicago style)  All strings must be non-empty when trimmed of whitespace. 
    attr_accessor :specialties

    # Up to 100 specialties (e.g., for food and dining: Chicago style)  All strings must be non-empty when trimmed of whitespace. 
    attr_accessor :associations

    # Up to 100 products sold at this location  All strings must be non-empty when trimmed of whitespace. 
    attr_accessor :products

    # Up to 100 services offered at this location  All strings must be non-empty when trimmed of whitespace. 
    attr_accessor :services

    # Up to 100 brands sold by this location  All strings must be non-empty when trimmed of whitespace. 
    attr_accessor :brands

    # Up to 100 languages spoken at this location.  All strings must be non-empty when trimmed of whitespace. 
    attr_accessor :languages

    # Up to 100 keywords may be provided  All strings must be non-empty when trimmed of whitespace. 
    attr_accessor :keywords

    # Label to be used for this location’s Menu lists.
    attr_accessor :menus_label

    # IDs of Menu lists associated with this location.
    attr_accessor :menu_ids

    # Label to be used for this location’s Bio lists.
    attr_accessor :bio_lists_label

    # IDs of Bio lists associated with this location.
    attr_accessor :bio_list_ids

    #  Services lists.
    attr_accessor :product_lists_label

    # IDs of Product lists associated with this location.
    attr_accessor :product_list_ids

    # Label to be used for this location’s Event lists.
    attr_accessor :event_lists_label

    # IDs of Event lists associated with this location.
    attr_accessor :event_list_ids

    # The folder that this location is in. If the location is in the customer-level (root) folder, its folderId will be 0. Must be a valid, existing Yext Folder ID or 0
    attr_accessor :folder_id

    # The IDs of the location labels that have been added to this location.  **NOTE:** You can only add labels that have already been created via our web interface. Currently, it is not possible to create new labels via the API. 
    attr_accessor :label_ids

    # A set of key-value pairs indicating the location's custom fields and their values. The keys are the Yext Custom Field IDs of the custom fields, and the values are the fields' contents. If the fields' contents are options, those options must be represented by their Yext IDs. 
    attr_accessor :custom_fields

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'account_id' => :'accountId',
        :'timestamp' => :'timestamp',
        :'location_type' => :'locationType',
        :'location_name' => :'locationName',
        :'first_name' => :'firstName',
        :'middle_name' => :'middleName',
        :'last_name' => :'lastName',
        :'office_name' => :'officeName',
        :'gender' => :'gender',
        :'npi' => :'npi',
        :'address' => :'address',
        :'address2' => :'address2',
        :'suppress_address' => :'suppressAddress',
        :'display_address' => :'displayAddress',
        :'city' => :'city',
        :'state' => :'state',
        :'zip' => :'zip',
        :'country_code' => :'countryCode',
        :'service_area' => :'serviceArea',
        :'phone' => :'phone',
        :'is_phone_tracked' => :'isPhoneTracked',
        :'local_phone' => :'localPhone',
        :'alternate_phone' => :'alternatePhone',
        :'fax_phone' => :'faxPhone',
        :'mobile_phone' => :'mobilePhone',
        :'toll_free_phone' => :'tollFreePhone',
        :'tty_phone' => :'ttyPhone',
        :'category_ids' => :'categoryIds',
        :'featured_message' => :'featuredMessage',
        :'featured_message_url' => :'featuredMessageUrl',
        :'website_url' => :'websiteUrl',
        :'display_website_url' => :'displayWebsiteUrl',
        :'reservation_url' => :'reservationUrl',
        :'hours' => :'hours',
        :'additional_hours_text' => :'additionalHoursText',
        :'holiday_hours' => :'holidayHours',
        :'description' => :'description',
        :'conditions_treated' => :'conditionsTreated',
        :'certifications' => :'certifications',
        :'education_list' => :'educationList',
        :'admitting_hospitals' => :'admittingHospitals',
        :'accepting_new_patients' => :'acceptingNewPatients',
        :'closed' => :'closed',
        :'payment_options' => :'paymentOptions',
        :'insurance_accepted' => :'insuranceAccepted',
        :'logo' => :'logo',
        :'photos' => :'photos',
        :'headshot' => :'headshot',
        :'video_urls' => :'videoUrls',
        :'instagram_handle' => :'instagramHandle',
        :'twitter_handle' => :'twitterHandle',
        :'google_website_override' => :'googleWebsiteOverride',
        :'google_cover_photo' => :'googleCoverPhoto',
        :'google_profile_photo' => :'googleProfilePhoto',
        :'google_preferred_photo' => :'googlePreferredPhoto',
        :'google_attributes' => :'googleAttributes',
        :'facebook_page_url' => :'facebookPageUrl',
        :'facebook_cover_photo' => :'facebookCoverPhoto',
        :'facebook_profile_picture' => :'facebookProfilePicture',
        :'uber_link_type' => :'uberLinkType',
        :'uber_link_text' => :'uberLinkText',
        :'uber_trip_branding_text' => :'uberTripBrandingText',
        :'uber_trip_branding_url' => :'uberTripBrandingUrl',
        :'uber_client_id' => :'uberClientId',
        :'uber_embed_code' => :'uberEmbedCode',
        :'uber_link' => :'uberLink',
        :'year_established' => :'yearEstablished',
        :'display_lat' => :'displayLat',
        :'routable_lat' => :'routableLat',
        :'yext_display_lat' => :'yextDisplayLat',
        :'yext_routable_lat' => :'yextRoutableLat',
        :'emails' => :'emails',
        :'specialties' => :'specialties',
        :'associations' => :'associations',
        :'products' => :'products',
        :'services' => :'services',
        :'brands' => :'brands',
        :'languages' => :'languages',
        :'keywords' => :'keywords',
        :'menus_label' => :'menusLabel',
        :'menu_ids' => :'menuIds',
        :'bio_lists_label' => :'bioListsLabel',
        :'bio_list_ids' => :'bioListIds',
        :'product_lists_label' => :'productListsLabel',
        :'product_list_ids' => :'productListIds',
        :'event_lists_label' => :'eventListsLabel',
        :'event_list_ids' => :'eventListIds',
        :'folder_id' => :'folderId',
        :'label_ids' => :'labelIds',
        :'custom_fields' => :'customFields'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'account_id' => :'String',
        :'timestamp' => :'Integer',
        :'location_type' => :'LocationType',
        :'location_name' => :'String',
        :'first_name' => :'String',
        :'middle_name' => :'String',
        :'last_name' => :'String',
        :'office_name' => :'String',
        :'gender' => :'String',
        :'npi' => :'String',
        :'address' => :'String',
        :'address2' => :'String',
        :'suppress_address' => :'BOOLEAN',
        :'display_address' => :'String',
        :'city' => :'String',
        :'state' => :'String',
        :'zip' => :'String',
        :'country_code' => :'String',
        :'service_area' => :'LocationServiceArea',
        :'phone' => :'String',
        :'is_phone_tracked' => :'BOOLEAN',
        :'local_phone' => :'String',
        :'alternate_phone' => :'String',
        :'fax_phone' => :'String',
        :'mobile_phone' => :'String',
        :'toll_free_phone' => :'String',
        :'tty_phone' => :'String',
        :'category_ids' => :'Array<String>',
        :'featured_message' => :'String',
        :'featured_message_url' => :'String',
        :'website_url' => :'String',
        :'display_website_url' => :'String',
        :'reservation_url' => :'String',
        :'hours' => :'String',
        :'additional_hours_text' => :'String',
        :'holiday_hours' => :'Array<LocationHolidayHours>',
        :'description' => :'String',
        :'conditions_treated' => :'Array<String>',
        :'certifications' => :'Array<String>',
        :'education_list' => :'Array<LocationEducationList>',
        :'admitting_hospitals' => :'Array<String>',
        :'accepting_new_patients' => :'BOOLEAN',
        :'closed' => :'LocationClosed',
        :'payment_options' => :'Array<String>',
        :'insurance_accepted' => :'Array<String>',
        :'logo' => :'LocationPhoto',
        :'photos' => :'Array<LocationPhoto>',
        :'headshot' => :'Object',
        :'video_urls' => :'Array<String>',
        :'instagram_handle' => :'String',
        :'twitter_handle' => :'String',
        :'google_website_override' => :'String',
        :'google_cover_photo' => :'Object',
        :'google_profile_photo' => :'Object',
        :'google_preferred_photo' => :'String',
        :'google_attributes' => :'Array<LocationGoogleAttributes>',
        :'facebook_page_url' => :'String',
        :'facebook_cover_photo' => :'Object',
        :'facebook_profile_picture' => :'Object',
        :'uber_link_type' => :'String',
        :'uber_link_text' => :'String',
        :'uber_trip_branding_text' => :'String',
        :'uber_trip_branding_url' => :'String',
        :'uber_client_id' => :'String',
        :'uber_embed_code' => :'String',
        :'uber_link' => :'String',
        :'year_established' => :'String',
        :'display_lat' => :'Float',
        :'routable_lat' => :'Float',
        :'yext_display_lat' => :'Float',
        :'yext_routable_lat' => :'Float',
        :'emails' => :'Array<String>',
        :'specialties' => :'Array<String>',
        :'associations' => :'Array<String>',
        :'products' => :'Array<String>',
        :'services' => :'Array<String>',
        :'brands' => :'Array<String>',
        :'languages' => :'Array<String>',
        :'keywords' => :'Array<String>',
        :'menus_label' => :'String',
        :'menu_ids' => :'Array<String>',
        :'bio_lists_label' => :'String',
        :'bio_list_ids' => :'Array<String>',
        :'product_lists_label' => :'String',
        :'product_list_ids' => :'Array<String>',
        :'event_lists_label' => :'String',
        :'event_list_ids' => :'Array<String>',
        :'folder_id' => :'String',
        :'label_ids' => :'Array<String>',
        :'custom_fields' => :'Hash<String, Object>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'accountId')
        self.account_id = attributes[:'accountId']
      end

      if attributes.has_key?(:'timestamp')
        self.timestamp = attributes[:'timestamp']
      end

      if attributes.has_key?(:'locationType')
        self.location_type = attributes[:'locationType']
      end

      if attributes.has_key?(:'locationName')
        self.location_name = attributes[:'locationName']
      end

      if attributes.has_key?(:'firstName')
        self.first_name = attributes[:'firstName']
      end

      if attributes.has_key?(:'middleName')
        self.middle_name = attributes[:'middleName']
      end

      if attributes.has_key?(:'lastName')
        self.last_name = attributes[:'lastName']
      end

      if attributes.has_key?(:'officeName')
        self.office_name = attributes[:'officeName']
      end

      if attributes.has_key?(:'gender')
        self.gender = attributes[:'gender']
      end

      if attributes.has_key?(:'npi')
        self.npi = attributes[:'npi']
      end

      if attributes.has_key?(:'address')
        self.address = attributes[:'address']
      end

      if attributes.has_key?(:'address2')
        self.address2 = attributes[:'address2']
      end

      if attributes.has_key?(:'suppressAddress')
        self.suppress_address = attributes[:'suppressAddress']
      end

      if attributes.has_key?(:'displayAddress')
        self.display_address = attributes[:'displayAddress']
      end

      if attributes.has_key?(:'city')
        self.city = attributes[:'city']
      end

      if attributes.has_key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.has_key?(:'zip')
        self.zip = attributes[:'zip']
      end

      if attributes.has_key?(:'countryCode')
        self.country_code = attributes[:'countryCode']
      end

      if attributes.has_key?(:'serviceArea')
        self.service_area = attributes[:'serviceArea']
      end

      if attributes.has_key?(:'phone')
        self.phone = attributes[:'phone']
      end

      if attributes.has_key?(:'isPhoneTracked')
        self.is_phone_tracked = attributes[:'isPhoneTracked']
      end

      if attributes.has_key?(:'localPhone')
        self.local_phone = attributes[:'localPhone']
      end

      if attributes.has_key?(:'alternatePhone')
        self.alternate_phone = attributes[:'alternatePhone']
      end

      if attributes.has_key?(:'faxPhone')
        self.fax_phone = attributes[:'faxPhone']
      end

      if attributes.has_key?(:'mobilePhone')
        self.mobile_phone = attributes[:'mobilePhone']
      end

      if attributes.has_key?(:'tollFreePhone')
        self.toll_free_phone = attributes[:'tollFreePhone']
      end

      if attributes.has_key?(:'ttyPhone')
        self.tty_phone = attributes[:'ttyPhone']
      end

      if attributes.has_key?(:'categoryIds')
        if (value = attributes[:'categoryIds']).is_a?(Array)
          self.category_ids = value
        end
      end

      if attributes.has_key?(:'featuredMessage')
        self.featured_message = attributes[:'featuredMessage']
      end

      if attributes.has_key?(:'featuredMessageUrl')
        self.featured_message_url = attributes[:'featuredMessageUrl']
      end

      if attributes.has_key?(:'websiteUrl')
        self.website_url = attributes[:'websiteUrl']
      end

      if attributes.has_key?(:'displayWebsiteUrl')
        self.display_website_url = attributes[:'displayWebsiteUrl']
      end

      if attributes.has_key?(:'reservationUrl')
        self.reservation_url = attributes[:'reservationUrl']
      end

      if attributes.has_key?(:'hours')
        self.hours = attributes[:'hours']
      end

      if attributes.has_key?(:'additionalHoursText')
        self.additional_hours_text = attributes[:'additionalHoursText']
      end

      if attributes.has_key?(:'holidayHours')
        if (value = attributes[:'holidayHours']).is_a?(Array)
          self.holiday_hours = value
        end
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'conditionsTreated')
        if (value = attributes[:'conditionsTreated']).is_a?(Array)
          self.conditions_treated = value
        end
      end

      if attributes.has_key?(:'certifications')
        if (value = attributes[:'certifications']).is_a?(Array)
          self.certifications = value
        end
      end

      if attributes.has_key?(:'educationList')
        if (value = attributes[:'educationList']).is_a?(Array)
          self.education_list = value
        end
      end

      if attributes.has_key?(:'admittingHospitals')
        if (value = attributes[:'admittingHospitals']).is_a?(Array)
          self.admitting_hospitals = value
        end
      end

      if attributes.has_key?(:'acceptingNewPatients')
        self.accepting_new_patients = attributes[:'acceptingNewPatients']
      end

      if attributes.has_key?(:'closed')
        self.closed = attributes[:'closed']
      end

      if attributes.has_key?(:'paymentOptions')
        if (value = attributes[:'paymentOptions']).is_a?(Array)
          self.payment_options = value
        end
      end

      if attributes.has_key?(:'insuranceAccepted')
        if (value = attributes[:'insuranceAccepted']).is_a?(Array)
          self.insurance_accepted = value
        end
      end

      if attributes.has_key?(:'logo')
        self.logo = attributes[:'logo']
      end

      if attributes.has_key?(:'photos')
        if (value = attributes[:'photos']).is_a?(Array)
          self.photos = value
        end
      end

      if attributes.has_key?(:'headshot')
        self.headshot = attributes[:'headshot']
      end

      if attributes.has_key?(:'videoUrls')
        if (value = attributes[:'videoUrls']).is_a?(Array)
          self.video_urls = value
        end
      end

      if attributes.has_key?(:'instagramHandle')
        self.instagram_handle = attributes[:'instagramHandle']
      end

      if attributes.has_key?(:'twitterHandle')
        self.twitter_handle = attributes[:'twitterHandle']
      end

      if attributes.has_key?(:'googleWebsiteOverride')
        self.google_website_override = attributes[:'googleWebsiteOverride']
      end

      if attributes.has_key?(:'googleCoverPhoto')
        self.google_cover_photo = attributes[:'googleCoverPhoto']
      end

      if attributes.has_key?(:'googleProfilePhoto')
        self.google_profile_photo = attributes[:'googleProfilePhoto']
      end

      if attributes.has_key?(:'googlePreferredPhoto')
        self.google_preferred_photo = attributes[:'googlePreferredPhoto']
      end

      if attributes.has_key?(:'googleAttributes')
        if (value = attributes[:'googleAttributes']).is_a?(Array)
          self.google_attributes = value
        end
      end

      if attributes.has_key?(:'facebookPageUrl')
        self.facebook_page_url = attributes[:'facebookPageUrl']
      end

      if attributes.has_key?(:'facebookCoverPhoto')
        self.facebook_cover_photo = attributes[:'facebookCoverPhoto']
      end

      if attributes.has_key?(:'facebookProfilePicture')
        self.facebook_profile_picture = attributes[:'facebookProfilePicture']
      end

      if attributes.has_key?(:'uberLinkType')
        self.uber_link_type = attributes[:'uberLinkType']
      end

      if attributes.has_key?(:'uberLinkText')
        self.uber_link_text = attributes[:'uberLinkText']
      end

      if attributes.has_key?(:'uberTripBrandingText')
        self.uber_trip_branding_text = attributes[:'uberTripBrandingText']
      end

      if attributes.has_key?(:'uberTripBrandingUrl')
        self.uber_trip_branding_url = attributes[:'uberTripBrandingUrl']
      end

      if attributes.has_key?(:'uberClientId')
        self.uber_client_id = attributes[:'uberClientId']
      end

      if attributes.has_key?(:'uberEmbedCode')
        self.uber_embed_code = attributes[:'uberEmbedCode']
      end

      if attributes.has_key?(:'uberLink')
        self.uber_link = attributes[:'uberLink']
      end

      if attributes.has_key?(:'yearEstablished')
        self.year_established = attributes[:'yearEstablished']
      end

      if attributes.has_key?(:'displayLat')
        self.display_lat = attributes[:'displayLat']
      end

      if attributes.has_key?(:'routableLat')
        self.routable_lat = attributes[:'routableLat']
      end

      if attributes.has_key?(:'yextDisplayLat')
        self.yext_display_lat = attributes[:'yextDisplayLat']
      end

      if attributes.has_key?(:'yextRoutableLat')
        self.yext_routable_lat = attributes[:'yextRoutableLat']
      end

      if attributes.has_key?(:'emails')
        if (value = attributes[:'emails']).is_a?(Array)
          self.emails = value
        end
      end

      if attributes.has_key?(:'specialties')
        if (value = attributes[:'specialties']).is_a?(Array)
          self.specialties = value
        end
      end

      if attributes.has_key?(:'associations')
        if (value = attributes[:'associations']).is_a?(Array)
          self.associations = value
        end
      end

      if attributes.has_key?(:'products')
        if (value = attributes[:'products']).is_a?(Array)
          self.products = value
        end
      end

      if attributes.has_key?(:'services')
        if (value = attributes[:'services']).is_a?(Array)
          self.services = value
        end
      end

      if attributes.has_key?(:'brands')
        if (value = attributes[:'brands']).is_a?(Array)
          self.brands = value
        end
      end

      if attributes.has_key?(:'languages')
        if (value = attributes[:'languages']).is_a?(Array)
          self.languages = value
        end
      end

      if attributes.has_key?(:'keywords')
        if (value = attributes[:'keywords']).is_a?(Array)
          self.keywords = value
        end
      end

      if attributes.has_key?(:'menusLabel')
        self.menus_label = attributes[:'menusLabel']
      end

      if attributes.has_key?(:'menuIds')
        if (value = attributes[:'menuIds']).is_a?(Array)
          self.menu_ids = value
        end
      end

      if attributes.has_key?(:'bioListsLabel')
        self.bio_lists_label = attributes[:'bioListsLabel']
      end

      if attributes.has_key?(:'bioListIds')
        if (value = attributes[:'bioListIds']).is_a?(Array)
          self.bio_list_ids = value
        end
      end

      if attributes.has_key?(:'productListsLabel')
        self.product_lists_label = attributes[:'productListsLabel']
      end

      if attributes.has_key?(:'productListIds')
        if (value = attributes[:'productListIds']).is_a?(Array)
          self.product_list_ids = value
        end
      end

      if attributes.has_key?(:'eventListsLabel')
        self.event_lists_label = attributes[:'eventListsLabel']
      end

      if attributes.has_key?(:'eventListIds')
        if (value = attributes[:'eventListIds']).is_a?(Array)
          self.event_list_ids = value
        end
      end

      if attributes.has_key?(:'folderId')
        self.folder_id = attributes[:'folderId']
      end

      if attributes.has_key?(:'labelIds')
        if (value = attributes[:'labelIds']).is_a?(Array)
          self.label_ids = value
        end
      end

      if attributes.has_key?(:'customFields')
        if (value = attributes[:'customFields']).is_a?(Array)
          self.custom_fields = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new

      if !@id.nil? && @id.to_s.length > 50
        invalid_properties.push("invalid value for 'id', the character length must be smaller than or equal to 50.")
      end


      if !@account_id.nil? && @account_id.to_s.length > 50
        invalid_properties.push("invalid value for 'account_id', the character length must be smaller than or equal to 50.")
      end


      if !@location_name.nil? && @location_name.to_s.length > 100
        invalid_properties.push("invalid value for 'location_name', the character length must be smaller than or equal to 100.")
      end


      if !@address.nil? && @address.to_s.length > 255
        invalid_properties.push("invalid value for 'address', the character length must be smaller than or equal to 255.")
      end


      if !@address2.nil? && @address2.to_s.length > 255
        invalid_properties.push("invalid value for 'address2', the character length must be smaller than or equal to 255.")
      end


      if !@display_address.nil? && @display_address.to_s.length > 255
        invalid_properties.push("invalid value for 'display_address', the character length must be smaller than or equal to 255.")
      end


      if !@city.nil? && @city.to_s.length > 80
        invalid_properties.push("invalid value for 'city', the character length must be smaller than or equal to 80.")
      end


      if !@state.nil? && @state.to_s.length > 80
        invalid_properties.push("invalid value for 'state', the character length must be smaller than or equal to 80.")
      end


      if !@zip.nil? && @zip.to_s.length > 10
        invalid_properties.push("invalid value for 'zip', the character length must be smaller than or equal to 10.")
      end


      if !@country_code.nil? && @country_code.to_s.length > 2
        invalid_properties.push("invalid value for 'country_code', the character length must be smaller than or equal to 2.")
      end


      if !@featured_message.nil? && @featured_message.to_s.length > 50
        invalid_properties.push("invalid value for 'featured_message', the character length must be smaller than or equal to 50.")
      end


      if !@featured_message_url.nil? && @featured_message_url.to_s.length > 255
        invalid_properties.push("invalid value for 'featured_message_url', the character length must be smaller than or equal to 255.")
      end


      if !@website_url.nil? && @website_url.to_s.length > 255
        invalid_properties.push("invalid value for 'website_url', the character length must be smaller than or equal to 255.")
      end


      if !@display_website_url.nil? && @display_website_url.to_s.length > 255
        invalid_properties.push("invalid value for 'display_website_url', the character length must be smaller than or equal to 255.")
      end


      if !@reservation_url.nil? && @reservation_url.to_s.length > 255
        invalid_properties.push("invalid value for 'reservation_url', the character length must be smaller than or equal to 255.")
      end


      if !@hours.nil? && @hours.to_s.length > 255
        invalid_properties.push("invalid value for 'hours', the character length must be smaller than or equal to 255.")
      end


      if !@additional_hours_text.nil? && @additional_hours_text.to_s.length > 255
        invalid_properties.push("invalid value for 'additional_hours_text', the character length must be smaller than or equal to 255.")
      end


      if !@description.nil? && @description.to_s.length > 5000
        invalid_properties.push("invalid value for 'description', the character length must be smaller than or equal to 5000.")
      end


      if !@twitter_handle.nil? && @twitter_handle.to_s.length > 15
        invalid_properties.push("invalid value for 'twitter_handle', the character length must be smaller than or equal to 15.")
      end


      if !@google_website_override.nil? && @google_website_override.to_s.length > 255
        invalid_properties.push("invalid value for 'google_website_override', the character length must be smaller than or equal to 255.")
      end


      if !@facebook_page_url.nil? && @facebook_page_url.to_s.length > 255
        invalid_properties.push("invalid value for 'facebook_page_url', the character length must be smaller than or equal to 255.")
      end


      if !@uber_link_text.nil? && @uber_link_text.to_s.length > 100
        invalid_properties.push("invalid value for 'uber_link_text', the character length must be smaller than or equal to 100.")
      end


      if !@uber_trip_branding_text.nil? && @uber_trip_branding_text.to_s.length > 28
        invalid_properties.push("invalid value for 'uber_trip_branding_text', the character length must be smaller than or equal to 28.")
      end


      if !@year_established.nil? && @year_established.to_s.length > 4
        invalid_properties.push("invalid value for 'year_established', the character length must be smaller than or equal to 4.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@id.nil? && @id.to_s.length > 50
      return false if !@account_id.nil? && @account_id.to_s.length > 50
      return false if !@location_name.nil? && @location_name.to_s.length > 100
      gender_validator = EnumAttributeValidator.new('String', ["FEMALE", "F", "MALE", "M", "UNSPECIFIED"])
      return false unless gender_validator.valid?(@gender)
      return false if !@address.nil? && @address.to_s.length > 255
      return false if !@address2.nil? && @address2.to_s.length > 255
      return false if !@display_address.nil? && @display_address.to_s.length > 255
      return false if !@city.nil? && @city.to_s.length > 80
      return false if !@state.nil? && @state.to_s.length > 80
      return false if !@zip.nil? && @zip.to_s.length > 10
      return false if !@country_code.nil? && @country_code.to_s.length > 2
      return false if !@featured_message.nil? && @featured_message.to_s.length > 50
      return false if !@featured_message_url.nil? && @featured_message_url.to_s.length > 255
      return false if !@website_url.nil? && @website_url.to_s.length > 255
      return false if !@display_website_url.nil? && @display_website_url.to_s.length > 255
      return false if !@reservation_url.nil? && @reservation_url.to_s.length > 255
      return false if !@hours.nil? && @hours.to_s.length > 255
      return false if !@additional_hours_text.nil? && @additional_hours_text.to_s.length > 255
      return false if !@description.nil? && @description.to_s.length > 5000
      return false if !@twitter_handle.nil? && @twitter_handle.to_s.length > 15
      return false if !@google_website_override.nil? && @google_website_override.to_s.length > 255
      return false if !@facebook_page_url.nil? && @facebook_page_url.to_s.length > 255
      uber_link_type_validator = EnumAttributeValidator.new('String', ["TEXT", "BUTTON"])
      return false unless uber_link_type_validator.valid?(@uber_link_type)
      return false if !@uber_link_text.nil? && @uber_link_text.to_s.length > 100
      return false if !@uber_trip_branding_text.nil? && @uber_trip_branding_text.to_s.length > 28
      return false if !@year_established.nil? && @year_established.to_s.length > 4
      return true
    end

    # Custom attribute writer method with validation
    # @param [Object] id Value to be assigned
    def id=(id)

      if !id.nil? && id.to_s.length > 50
        fail ArgumentError, "invalid value for 'id', the character length must be smaller than or equal to 50."
      end

      @id = id
    end

    # Custom attribute writer method with validation
    # @param [Object] account_id Value to be assigned
    def account_id=(account_id)

      if !account_id.nil? && account_id.to_s.length > 50
        fail ArgumentError, "invalid value for 'account_id', the character length must be smaller than or equal to 50."
      end

      @account_id = account_id
    end

    # Custom attribute writer method with validation
    # @param [Object] location_name Value to be assigned
    def location_name=(location_name)

      if !location_name.nil? && location_name.to_s.length > 100
        fail ArgumentError, "invalid value for 'location_name', the character length must be smaller than or equal to 100."
      end

      @location_name = location_name
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] gender Object to be assigned
    def gender=(gender)
      validator = EnumAttributeValidator.new('String', ["FEMALE", "F", "MALE", "M", "UNSPECIFIED"])
      unless validator.valid?(gender)
        fail ArgumentError, "invalid value for 'gender', must be one of #{validator.allowable_values}."
      end
      @gender = gender
    end

    # Custom attribute writer method with validation
    # @param [Object] address Value to be assigned
    def address=(address)

      if !address.nil? && address.to_s.length > 255
        fail ArgumentError, "invalid value for 'address', the character length must be smaller than or equal to 255."
      end

      @address = address
    end

    # Custom attribute writer method with validation
    # @param [Object] address2 Value to be assigned
    def address2=(address2)

      if !address2.nil? && address2.to_s.length > 255
        fail ArgumentError, "invalid value for 'address2', the character length must be smaller than or equal to 255."
      end

      @address2 = address2
    end

    # Custom attribute writer method with validation
    # @param [Object] display_address Value to be assigned
    def display_address=(display_address)

      if !display_address.nil? && display_address.to_s.length > 255
        fail ArgumentError, "invalid value for 'display_address', the character length must be smaller than or equal to 255."
      end

      @display_address = display_address
    end

    # Custom attribute writer method with validation
    # @param [Object] city Value to be assigned
    def city=(city)

      if !city.nil? && city.to_s.length > 80
        fail ArgumentError, "invalid value for 'city', the character length must be smaller than or equal to 80."
      end

      @city = city
    end

    # Custom attribute writer method with validation
    # @param [Object] state Value to be assigned
    def state=(state)

      if !state.nil? && state.to_s.length > 80
        fail ArgumentError, "invalid value for 'state', the character length must be smaller than or equal to 80."
      end

      @state = state
    end

    # Custom attribute writer method with validation
    # @param [Object] zip Value to be assigned
    def zip=(zip)

      if !zip.nil? && zip.to_s.length > 10
        fail ArgumentError, "invalid value for 'zip', the character length must be smaller than or equal to 10."
      end

      @zip = zip
    end

    # Custom attribute writer method with validation
    # @param [Object] country_code Value to be assigned
    def country_code=(country_code)

      if !country_code.nil? && country_code.to_s.length > 2
        fail ArgumentError, "invalid value for 'country_code', the character length must be smaller than or equal to 2."
      end

      @country_code = country_code
    end

    # Custom attribute writer method with validation
    # @param [Object] featured_message Value to be assigned
    def featured_message=(featured_message)

      if !featured_message.nil? && featured_message.to_s.length > 50
        fail ArgumentError, "invalid value for 'featured_message', the character length must be smaller than or equal to 50."
      end

      @featured_message = featured_message
    end

    # Custom attribute writer method with validation
    # @param [Object] featured_message_url Value to be assigned
    def featured_message_url=(featured_message_url)

      if !featured_message_url.nil? && featured_message_url.to_s.length > 255
        fail ArgumentError, "invalid value for 'featured_message_url', the character length must be smaller than or equal to 255."
      end

      @featured_message_url = featured_message_url
    end

    # Custom attribute writer method with validation
    # @param [Object] website_url Value to be assigned
    def website_url=(website_url)

      if !website_url.nil? && website_url.to_s.length > 255
        fail ArgumentError, "invalid value for 'website_url', the character length must be smaller than or equal to 255."
      end

      @website_url = website_url
    end

    # Custom attribute writer method with validation
    # @param [Object] display_website_url Value to be assigned
    def display_website_url=(display_website_url)

      if !display_website_url.nil? && display_website_url.to_s.length > 255
        fail ArgumentError, "invalid value for 'display_website_url', the character length must be smaller than or equal to 255."
      end

      @display_website_url = display_website_url
    end

    # Custom attribute writer method with validation
    # @param [Object] reservation_url Value to be assigned
    def reservation_url=(reservation_url)

      if !reservation_url.nil? && reservation_url.to_s.length > 255
        fail ArgumentError, "invalid value for 'reservation_url', the character length must be smaller than or equal to 255."
      end

      @reservation_url = reservation_url
    end

    # Custom attribute writer method with validation
    # @param [Object] hours Value to be assigned
    def hours=(hours)

      if !hours.nil? && hours.to_s.length > 255
        fail ArgumentError, "invalid value for 'hours', the character length must be smaller than or equal to 255."
      end

      @hours = hours
    end

    # Custom attribute writer method with validation
    # @param [Object] additional_hours_text Value to be assigned
    def additional_hours_text=(additional_hours_text)

      if !additional_hours_text.nil? && additional_hours_text.to_s.length > 255
        fail ArgumentError, "invalid value for 'additional_hours_text', the character length must be smaller than or equal to 255."
      end

      @additional_hours_text = additional_hours_text
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)

      if !description.nil? && description.to_s.length > 5000
        fail ArgumentError, "invalid value for 'description', the character length must be smaller than or equal to 5000."
      end

      @description = description
    end

    # Custom attribute writer method with validation
    # @param [Object] twitter_handle Value to be assigned
    def twitter_handle=(twitter_handle)

      if !twitter_handle.nil? && twitter_handle.to_s.length > 15
        fail ArgumentError, "invalid value for 'twitter_handle', the character length must be smaller than or equal to 15."
      end

      @twitter_handle = twitter_handle
    end

    # Custom attribute writer method with validation
    # @param [Object] google_website_override Value to be assigned
    def google_website_override=(google_website_override)

      if !google_website_override.nil? && google_website_override.to_s.length > 255
        fail ArgumentError, "invalid value for 'google_website_override', the character length must be smaller than or equal to 255."
      end

      @google_website_override = google_website_override
    end

    # Custom attribute writer method with validation
    # @param [Object] facebook_page_url Value to be assigned
    def facebook_page_url=(facebook_page_url)

      if !facebook_page_url.nil? && facebook_page_url.to_s.length > 255
        fail ArgumentError, "invalid value for 'facebook_page_url', the character length must be smaller than or equal to 255."
      end

      @facebook_page_url = facebook_page_url
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] uber_link_type Object to be assigned
    def uber_link_type=(uber_link_type)
      validator = EnumAttributeValidator.new('String', ["TEXT", "BUTTON"])
      unless validator.valid?(uber_link_type)
        fail ArgumentError, "invalid value for 'uber_link_type', must be one of #{validator.allowable_values}."
      end
      @uber_link_type = uber_link_type
    end

    # Custom attribute writer method with validation
    # @param [Object] uber_link_text Value to be assigned
    def uber_link_text=(uber_link_text)

      if !uber_link_text.nil? && uber_link_text.to_s.length > 100
        fail ArgumentError, "invalid value for 'uber_link_text', the character length must be smaller than or equal to 100."
      end

      @uber_link_text = uber_link_text
    end

    # Custom attribute writer method with validation
    # @param [Object] uber_trip_branding_text Value to be assigned
    def uber_trip_branding_text=(uber_trip_branding_text)

      if !uber_trip_branding_text.nil? && uber_trip_branding_text.to_s.length > 28
        fail ArgumentError, "invalid value for 'uber_trip_branding_text', the character length must be smaller than or equal to 28."
      end

      @uber_trip_branding_text = uber_trip_branding_text
    end

    # Custom attribute writer method with validation
    # @param [Object] year_established Value to be assigned
    def year_established=(year_established)

      if !year_established.nil? && year_established.to_s.length > 4
        fail ArgumentError, "invalid value for 'year_established', the character length must be smaller than or equal to 4."
      end

      @year_established = year_established
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          account_id == o.account_id &&
          timestamp == o.timestamp &&
          location_type == o.location_type &&
          location_name == o.location_name &&
          first_name == o.first_name &&
          middle_name == o.middle_name &&
          last_name == o.last_name &&
          office_name == o.office_name &&
          gender == o.gender &&
          npi == o.npi &&
          address == o.address &&
          address2 == o.address2 &&
          suppress_address == o.suppress_address &&
          display_address == o.display_address &&
          city == o.city &&
          state == o.state &&
          zip == o.zip &&
          country_code == o.country_code &&
          service_area == o.service_area &&
          phone == o.phone &&
          is_phone_tracked == o.is_phone_tracked &&
          local_phone == o.local_phone &&
          alternate_phone == o.alternate_phone &&
          fax_phone == o.fax_phone &&
          mobile_phone == o.mobile_phone &&
          toll_free_phone == o.toll_free_phone &&
          tty_phone == o.tty_phone &&
          category_ids == o.category_ids &&
          featured_message == o.featured_message &&
          featured_message_url == o.featured_message_url &&
          website_url == o.website_url &&
          display_website_url == o.display_website_url &&
          reservation_url == o.reservation_url &&
          hours == o.hours &&
          additional_hours_text == o.additional_hours_text &&
          holiday_hours == o.holiday_hours &&
          description == o.description &&
          conditions_treated == o.conditions_treated &&
          certifications == o.certifications &&
          education_list == o.education_list &&
          admitting_hospitals == o.admitting_hospitals &&
          accepting_new_patients == o.accepting_new_patients &&
          closed == o.closed &&
          payment_options == o.payment_options &&
          insurance_accepted == o.insurance_accepted &&
          logo == o.logo &&
          photos == o.photos &&
          headshot == o.headshot &&
          video_urls == o.video_urls &&
          instagram_handle == o.instagram_handle &&
          twitter_handle == o.twitter_handle &&
          google_website_override == o.google_website_override &&
          google_cover_photo == o.google_cover_photo &&
          google_profile_photo == o.google_profile_photo &&
          google_preferred_photo == o.google_preferred_photo &&
          google_attributes == o.google_attributes &&
          facebook_page_url == o.facebook_page_url &&
          facebook_cover_photo == o.facebook_cover_photo &&
          facebook_profile_picture == o.facebook_profile_picture &&
          uber_link_type == o.uber_link_type &&
          uber_link_text == o.uber_link_text &&
          uber_trip_branding_text == o.uber_trip_branding_text &&
          uber_trip_branding_url == o.uber_trip_branding_url &&
          uber_client_id == o.uber_client_id &&
          uber_embed_code == o.uber_embed_code &&
          uber_link == o.uber_link &&
          year_established == o.year_established &&
          display_lat == o.display_lat &&
          routable_lat == o.routable_lat &&
          yext_display_lat == o.yext_display_lat &&
          yext_routable_lat == o.yext_routable_lat &&
          emails == o.emails &&
          specialties == o.specialties &&
          associations == o.associations &&
          products == o.products &&
          services == o.services &&
          brands == o.brands &&
          languages == o.languages &&
          keywords == o.keywords &&
          menus_label == o.menus_label &&
          menu_ids == o.menu_ids &&
          bio_lists_label == o.bio_lists_label &&
          bio_list_ids == o.bio_list_ids &&
          product_lists_label == o.product_lists_label &&
          product_list_ids == o.product_list_ids &&
          event_lists_label == o.event_lists_label &&
          event_list_ids == o.event_list_ids &&
          folder_id == o.folder_id &&
          label_ids == o.label_ids &&
          custom_fields == o.custom_fields
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, account_id, timestamp, location_type, location_name, first_name, middle_name, last_name, office_name, gender, npi, address, address2, suppress_address, display_address, city, state, zip, country_code, service_area, phone, is_phone_tracked, local_phone, alternate_phone, fax_phone, mobile_phone, toll_free_phone, tty_phone, category_ids, featured_message, featured_message_url, website_url, display_website_url, reservation_url, hours, additional_hours_text, holiday_hours, description, conditions_treated, certifications, education_list, admitting_hospitals, accepting_new_patients, closed, payment_options, insurance_accepted, logo, photos, headshot, video_urls, instagram_handle, twitter_handle, google_website_override, google_cover_photo, google_profile_photo, google_preferred_photo, google_attributes, facebook_page_url, facebook_cover_photo, facebook_profile_picture, uber_link_type, uber_link_text, uber_trip_branding_text, uber_trip_branding_url, uber_client_id, uber_embed_code, uber_link, year_established, display_lat, routable_lat, yext_display_lat, yext_routable_lat, emails, specialties, associations, products, services, brands, languages, keywords, menus_label, menu_ids, bio_lists_label, bio_list_ids, product_lists_label, product_list_ids, event_lists_label, event_list_ids, folder_id, label_ids, custom_fields].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = YextClient.const_get(type).new
        if defined? temp_model.isEnum 
          value.to_s
        else
          temp_model.build_from_hash(value)
        end
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
