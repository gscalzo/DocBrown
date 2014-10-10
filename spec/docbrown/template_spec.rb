require 'spec_helper'

describe DocBrown::TemplateFinder do
  describe '#template_path' do
    let (:finder) { described_class.new }

    it "returns the list of the available templates" do
        expect(finder.templates_for('view')).to eq view_templates
    end
  end


  def view_templates
      ["<%= viewname %>ViewController+Layout.swift", 
        "<%= viewname %>ViewController+Render.swift", 
        "<%= viewname %>ViewController+Setup.swift", 
        "<%= viewname %>ViewController+Style.swift", 
        "<%= viewname %>ViewController+TableView.swift", 
        "<%= viewname %>ViewController+TextFieldDelegate.swift", 
        "<%= viewname %>ViewController.swift", 
        "<%= viewname %>ViewModel.swift"]
  end

end