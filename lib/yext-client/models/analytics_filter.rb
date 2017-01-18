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

require 'date'

module YextClient

  class AnalyticsFilter
    # The inclusive start date for the report data.  Defaults to 90 days before the end date. E.g. ‘2016-08-22’ NOTE: If `WEEKS`, `MONTHS`, or `MONTHS_RETAIL` is in dimensions, startDate must coincide with the beginning and end of a week or month, depending on the dimension chosen.
    attr_accessor :start_date

    # Array of locationIds
    attr_accessor :location_ids

    # The inclusive end date for the report data.  Defaults to the lowest common denominator of the relevant maximum reporting dates. E.g. ‘2016-08-30’ NOTE: If `WEEKS`, `MONTHS`, or `MONTHS_RETAIL` is in dimensions, endDate must coincide with the beginning and end of a week or month, depending on the dimension chosen.
    attr_accessor :end_date

    attr_accessor :search_type

    # Array of 3166 Alpha-2 country codes.
    attr_accessor :countries

    attr_accessor :min_search_frequency

    attr_accessor :foursquare_checkin_gender

    attr_accessor :foursquare_checkin_age

    # Specifies the hour(s) of day that should be included in the report. Can only, and must be used with the `GOOGLE_PHONE_CALLS` metric.
    attr_accessor :hours

    # Array of location labels
    attr_accessor :location_labels

    attr_accessor :instagram_content_type

    # Specifies the type of customer actions to be included in the report. Can only be used with the `GOOGLE_CUSTOMER_ACTIONS` metric.
    attr_accessor :google_action_type

    # Specifies the type of queries to be included in the report. Can only be used with the `GOOGLE_SEARCHES` metric.
    attr_accessor :google_query_type

    # Array of platform IDs.
    attr_accessor :platforms

    attr_accessor :max_search_frequency

    attr_accessor :foursquare_checkin_type

    attr_accessor :search_term

    # Specifies the folder whose locations and subfolders should be included in the results. Default is 0 (root folder). Cannot be used when `ACCOUNT_ID` is in dimensions.
    attr_accessor :folder_id

    attr_accessor :foursquare_checkin_time_of_day

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
        :'start_date' => :'startDate',
        :'location_ids' => :'locationIds',
        :'end_date' => :'endDate',
        :'search_type' => :'searchType',
        :'countries' => :'countries',
        :'min_search_frequency' => :'minSearchFrequency',
        :'foursquare_checkin_gender' => :'foursquareCheckinGender',
        :'foursquare_checkin_age' => :'foursquareCheckinAge',
        :'hours' => :'hours',
        :'location_labels' => :'locationLabels',
        :'instagram_content_type' => :'instagramContentType',
        :'google_action_type' => :'googleActionType',
        :'google_query_type' => :'googleQueryType',
        :'platforms' => :'platforms',
        :'max_search_frequency' => :'maxSearchFrequency',
        :'foursquare_checkin_type' => :'foursquareCheckinType',
        :'search_term' => :'searchTerm',
        :'folder_id' => :'folderId',
        :'foursquare_checkin_time_of_day' => :'foursquareCheckinTimeOfDay'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'start_date' => :'Date',
        :'location_ids' => :'Array<String>',
        :'end_date' => :'Date',
        :'search_type' => :'String',
        :'countries' => :'Array<String>',
        :'min_search_frequency' => :'Float',
        :'foursquare_checkin_gender' => :'String',
        :'foursquare_checkin_age' => :'String',
        :'hours' => :'Array<Float>',
        :'location_labels' => :'Array<String>',
        :'instagram_content_type' => :'String',
        :'google_action_type' => :'Array<String>',
        :'google_query_type' => :'Array<String>',
        :'platforms' => :'Array<String>',
        :'max_search_frequency' => :'Float',
        :'foursquare_checkin_type' => :'String',
        :'search_term' => :'String',
        :'folder_id' => :'Integer',
        :'foursquare_checkin_time_of_day' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'startDate')
        self.start_date = attributes[:'startDate']
      end

      if attributes.has_key?(:'locationIds')
        if (value = attributes[:'locationIds']).is_a?(Array)
          self.location_ids = value
        end
      end

      if attributes.has_key?(:'endDate')
        self.end_date = attributes[:'endDate']
      end

      if attributes.has_key?(:'searchType')
        self.search_type = attributes[:'searchType']
      end

      if attributes.has_key?(:'countries')
        if (value = attributes[:'countries']).is_a?(Array)
          self.countries = value
        end
      end

      if attributes.has_key?(:'minSearchFrequency')
        self.min_search_frequency = attributes[:'minSearchFrequency']
      end

      if attributes.has_key?(:'foursquareCheckinGender')
        self.foursquare_checkin_gender = attributes[:'foursquareCheckinGender']
      end

      if attributes.has_key?(:'foursquareCheckinAge')
        self.foursquare_checkin_age = attributes[:'foursquareCheckinAge']
      end

      if attributes.has_key?(:'hours')
        if (value = attributes[:'hours']).is_a?(Array)
          self.hours = value
        end
      end

      if attributes.has_key?(:'locationLabels')
        if (value = attributes[:'locationLabels']).is_a?(Array)
          self.location_labels = value
        end
      end

      if attributes.has_key?(:'instagramContentType')
        self.instagram_content_type = attributes[:'instagramContentType']
      end

      if attributes.has_key?(:'googleActionType')
        if (value = attributes[:'googleActionType']).is_a?(Array)
          self.google_action_type = value
        end
      end

      if attributes.has_key?(:'googleQueryType')
        if (value = attributes[:'googleQueryType']).is_a?(Array)
          self.google_query_type = value
        end
      end

      if attributes.has_key?(:'platforms')
        if (value = attributes[:'platforms']).is_a?(Array)
          self.platforms = value
        end
      end

      if attributes.has_key?(:'maxSearchFrequency')
        self.max_search_frequency = attributes[:'maxSearchFrequency']
      end

      if attributes.has_key?(:'foursquareCheckinType')
        self.foursquare_checkin_type = attributes[:'foursquareCheckinType']
      end

      if attributes.has_key?(:'searchTerm')
        self.search_term = attributes[:'searchTerm']
      end

      if attributes.has_key?(:'folderId')
        self.folder_id = attributes[:'folderId']
      end

      if attributes.has_key?(:'foursquareCheckinTimeOfDay')
        self.foursquare_checkin_time_of_day = attributes[:'foursquareCheckinTimeOfDay']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          start_date == o.start_date &&
          location_ids == o.location_ids &&
          end_date == o.end_date &&
          search_type == o.search_type &&
          countries == o.countries &&
          min_search_frequency == o.min_search_frequency &&
          foursquare_checkin_gender == o.foursquare_checkin_gender &&
          foursquare_checkin_age == o.foursquare_checkin_age &&
          hours == o.hours &&
          location_labels == o.location_labels &&
          instagram_content_type == o.instagram_content_type &&
          google_action_type == o.google_action_type &&
          google_query_type == o.google_query_type &&
          platforms == o.platforms &&
          max_search_frequency == o.max_search_frequency &&
          foursquare_checkin_type == o.foursquare_checkin_type &&
          search_term == o.search_term &&
          folder_id == o.folder_id &&
          foursquare_checkin_time_of_day == o.foursquare_checkin_time_of_day
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [start_date, location_ids, end_date, search_type, countries, min_search_frequency, foursquare_checkin_gender, foursquare_checkin_age, hours, location_labels, instagram_content_type, google_action_type, google_query_type, platforms, max_search_frequency, foursquare_checkin_type, search_term, folder_id, foursquare_checkin_time_of_day].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
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
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
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
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
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
