require 'json'

module Groupby
  # noinspection RubyTooManyInstanceVariablesInspection
  class Query

    attr_accessor :query, :skip, :page_size, :collection, :area, :biasing_profile, :language, :sort,
                  :custom_url_params, :navigations, :fields, :or_fields, :prune_refinements, :disable_autocorrection,
                  :wildcard_search_enabled, :restrict_navigation, :match_strategy
    # :return_binary

    module Symbol
      TILDE = '~'
      DOT = '.'
      DOUBLE_DOT = '..'
      EQUAL = '='
      COLON = ':'
      AMPERSAND = '&'
      SLASH = '/'
    end

    self.custom_url_params = Array.new
    self.navigations = Array.new
    self.sort = Array.new
    self.fields = Array.new
    self.or_fields = Array.new
    self.prune_refinements = true
    self.disable_autocorrection = false
    self.wildcard_search_enabled = false

    TILDE_REGEX = '/~((?=[\\w]*[=:])/'

    private
    def request_to_json(request)
      # TODO catch exceptions
      JSON.generate(request)
    end

    def get_bridge_json(client_key)
      data = populate_request(client_key)
      request_to_json(data)
    end

    def get_bridge_refinements_json(client_key, navigation_name)
      data = RefinementsRequest.new
      data.original_query = populate_request(client_key)
      data.navigation_name = navigation_name
      request_to_json(data)
    end

    private
    def populate_request(client_key)
      request = Groupby::Api::Request::Request.new
      request.client_key = client_key
      request.area = self.area
      request.collection = self.collection
      request.query = self.query
      request.sort = self.sort
      request.fields = self.fields
      request.or_fields = self.or_fields
      request.language = self.language
      request.biasing_profile = self.biasing_profile
      request.page_size = self.page_size
      request.skip = self.skip
      request.custom_url_params = self.custom_url_params
      request.refinements = generate_selected_refinements(self.navigations)
      request.restrict_navigation = self.restrict_navigation

      prune_refinements = self.prune_refinements
      if defined? prune_refinements && !prune_refinements
        request.prune_refinements = false
      end

      disable_autocorrection = self.disable_autocorrection
      if defined? disable_autocorrection && disable_autocorrection
        request.disable_autocorrection = true
      end

      wildcard_search_enabled = self.wildcard_search_enabled
      if defined? wildcard_search_enabled && wildcard_search_enabled
        request.wildcard_search_enabled = true
      end

      # return_binary = self.return_binary
      # if defined? return_binary && return_binary
      #   request.return_binary = true
      # end

      request
    end

    private
    def generate_selected_refinements(navigations)
      refinements = Array.new
      for navigation in navigations
        for refinement in navigation.get_refinements
          case refinement.get_type
            when Refinement::Type::RANGE
              selected_refinement_range = SelectedRefinementRange.new
              selected_refinement_range
                  .set_navigation_name(navigation.get_name)
                  .set_low(refinement.get_low)
                  .set_high(refinement.get_high)
                  .set_exclude(refinement.is_exclude?)

              refinements.push(selected_refinement_range)
            else # Refinement::Type::VALUE
              selected_refinement_value = SelectedRefinementValue.new
              selected_refinement_value
                  .set_navigation_name(navigation.get_name)
                  .set_value(refinement.get_value)
                  .set_exclude(refinement.is_exclude?)

              refinements.push(selected_refinement_value)
          end
        end
      end
      refinements
    end

    def get_bridge_json_ref_search(client_key)
      data = Groupby::Api::Request::Request.new
      data.client_key = client_key
      data.collection = self.collection
      data.area = self.area
      data.refinement_query = self.query

      wildcard_search_enabled = self.wildcard_search_enabled
      if defined? wildcard_search_enabled && wildcard_search_enabled
        data.wildcard_search_enabled = wildcard_search_enabled
      end

      request_to_json(data)
    end

    def add_fields(fields)
      self.fields.concat(fields)
    end

    def add_field(name)
      self.fields.push(name)
    end

    def add_or_fields(fields)
      self.or_fields.concat(fields)
    end

    def add_or_field(name)
      self.or_fields.push(name)
    end

    def set_sort_by_field(field, order)
      sort = Sort.new
      self.sort = sort.set_field(field).set_order(order)
    end

    def add_custom_url_param_by_name(name, value)
      param = CustomUrlParam.new
      add_custom_url_param(param.set_key(name).set_value(value))
    end

    def add_custom_url_param(param)
      self.custom_url_params.push(param)
    end

    def split_refinements(refinement_string)
      if defined? refinement_string
        refinement_string.split(TILDE_REGEX, -1).compact
      else
        Array.new
      end
    end

    def add_refinements_by_string(refinements_string)
      unless defined? refinements_string
        refinement_strings = split_refinements(refinements_string)
        refinement_strings.each { |refinement_string|
          if (!defined? refinement_string) || '=' == refinement_string
            next
          end
          colon = refinement_string.index(Symbol::COLON)
          equals = refinement_string.index(Symbol::EQUAL)
          is_range = colon && !equals

          if is_range
            name_value = refinement_string.split(Symbol::COLON, 2)
            refinement = RefinementRange.new
            if name_value[1].end_with?(Symbol::DOUBLE_DOT)
              value = name_value[1].split(Symbol::DOUBLE_DOT)
              refinement
                  .set_low(value[0])
                  .set_high('')
            elsif name_value[1].start_with?(Symbol::DOUBLE_DOT)
              value = name_value[1].split(Symbol::DOUBLE_DOT)
              refinement
                  .set_low('')
                  .set_high(value[1])
            else
              low_high = name_value[1].split(Symbol::DOUBLE_DOT)
              refinement
                  .set_low(low_high[0])
                  .set_high(low_high[1])
            end
          else
            name_value = refinement_string.split(Symbol::EQUAL, 2)
            refinement = RefinementValue.new
            refinement.set_value(name_value[1])
          end
          unless defined? name_value[0]
            add_refinement(name_value[0], refinement)
          end
        }
      end
    end

    def add_refinement(navigation_name, refinement)
      if defined? self.navigations[navigation_name]
        navigation = self.navigations[navigation_name]
      else
        navigation = Navigation.new
        navigation.set_name(navigation_name).set_range(refinement.is_range?)
        self.navigations[navigation_name] = navigation
      end

      refinements = navigation.get_refinements
      refinements.push(refinement)
      navigation.set_refinements(refinements)
    end

    def add_range_refinement(navigation_name, low, high, exclude = false)
      refinement = RefinementRange.new
      add_refinement(navigation_name, refinement.set_low(low).set_high(high).set_exclude(exclude))
    end

    def add_value_refinement(navigation_name, value, exclude = false)
      refinement = RefinementValue.new
      add_refinement(navigation_name, refinement.set_value(value).set_exclude(exclude))
    end

    def get_refinement_string
      unless defined? self.navigations
        builder = ''
        self.navigations.each { |n|
          n.get_refinements.each { |r|
            builder + Symbol::TILDE + n.get_name + r.to_tilde_string
          }
        }
        if builder.length > 0
          builder
        end
      end
    end

    def get_custom_url_params_string
      unless defined? self.custom_url_params
        builder = ''
        self.custom_url_params.each { |c|
          builder + Symbol::TILDE + c.get_key + Symbol::EQUAL + c.get_value
        }
        if builder.length > 0
          builder
        end
      end
    end

  end
end