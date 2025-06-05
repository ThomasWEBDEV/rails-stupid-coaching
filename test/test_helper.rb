ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# Cette classe est utilisée pour charger les fixtures par défaut
class ActiveSupport::TestCase
  fixtures :all
end

# Configuration de Capybara pour les tests système avec Chrome sans interface (headless)
Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[no-sandbox headless disable-gpu window-size=1400,900]
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Dossier où seront enregistrées les captures d'écran des tests
Capybara.save_path = Rails.root.join("tmp/capybara")

# On indique que tous les tests système utiliseront ce driver
Capybara.javascript_driver = :headless_chrome
