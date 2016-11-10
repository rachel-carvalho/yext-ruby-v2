=begin
#Yext API

# 

OpenAPI spec version: 2.0

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

# Unit tests for YextClient::PowerListingsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'PowerListingsApi' do
  before do
    # run before each test
    @instance = YextClient::PowerListingsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PowerListingsApi' do
    it 'should create an instact of PowerListingsApi' do
      expect(@instance).to be_instance_of(YextClient::PowerListingsApi)
    end
  end

  # unit tests for create_duplicate
  # Duplicates: Create (January 2017)
  # Creates a new Duplicate with status SUPPRESSION_REQUESTED
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param url URL of the Duplicate listing
  # @param [Hash] opts the optional parameters
  # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  # @option opts [Array<String>] :publisher_ids List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  # @return [IdResponse]
  describe 'create_duplicate test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_duplicate
  # Duplicates: Delete (January 2017)
  # Indicates that a Duplicate should be ignored
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param duplicate_id 
  # @param [Hash] opts the optional parameters
  # @return [ErrorResponse]
  describe 'delete_duplicate test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_publisher_suggestion
  # Publisher Suggestions: Get
  # Fetches details of a specific Publisher Suggestion
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param suggestion_id 
  # @param [Hash] opts the optional parameters
  # @return [PublisherSuggestionResponse]
  describe 'get_publisher_suggestion test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_duplicates
  # Duplicates: List (January 2017)
  # Retrieve Duplicates for an account
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results.
  # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  # @option opts [Array<String>] :publisher_ids List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  # @option opts [Array<String>] :statuses When specified, only Duplicates with the provided statuses will be returned  **Example:** POSSIBLE_DUPLICATE,SUPPRESSION_REQUESTED 
  # @return [DuplicatesResponse]
  describe 'list_duplicates test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_listings
  # Listings: List
  # Retrieve all Listings matching the given criteria including status and reasons why a Listing may be unavailable
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results.
  # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  # @option opts [Array<String>] :publisher_ids List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  # @return [ListingsResponse]
  describe 'list_listings test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_publisher_suggestions
  # Publisher Suggestions: List
  # Retrieve suggestions publishers have submitted for the Locations in an account
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit Number of results to return
  # @option opts [Integer] :offset Number of results to skip. Used to page through results.
  # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  # @option opts [Array<String>] :publisher_ids List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  # @option opts [Array<String>] :statuses When specified, only Publisher Suggestions with the provided statuses will be returned  **Example:** WAITING_ON_CUSTOMER,EXPIRED 
  # @return [PublisherSuggestionsResponse]
  describe 'list_publisher_suggestions test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_publishers
  # Publishers: List
  # Retrieve list of Publishers
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :subset **ALL** - return all publishers  **RELEVANT_ONLY** - only return publishers relevant to the account based on supported countries and location types 
  # @return [PublishersResponse]
  describe 'list_publishers test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for opt_in_listings
  # Listings: Opt In
  # Opts designated locations into designated publishers  **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you will receive a 400 error response. 
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  # @option opts [Array<String>] :publisher_ids List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  # @return [ErrorResponse]
  describe 'opt_in_listings test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for opt_out_listings
  # Listings: Opt Out
  # Opts designated locations out of designated publishers  **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you will receive a 400 error response. 
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example:** loc123,loc456,loc789 
  # @option opts [Array<String>] :publisher_ids List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  # @return [ErrorResponse]
  describe 'opt_out_listings test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for suppress_duplicate
  # Duplicates: Suppress (January 2017)
  # Request suppression of a Duplicate
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param duplicate_id 
  # @param [Hash] opts the optional parameters
  # @return [ErrorResponse]
  describe 'suppress_duplicate test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_publisher_suggestion
  # Publisher Suggestions: Update
  # Accept or reject a Publisher Suggestion
  # @param account_id 
  # @param v A date in &#x60;YYYYMMDD&#x60; format.
  # @param suggestion_id 
  # @param status The status of the Publisher Suggestion
  # @param [Hash] opts the optional parameters
  # @return [ErrorResponse]
  describe 'update_publisher_suggestion test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
