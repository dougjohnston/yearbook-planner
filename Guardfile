# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'minitest' do
  # with Minitest::Unit
  watch(%r|^test/(.*)\/?_test(.*)\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "test/lib/#{m[1]}_test#{m[2]}.rb" }
  watch(%r|^lib/(.*)\.rb|)     { |m| "test/lib/#{m[1]}_test#{m[2]}.rb" }
  watch(%r|^test/minitest_helper\.rb|)    { "test" }
  watch(%r|^test/factories/(.*).rb|)    { |m| "test/unit/#{m[1]}_test.rb" }
  watch(%r|^test/factories/(.*).rb|)    { |m| "test/unit/#{m[1]}" }

  # Rails 3.2
  watch(%r|^app/controllers/application_controller.rb|)    { "test" }
  watch(%r|^config/routes.rb|)         { "test/routes" }
  watch(%r|^app/controllers/(.*)\.rb|) { |m| "test/functional/#{m[1]}_test.rb" }
  watch(%r|^app/helpers/(.*)\.rb|)     { |m| "test/unit/helpers/#{m[1]}_test.rb" }
  watch(%r|^app/models/(.*)\.rb|)     { |m| "test/unit/#{m[1]}_test.rb" }  
  watch(%r|^app/models/(.*)\.rb|)       { |m| "test/unit/#{m[1]}" }  
end
