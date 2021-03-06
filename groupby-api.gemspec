# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'groupby/version'

Gem::Specification.new do |spec|
  spec.name          = 'groupby-api'
  spec.version       = Groupby::VERSION
  spec.authors       = ['Ben Teichman']
  spec.email         = ['ben.teichman@groupbyinc.com']

  spec.summary       = "prototype groupby API client"
  spec.homepage      = "https://github.com/groupby/api-ruby"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # dev dependencies
  spec.add_development_dependency 'bundler', '1.16.1'
  spec.add_development_dependency 'rake', '10.4.2'
  spec.add_development_dependency 'minitest', '5.7.0'
  spec.add_development_dependency 'require_all', '1.3.2'
  spec.add_development_dependency 'assert_json', '0.2.3'

  # runtime dependencies
  spec.add_runtime_dependency 'mime-types', '2.6.1'
  spec.add_runtime_dependency 'yajl-ruby', '1.3.1'
  spec.add_runtime_dependency 'abstraction', '0.0.4'
  spec.add_runtime_dependency 'activesupport', '4.2.3'
end
