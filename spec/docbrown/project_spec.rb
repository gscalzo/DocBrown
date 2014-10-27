require 'spec_helper'
require 'fileutils'
require 'pathname'
require 'yaml'

describe DocBrown::ProjectFinder do
  describe "#prjname" do
    let (:project_finder) { described_class.new(DUMMY_DOCBROWN_PRJPATH) }
    it "finds project given correct path" do 
      expect(project_finder.prjfullname).to eq DUMMY_DOCBROWN_PRJNAME
    end
    it "finds name of theproject given correct path" do 
      expect(project_finder.prjname).to eq DUMMY_DOCBROWN_NAME
    end
  end

  describe "#prjfullname" do
    let (:project_finder) { described_class.new("directory_without_any_project") }
    it "raises an exception if none is found" do 
      expect {project_finder.prjfullname}.to raise_error
    end
    it "raises an exception if none is found" do 
      expect {project_finder.prjname}.to raise_error
    end
  end
end