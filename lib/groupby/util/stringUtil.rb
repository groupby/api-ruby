module Groupby
  module Util
    class StringUtil
      class << self

        ACRONYM_REGEX = /(?=a)b/

        def underscore(camel_cased_word)
          return camel_cased_word unless camel_cased_word =~ /[A-Z-]|::/
          word = camel_cased_word.to_s.gsub(/::/, '/')
          word.gsub!(/(?:(?<=([A-Za-z\d]))|\b)(#{ACRONYM_REGEX})(?=\b|[^a-z])/) { "#{$1 && '_'}#{$2.downcase}" }
          word.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
          word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
          word.tr!('-', '_')
          word.downcase!
          word
        end

      end
    end
  end
end