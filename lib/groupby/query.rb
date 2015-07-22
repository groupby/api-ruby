require 'json'

module Groupby
  # noinspection RubyTooManyInstanceVariablesInspection
  class Query

    attr_accessor :query, :skip, :page_size, :collection, :area, :biasing_profile, :language, :sort,
                  :custom_url_params, :navigations, :fields, :or_fields, :prune_refinements, :disable_autocorrection,
                  :wildcard_search_enabled, :restrict_navigation, :match_strategy
    # :return_binary

    module Symbol
      DOT = '.'
      DOUBLE_DOT = '..'
      EQUAL = '='
      COLON = ':'
      AMPERSAND = '&'
      SLASH = '/'
    end

    TILDE_REGEX = '/~((?=[\\w]*[=:])/'

    def initialize
      @skip = 0
      @page_size = 10
      @custom_url_params = Array.new
      @navigations = Array.new
      @sort = Array.new
      @fields = Array.new
      @or_fields = Array.new
      @prune_refinements = true
      @disable_autocorrection = false
      @wildcard_search_enabled = false
    end

    private def request_to_json(request)
              # TODO catch exceptions
      request.to_json
    end

    def get_bridge_json(client_key)
      data = populate_request(client_key)
      request_to_json(data)
    end

    def get_bridge_refinements_json(client_key, navigation_name)
      data = Request::RefinementsRequest.new
      data.original_query = populate_request(client_key)
      data.navigation_name = navigation_name
      request_to_json(data)
    end

    private def populate_request(client_key)
      request = Request::Request.new
      request.client_key = client_key
      request.area = @area
      request.collection = @collection
      request.query = @query
      request.sort = @sort
      request.fields = @fields
      request.or_fields = @or_fields
      request.language = @language
      request.biasing_profile = @biasing_profile
      request.page_size = @page_size
      request.skip = @skip
      request.custom_url_params = @custom_url_params
      request.refinements = generate_selected_refinements(@navigations)
      request.restrict_navigation = @restrict_navigation

      prune_refinements = @prune_refinements
      if !prune_refinements.nil? && !prune_refinements
        request.prune_refinements = false
      end

      disable_autocorrection = @disable_autocorrection
      if !disable_autocorrection.nil? && disable_autocorrection
        request.disable_autocorrection = true
      end

      wildcard_search_enabled = @wildcard_search_enabled
      if !wildcard_search_enabled.nil? && wildcard_search_enabled
        request.wildcard_search_enabled = true
      end

      # return_binary = self.return_binary
      # if defined? return_binary && return_binary
      #   request.return_binary = true
      # end

      request
    end

    private def generate_selected_refinements(navigations)
      refinements = Array.new
      navigations.each { |navigation|
        navigation.refinements.each { |refinement|
          case refinement.type
            when Refinement::Type::RANGE
              selected_refinement_range = SelectedRefinementRange.new
              selected_refinement_range.navigation_name = navigation.name
              selected_refinement_range.low = refinement.low
              selected_refinement_range.high = refinement.high
              selected_refinement_range.exclude = refinement.exclude

              refinements.push(selected_refinement_range)
            else # Refinement::Type::VALUE
              selected_refinement_value = SelectedRefinementValue.new
              selected_refinement_value.navigation_name = navigation.name
              selected_refinement_value.value = refinement.value
              selected_refinement_value.exclude = refinement.exclude

              refinements.push(selected_refinement_value)
          end
        }
      }
      refinements
    end

    def get_bridge_json_ref_search(client_key)
      data = Request::Request.new
      data.client_key = client_key
      data.collection = @collection
      data.area = @area
      data.refinement_query = @query

      wildcard_search_enabled = @wildcard_search_enabled
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
      sort.field = field
      sort.order = order
      @sort = sort
    end

    def add_custom_url_param_by_name(name, value)
      param = CustomUrlParam.new
      param.key = name
      param.value = value
      add_custom_url_param(param)
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
          if (!refinement_string.empty?) || '=' == refinement_string
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
              refinement.low = value[0]
              refinement.high = ''
            elsif name_value[1].start_with?(Symbol::DOUBLE_DOT)
              value = name_value[1].split(Symbol::DOUBLE_DOT)
              refinement.low = ''
              refinement.high = value[1]
            else
              low_high = name_value[1].split(Symbol::DOUBLE_DOT)
              refinement.low = low_high[0]
              refinement.high = low_high[1]
            end
          else
            name_value = refinement_string.split(Symbol::EQUAL, 2)
            refinement = RefinementValue.new
            refinement.set_value(name_value[1])
          end
          unless name_value[0].empty?
            add_refinement(name_value[0], refinement)
          end
        }
      end
    end

    def add_refinement(navigation_name, refinement)
      if defined? @navigations[navigation_name]
        navigation = @navigations[navigation_name]
      else
        navigation = Navigation.new
        navigation.name = navigation_name
        navigation.range = refinement.range
        @navigations[navigation_name] = navigation
      end

      refinements = navigation.refinements
      refinements.push(refinement)
      navigation.refinements = refinements
    end

    def add_range_refinement(navigation_name, low, high, exclude = false)
      refinement = RefinementRange.new
      refinement.low = low
      refinement.high = high
      refinement.exclude = exclude
      add_refinement(navigation_name, refinement)
    end

    def add_value_refinement(navigation_name, value, exclude = false)
      refinement = RefinementValue.new
      refinement.value = value
      refinement.exclude = exclude
      add_refinement(navigation_name, refinement)
    end

    def get_refinement_string
      unless defined? @navigations
        builder = ''
        @navigations.each { |n|
          n.refinements.each { |r|
            builder += "~#{n.get_name}#{r.to_tilde_string}"
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
          builder += "~#{c.key}=#{c.value}"
        }
        if builder.length > 0
          builder
        end
      end
    end

  end
end