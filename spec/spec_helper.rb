
# Configuration for watir-rspec
require "watir/rspec"
require 'webdrivers'
require 'screen-recorder'

RSpec.configure do |config|

  # Use Watir::RSpec::HtmlFormatter to get links to the screenshots, html and
  # all other files created during the failing examples.
  config.add_formatter(:progress) if config.formatters.empty?
  config.add_formatter(Watir::RSpec::HtmlFormatter)

  # Open up the browser before suite example.
  config.prepend_before :each do |config|
    full_description = config.metadata[:full_description]

    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime}: #{full_description} ---- #{msg}\n"
    end
    @logger.info "Starting Browser"

    @browser = Watir::Browser.new

    # recording_name = full_description.gsub(/\s/, '-').downcase + '.mp4'
    # ScreenRecorder.logger.level = Logger::DEBUG
    # @recorder = ScreenRecorder::Desktop.new(output: "spec/artifacts/recordings/#{recording_name}")
    # @recorder.start
  end

  # Close that browser after suite example.
  config.after :each do |config|
    @logger.info "Closing Browser"
    # @recorder.stop
    # @recorder.delete unless config.exception
    @browser.close if @browser
  end

  # Include RSpec::Helper into each of your example group for making it possible to
  # write in your examples instead of:
  #   @browser.goto "localhost"
  #   @browser.text_field(name: "first_name").set "Bob"
  #
  # like this:
  #   goto "localhost"
  #   text_field(name: "first_name").set "Bob"
  #
  # This needs that you've used @browser as an instance variable name in
  # before :all block.
  # config.include Watir::RSpec::Helper

  # Include RSpec::Matchers into each of your example group for making it possible to
  # use #within with some of RSpec matchers for easier asynchronous testing:
  #   expect(@browser.text_field(name: "first_name")).to exist.within(2)
  #   expect(@browser.text_field(name: "first_name")).to be_present.within(2)
  #   expect(@browser.text_field(name: "first_name")).to be_visible.within(2)
  #
  # You can also use #during to test if something stays the same during the specified period:
  #   expect(@browser.text_field(name: "first_name")).to exist.during(2)
  config.include Watir::RSpec::Matchers
end
