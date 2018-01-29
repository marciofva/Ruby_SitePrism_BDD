After do |scenario|
    timestamp = "#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}"
    screenshot_name = "screenshot-#{scenario.name}-#{timestamp}.png"

    Dir.mkdir('screenshot') unless Dir.exist?('screenshot')

    #It aims to wait the load of the page to take a screenshot regarding "success" scenarios
    if !scenario.failed?
        sleep(4)
    end

    sufix = ('failed' if scenario.failed?) || 'success'
    name = scenario.name.tr(' ', '_').downcase

    page.save_screenshot("screenshot/#{sufix}-#{name}-#{timestamp}.png")
    embed("screenshot/#{sufix}-#{name}-#{timestamp}.png", 'image/png', 'SCREENSHOT')
end