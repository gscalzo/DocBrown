require 'bundler/setup'
require 'docbrown'
require 'pry'

DUMMY_DOCBROWN_PATH = File.expand_path('../dummy', __FILE__)
DUMMY_DOCBROWN_TEST_PATH = File.expand_path('../test_dummy', __FILE__)
DUMMY_DOCBROWN_TEST_PROJECT_PATH = File.join(DUMMY_DOCBROWN_TEST_PATH, 'Dummy/Dummy.xcodeproj')
FileUtils.rm_rf(DUMMY_DOCBROWN_TEST_PATH)
FileUtils.cp_r(DUMMY_DOCBROWN_PATH, DUMMY_DOCBROWN_TEST_PATH)
DUMMY_DOCBROWN_TEST_PROJECT = DocBrown::Project.open(DUMMY_DOCBROWN_TEST_PROJECT_PATH)

RSpec.configure do |config|
end