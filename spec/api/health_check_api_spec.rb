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

# Unit tests for YextClient::HealthCheckApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'HealthCheckApi' do
  before do
    # run before each test
    @instance = YextClient::HealthCheckApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of HealthCheckApi' do
    it 'should create an instact of HealthCheckApi' do
      expect(@instance).to be_instance_of(YextClient::HealthCheckApi)
    end
  end

  # unit tests for health_check
  # Health Check
  # The Health Check endpoint allows you to monitor the status of Yext&#39;s systems.  A response with a status code other than 200 OK indicates that our systems are not operational.  The body of the response may contain information about the status. However, no part of your Yext integration should depend on the content of the response.  **NOTE:** This call does not require authentication. 
  # @param [Hash] opts the optional parameters
  # @return [String]
  describe 'health_check test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
