# frozen_string_literal: true

require "childprocess"
require "capybara"
require "capybara/dependency_checker"
require "rack/handler"

Capybara::Thruster::DependencyChecker.call

# Replaces the default Puma server on CAPYBARA_SERVER_PORT port with Thruster server.
# Requests are proxied to the Puma server running on the internal port (CAPYBARA_SERVER_PORT + 1).
Capybara.register_server :thruster do |app, port, host, **options|
  puma_port = port + 1

  process = ChildProcess.build("bundle", "exec", "thrust", "ruby", "-e", "sleep")
  process.environment["TARGET_PORT"] = puma_port.to_s
  process.environment["HTTP_PORT"] = port.to_s

  # Additional environment variables
  options.fetch(:env, {}).each { |k, v| process.environment[k.to_s] = v.to_s }

  process.io.inherit! if options.delete(:debug) == true
  process.start

  at_exit { process.stop }

  puma_options = options.fetch(:puma_options, {Silent: true})
  Capybara.servers[:puma].call(app, puma_port, host, **puma_options)
end
