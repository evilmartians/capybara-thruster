# frozen_string_literal: true

require "test_helper"
require "net/http"

class CapybaraTest < Minitest::Test
  def setup
    @app = proc { |_env| [200, {}, ["Hello Server!"]] }
    Capybara.server = :thruster, {debug: ENV["DEBUG"] == "1"}
  end

  attr_reader :app

  def teardown
    Capybara.server_host = nil
    Capybara.server_port = nil
  end

  def test_bind_to_specified_host
    Capybara.server_host = "127.0.0.1"
    server = Capybara::Server.new(app).boot
    res = Net::HTTP.get(URI("http://127.0.0.1:#{server.port}"))
    assert_equal "Hello Server!", res

    Capybara.server_host = "0.0.0.0"
    server = Capybara::Server.new(app).boot
    res = Net::HTTP.get(URI("http://127.0.0.1:#{server.port}"))
    assert_equal "Hello Server!", res
  end

  def test_use_specified_port
    Capybara.server_port = 22789
    server = Capybara::Server.new(app).boot
    res = Net::HTTP.start(server.host, 22789) { |http| http.get("/") }
    assert_includes res.body, "Hello Server"
  end

  def test_use_given_port
    server = Capybara::Server.new(app, port: 22792).boot
    res = Net::HTTP.start(server.host, 22792) { |http| http.get("/") }
    assert_includes res.body, "Hello Server"
  end
end
